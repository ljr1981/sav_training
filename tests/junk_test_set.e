note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	JUNK_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	junk_tests
			-- New test routine
		local
			l_point: JAVA_POINT
		do
			assert ("not_implemented", False)
		end

end


