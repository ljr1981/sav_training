note
	synopsis: "[
		A simple static web site example.
		]"
	EIS: "name=EWF", "src=https://github.com/Eiffel-World/Eiffel-Web-Framework"
	EIS: "name=navigate_to", "src=http://localhost:9090/hello"

class
	SIMPLE_WEB

inherit
	WSF_DEFAULT_SERVICE [HELLO_EXECUTION]
		redefine
			initialize
		end

create
	make_and_launch

feature {NONE} -- Initialization

	initialize
			-- Initialize current service.
		do
			set_service_option ("port", 9090)
		end

end
