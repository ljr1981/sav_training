note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	testing: "type/manual"

class
	SIMPLE_WEB_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	web_simple_tests
			-- New test routine
		note
			testing:
				"covers/{SIMPLE_WEB}",
				"covers/{SIMPLE_WEB}.initialize"
		do
			do_nothing
		end

end


