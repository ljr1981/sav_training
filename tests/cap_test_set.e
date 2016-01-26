note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	CAP_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	cap_tests
		local
			l_cap: CERTIFIED_ATTACHMENT_PATTERNS
		do
			create l_cap
			l_cap.cap_able_expressions
			l_cap.local_variables

				-- Stable Attributes
			assert_32 ("void", not attached l_cap.my_stable_string)
			l_cap.set_my_stable_string ("abc")
			assert_32 ("not_void", attached l_cap.my_stable_string)
			-- l_cap.set_my_stable_string (Void) -- NOTE: The compiler catches this error based on the stable option notation.

				-- Simple and familiar
			l_cap.simple_and_familiar

				-- Local variables

				-- Common CAPs


		end

feature {NONE} -- Implementation

	caps: CERTIFIED_ATTACHMENT_PATTERNS
			-- `caps' for Current
		once
			create Result
		end

end


