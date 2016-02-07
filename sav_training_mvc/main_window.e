note
	EIS: "name=MVC", "src=$GITHUB/sav_training/docs/Model–view–controller.pdf"
	MVC: "[
		Model-View-Controller Example in Eiffel
		=======================================
		
		Model
		-----
		The model (in this example) is the `display_information' feature.
		Note that this code does NOT have to be a part of this class! We
		could put "model" code anywhere. As a matter of fact, we do expect
		model code to be in some other class than our GUI UX classes (such
		as this class).
		
		View
		----
		This visual classes referenced in this class (which is also visual
		as the `main_window') are the "view" of the MVC. They also have
		the "triggering" elements of the view (e.g. button clicks, keystrokes
		and so on).
		
		Controller
		----------
		Finally--the "controller" part of MVC is represented here as the
		"agents". Please find those on `button_a' and `button_b' in the
		`initialize'. The controllers will make calls (e.g. "manipulate")
		on the model (i.e. just the `display_information' feature below).
		
		Create Interface Objects
		------------------------
		We redefine this feature from EV_TITLE_WINDOW. This feature
		is where we create every "visual" object that will appear on
		the observable window displayed on the screen.
		
		Initialize
		----------
		The `initialize' feature always follows the `create_interface_objects'
		feature. This is where we accomplish several tasks:
		
		(1) Displayable objects get sizing, colorizing, text, and other
			matters handled at this stage.
			
		(2) The objects are placed in their containers. There are a
			number of available containers: (a) expandable vertical
			and horizonal boxes, (b) fixed size, (c) tables, and so on.
			
		(3) Finally--we place our primary container (e.g. `main_box')
			into the {EV_CELL} of the {MAIN_WINDOW} (Current).
			
		(4) We can also add an "icon" to the window (e.g. meetup.png).
		
		Other Observations
		------------------
		(1) We do NOT require a "visual builder". While it is useful
			to see a visual result of our work for the purpose of checking
			our work, a visual builder is incapable of properly representing
			visual components where inheritance, generics, and polymorphism
			is involved. A visual builder will also NOT provide you with
			an adequate "view" of visual elements in expandable presentations.
			Visual builders only work well in fixed and tabular presentations.
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
			-- First--All of our visual elements are created here ...
		do
			Precursor
			create button_a
			create button_b
			create main_box
		end

	initialize
			-- <Precursor>
			-- Next--Our visual elements are formatted and then placed in the window ...
		local
			l_icon: EV_PIXMAP
			l_buffer: EV_PIXEL_BUFFER
		do
			Precursor

				-- The two agent-creations/additions are the "controller" of the MVC model.
			button_a.set_text ("Button A")
			button_a.select_actions.extend (agent display_information ("Pressed A button"))

			button_b.set_text ("Button B")
			button_b.select_actions.extend (agent display_information ("Pressed B button"))

				-- Put the buttons in the `main_box' ...
			main_box.extend (button_a)
			main_box.extend (button_b)

				-- Make some presentational adjustments to the container ...
			main_box.set_padding (3)
			main_box.set_border_width (3)

				-- Put the `main_box' (with its contained items) in the window (Current) ...
			extend (main_box)

				-- Add an icon to our {MAIN_WINDOW} ...
			create l_buffer
			l_buffer.set_with_named_file (".\images\meetup.png")
			create l_icon.make_with_pixel_buffer (l_buffer)
			set_icon_pixmap (l_icon)
		end

feature {NONE} -- Implementation: Event Handlers

		-- This is our lone "model" (we can have as many as we like) ...
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

		-- Along with the {MAIN_WINDOW}, these are our "view" elements ...
	button_a,
	button_b: EV_BUTTON

	main_box: EV_VERTICAL_BOX

end
