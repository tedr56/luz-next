require 'gui_selected_behavior'

# HACK to render an object without reparenting it
class GuiObjectRenderer < GuiObject
	callback :clicked
	callback :double_clicked

	attr_reader :object

	def initialize(object)
		@object = object
	end

	def ==(object)		# useful for being found in lists, etc.
		super || (@object == object)
	end

	def gui_render!
		return if hidden?
		gui_render_background
		if @object.respond_to? :gui_render!
			@object.gui_render!		# TODO: send a symbol for customizable render method (ie simple curves)
		else
			with_color([rand,rand,rand,1]) {
				unit_square
			}
		end
	end

	def gui_tick!
		@object.gui_tick! if @object.respond_to? :gui_tick!
	end

	def click(pointer)
		clicked_notify(pointer)
	end

	def double_click(pointer)
		double_clicked_notify(pointer)
	end
end
