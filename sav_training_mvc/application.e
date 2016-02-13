note
	synopsis: "[
		A simple example of the higher concept of MVC implemented
		in Eiffel with the use of agents as "controller" elements.
		]"
class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		note
			MVC: "[
				At a high-level, this feature shows off MVC quite well!
				
				Model
				-----
				`application' represents one form of "model" in the MVC paradigm.
				
				View
				----
				The `main_window' has all of our "view" elements of the MVC paradigm.
				
				Controller
				----------
				We have two "controller" elements: agents for the main window "show"
				and for the application "destroy". When the application is done launching
				(e.g. setting up the "event loop"), that "event" will fire the agent for
				showing the main window on the screen. When the user clicks the close
				button on the main window ("view"), the agent "controller" will be called
				on the windows "close_request_actions" and the `destroy' "model" code
				will execute, effectively shutting down our application.
				
				Observations
				============
				(1) Please appreciate the simplicity and elegance of this form of MVC!
					Compare it to other forms, which are not nearly as simple nor are
					they flexible. In fact, they are the source of great complexity in
					terms of reuse and maintainablity (we can talk about this more as
					everyone likes and wants).
				]"
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
			-- `application' contains the "event loop" which `main_window' runs within.

	main_window: SAMPLE_MAIN_WINDOW
			-- `main_window' is "main" application window.

end
