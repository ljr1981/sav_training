note
	EIS: "name=MVC", "src=$GITHUB/sav_training/docs/Model–view–controller.pdf"
	MVC: "[
		Model-View-Controller Example in Eiffel
		=======================================


		]"
class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make_with_title

feature {NONE} -- Initialization

	create_interface_objects
			-- <Precursor>
		do
			Precursor
			create button_a
			create button_b
			create main_box
		end

	initialize
			-- <Precursor>
		local
			l_icon: EV_PIXMAP
			l_buffer: EV_PIXEL_BUFFER
		do
			Precursor
			button_a.set_text ("Button A")
			button_a.select_actions.extend (agent display_information ("Pressed A button"))

			button_b.set_text ("Button B")
			button_b.select_actions.extend (agent display_information ("Pressed B button"))

			main_box.extend (button_a)
			main_box.extend (button_b)

			main_box.set_padding (3)
			main_box.set_border_width (3)

			extend (main_box)

			create l_buffer
			l_buffer.set_with_named_file (".\images\meetup.png")
			create l_icon.make_with_pixel_buffer (l_buffer)
			set_icon_pixmap (l_icon)
		end

feature {NONE} -- Implementation: Event Handlers

	display_information (a_message: STRING)
			-- `display_information' in `a_message' on the screen.
		local
			l_dialog: EV_INFORMATION_DIALOG
		do
			create l_dialog.make_with_text (a_message)
			l_dialog.set_size (200, 200)
			l_dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Implementation

	button_a,
	button_b: EV_BUTTON

	main_box: EV_VERTICAL_BOX


end
