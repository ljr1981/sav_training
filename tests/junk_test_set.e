note
	description: "[
		Tests for "junk" classes as-needed.
	]"
	testing: "type/manual"

class
	JUNK_TEST_SET

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

	junk_tests
			-- New test routine
		local
			l_point: JAVA_POINT
		do
			create l_point.make_at_origin
			create l_point.make_at_x_y (10, 20)
			create l_point.make_with_companion (create {JAVA_POINT}.make_at_origin)
		end

end


