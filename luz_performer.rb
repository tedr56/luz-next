#
# LuzPerformer connects a basic SDLApplication with the Luz $engine and $gui
#
# (This is the only file that should need to change when switching SDL to an alternative.)
#
require 'sdl_application'

class LuzPerformer < SDLApplication
	SDL_TO_LUZ_BUTTON_NAMES = {'`' => 'Grave', '\\' => 'Backslash', '[' => 'Left Bracket', ']' => 'Right Bracket', ';' => 'Semicolon', "'" => 'Apostrophe', '/' => 'Slash', '.' => 'Period', ',' => 'Comma', '-' => 'Minus', '=' => 'Equal', 'left ctrl' => 'Left Control', 'right ctrl' => 'Right Control'}

	# (hacks for reduced garbage / better performance)
	MOUSE_1_X = "Mouse 01 / X"
	MOUSE_1_Y = "Mouse 01 / Y"

	MOUSE_BUTTON_FORMAT = "Mouse %02d / Button %02d"
	MOUSE_1_BUTTON_FORMATTER = Hash.new { |hash, key| hash[key] = sprintf(MOUSE_BUTTON_FORMAT, 1, key) }

	def reload_code!
		change_count = $engine.reload
		$gui.reload_notify
		if change_count > 0
			$gui.positive_message "Reloaded #{change_count.plural('file', 'files')}."
		else
			$gui.positive_message "No modified source files found."
		end
	end

	def open_project(project_path)
		@switch_to_project_path = project_path
	end

	# public API is in baseclass

private

	def do_frame(time)
		$engine.do_frame(time)
		$engine.load_from_path(@switch_to_project_path) if @switch_to_project_path
		@switch_to_project_path = nil
	end

	def handle_sdl_event(event)
		case event
		# Mouse input
		when SDL::Event2::MouseMotion
			$engine.on_slider_change(MOUSE_1_X, (event.x / (@width - 1).to_f))
			$engine.on_slider_change(MOUSE_1_Y, (1.0 - (event.y / (@height - 1).to_f)))

		when SDL::Event2::MouseButtonDown
			$engine.on_button_down(MOUSE_1_BUTTON_FORMATTER[event.button], frame_offset=1)

		when SDL::Event2::MouseButtonUp
			$engine.on_button_up(MOUSE_1_BUTTON_FORMATTER[event.button], frame_offset=1)

		# Keyboard input
		when SDL::Event2::KeyDown
			key_name = SDL::Key.get_key_name(event.sym)
			button_name = sdl_to_luz_button_name(key_name)
			$engine.on_button_down(button_name, 1)	# 1 is frame_offset: use it on the coming frame
			$gui.raw_keyboard_input(sdl_to_gui_key(key_name, event)) if $gui

		when SDL::Event2::KeyUp
			key_name = SDL::Key.get_key_name(event.sym)
			button_name = sdl_to_luz_button_name(key_name)
			$engine.on_button_up(button_name, 1)		# 1 is frame_offset: use it on the coming frame

		when SDL::Event2::Quit
			finished!
		end
	end

	def sdl_to_luz_button_name(name)
		@sdl_to_luz_button_names ||= Hash.new { |hash, key| hash[key] = sprintf('Keyboard / %s', SDL_TO_LUZ_BUTTON_NAMES[key] || key.humanize) }
		@sdl_to_luz_button_names[name]
	end

	def sdl_to_gui_key(key_name, sdl_event)		# actually decorates the existing String ;P
		key_name.shift = ((sdl_event.mod & SDL::Key::MOD_SHIFT) > 0)
		key_name.control = ((sdl_event.mod & SDL::Key::MOD_CTRL) > 0)
		key_name.alt = ((sdl_event.mod & SDL::Key::MOD_ALT) > 0)
		key_name
	end

	def after_update
	end

	def after_run(seconds)
		puts sprintf('%d frames in %0.1f seconds = %dfps (~%dfps render loop)', $env[:frame_number], seconds, $env[:frame_number] / seconds, 1.0 / $engine.average_frame_time)
	end
end
