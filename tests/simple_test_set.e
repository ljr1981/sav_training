note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	SIMPLE_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature -- Test routines

	simple_test_routine
			-- New test routine
		local
			l_simple: SIMPLEST_BUT_NOT_VERY_USEFUL_CLASS
			l_product: PRODUCT
		do
			do_nothing
		end

end


