class GuiMainMenu < GuiBox
	callback :save, :close, :open, :new

	def initialize
		super
		create!
	end

	def create!
		self << @cancel_button = GuiButton.new.set(:scale_x => 0.05, :scale_y => 0.06, :offset_x => -0.475, :offset_y => 0.47, :background_image => $engine.load_image('images/buttons/main-menu-close.png'), :background_image_hover => $engine.load_image('images/buttons/main-menu-close-hover.png'), :background_image_click => $engine.load_image('images/buttons/main-menu-close-click.png'))
		@cancel_button.on_clicked { close_notify }

		self << @open_button = GuiButton.new.set(:scale_x => 0.05, :scale_y => 0.06, :offset_x => 0.475, :offset_y => 0.47, :background_image => $engine.load_image('images/buttons/main-menu-open.png'), :background_image_hover => $engine.load_image('images/buttons/main-menu-open-hover.png'), :background_image_click => $engine.load_image('images/buttons/main-menu-open-click.png'))
		@open_button.on_clicked { open_notify }

		self << @new_button = GuiButton.new.set(:scale => 0.05, :offset_x => 0.475, :offset_y => 0.4, :background_image => $engine.load_image('images/buttons/main-menu-new.png'), :background_image_hover => $engine.load_image('images/buttons/main-menu-new.png'), :background_image_click => $engine.load_image('images/buttons/main-menu-new.png'))
		@new_button.on_clicked { new_notify }

		self << (@text1 = BitmapFont.new.set({:string => 'Luz 2.0', :offset_x => -0.01, :offset_y => 0.335, :scale_x => 0.1, :scale_y => 0.07}))
		self << (@text2 = BitmapFont.new.set({:string => 'Early Access Edition', :offset_x => -0.05, :offset_y => 0.26, :scale_x => 0.1, :scale_y => 0.04}))

		self << @background = GuiButton.new.set(:offset_x => 0.00, :offset_y => 0.00, :scale_x => 0.10, :scale_y => 0.15, :background_image =>$engine.load_image('images/luz-icon-border.png'))
		self << @star_button = GuiButton.new.set(:offset_x => 0.00, :offset_y => 0.00, :scale_x => 0.07, :scale_y => 0.09, :background_image => $engine.load_image('images/luz-starflower.png'))
		@star_button.on_clicked { close_notify }		

		self << (@text3 = BitmapFont.new.set({:color => [0.8,0.8,1.0], :string => 'ian@openanswers.org', :offset_x => 0.135, :offset_y => -0.3, :scale_x => 0.58, :scale_y => 0.05}))

		self << (@cancel_text = BitmapFont.new.set({:color => [0.6,0.6,1.0], :string => 'play', :offset_x => -0.39, :offset_y => 0.48, :scale_x => 0.1, :scale_y => 0.04}))
		self << (@quit_text = BitmapFont.new.set({:color => [0.6,0.6,1.0], :string => 'quit', :offset_x => -0.39, :offset_y => -0.48, :scale_x => 0.1, :scale_y => 0.04}))
		self << (@open_text = BitmapFont.new.set({:color => [0.6,0.6,1.0], :string => 'open', :offset_x => 0.45, :offset_y => 0.48, :scale_x => 0.1, :scale_y => 0.04}))
		self << (@save_text = BitmapFont.new.set({:color => [0.6,0.6,1.0], :string => 'save', :offset_x => 0.45, :offset_y => -0.48, :scale_x => 0.1, :scale_y => 0.04}))

		self << @save_button = GuiButton.new.set(:scale_x => 0.05, :scale_y => 0.06, :offset_x => 0.475, :offset_y => -0.47, :background_image => $engine.load_image('images/buttons/main-menu-save.png'), :background_image_hover => $engine.load_image('images/buttons/main-menu-save-hover.png'), :background_image_click => $engine.load_image('images/buttons/main-menu-save-click.png'))
		@save_button.on_clicked { save_notify ; close_notify }

		self << @quit_button = GuiButton.new.set(:scale_x => 0.05, :scale_y => 0.06, :offset_x => -0.475, :offset_y => -0.47, :background_image => $engine.load_image('images/buttons/main-menu-quit.png'), :background_image_hover => $engine.load_image('images/buttons/main-menu-quit-hover.png'), :background_image_click => $engine.load_image('images/buttons/main-menu-quit-click.png'))
		@quit_button.on_clicked { $application.finished! }
	end
end
