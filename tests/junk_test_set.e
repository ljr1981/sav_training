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

	creatable_person_test
		local
			l_person: JUNK_PERSON
			l_car: JUNK_CAR
			l_list: ARRAYED_LIST [JUNK_CREATABLE]
		do
			create l_person.make (["Larry", "J", "Rix", 53])
			create l_car.make (["Ford", "FUSION", "UYTYIUYDTFUYDF"])
			create l_car.make ("Ford", "FUSION", "JHGUYTUSHGDJHGSD")
			create l_list.make (10)
			l_list.force (l_person)
			l_list.force (l_car)
		end

end


