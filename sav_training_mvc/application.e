class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create application
			create main_window.make_with_title ("Savannah Software Engineering Meetup Group")

			application.post_launch_actions.extend (agent main_window.show)
			main_window.close_request_actions.extend (agent application.destroy)

			main_window.set_size (800, 600)

			application.launch
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION
			-- This is the thing with the event loop.

	main_window: MAIN_WINDOW
			-- Main application window.

end
