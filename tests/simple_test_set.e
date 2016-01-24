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
			l_loops: VARIOUS_FORMS_OF_LOOPS
			l_conventions: CODING_CONVENTIONS
		do
			create l_product.make (["AB1000", "MADE UP PRODUCT NAME"])

			create l_loops
			l_loops.across_and_from_can_be_combined
			l_loops.basic_from_loop
			l_loops.bertrands_examples
			l_loops.iterate_over_an_arrayed_list
			l_loops.prevent_endless_loops
			l_loops.the_loop_invariant

			create l_conventions
			l_conventions.andcamelcaseisnotmuchbetterreally.do_nothing
			l_conventions.but_this_is_okay.do_nothing
			l_conventions.evenshortones.do_nothing
			l_conventions.how_not_to_name_things
			l_conventions.instead_of_extremely_long_names_like_this_one_which_are_unweildy.do_nothing
			l_conventions.lets_talk_about_loops
			l_conventions.or_even_this.do_nothing
			l_conventions.quick_note_about_semi_colons
			l_conventions.use_short_name.do_nothing
			l_conventions.when_passing_arguments (100)
		end

feature {NONE} -- Implementation

	session_docs: detachable SESSION_DOCS
			-- To bring `session_docs' "in-system" (what does this mean? :-) )
end


