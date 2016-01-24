note
	description: "A few `Coding Conventions for Eiffel'."
	synopsis: "[
		This class is here to demonstrate various coding conventions we have
		come to use over the past 5 1/2 years. Enjoy!
		]"

class
	CODING_CONVENTIONS

feature -- Convention Examples

	use_short_name,
	instead_of_extremely_long_names_like_this_one_which_are_unweildy,
	AndCamelCaseIsNotMuchBetterReally,
	EvenShortOnes,
	but_this_is_okay,
	or_even_this: ANY
			-- How to and how to not build feature names.
		note
			synopsis: "[
				(1) Be as short and terse with names as you can.
				(2) Name things for the long haul. Your code might be here awhile!
				(3) You will find the Eiffel libraries do not use CamelCase or camelCase.
				(4) We find that underscores are just easier on the eyes.
				]"
		attribute
			create Result
		end

	when_passing_arguments (a_like_this_one: INTEGER)
			-- We like to prefix the argument with an `a_'.
		note
			synopsis: "[
				We like do this because names that start with `a_' are
				now easily recognized in code as one of the `a_arguments'
				being passed in to the routine we're looking at.
				]"
		local
			l_number: INTEGER -- Like arguments, we like to start locals with an `l_' so they are easy to spot too!
			i, j, k: INTEGER -- However, we do not prefix simple indexing local variables because `l_i' just looks weird!
		do
			l_number := 1_000_000 - a_like_this_one
						-- Oh yes: You can use the underscore
						-- to make numbers more readable too!
		end

	lets_talk_about_loops
			-- We will look at the "from-loop", which is something like a "for-loop".
		note
			synopsis: "[
				Below is a simple from loop.
				(1) The "from" "code-block" is a prepatory block of code--that is--it prepares
					for iteratin of the loop, but itself is only executed once.
				(2) The "until" BOOLEAN expression stops the loop iteration when it is True.
				(3) The code between "loop" and "end" is what get executed iteratively.
				
				QUESTION: Why not "while" instead of "until". Well, because the notion of
							"until" is logically easier to think with than "while". Why?
							Because "while" is negative logic--that is--the "while" only
							stops the loop when the BOOLEAN expression becomes False.
							People think better (and produce less bugs) when they use
							positive logic--aka "do this until that is True!"
				]"
			be_aware: "[
				You do not need to use a numeric counter. 
				You can stop the loop with any form of BOOLEAN!
				]"
		local
			i: INTEGER -- Again--we will just use `i' because it is a common counter and easily understood.
			l_my_condition,
			l_is_done,
			l_is_complete: BOOLEAN -- We can do the comma-delimited declarations as well, which is handy.
		do
				-- First example
			from
				i := 1
			until
				i > 100
			loop
				-- Do some other thing here
				-- ... there
				-- ... and everywhere

				i := i + 1 -- NOTE: YOU are responsible for incrementing/decrementing your own counter!
			end
			--======================================
				-- The same thing, another way ...
			from i := 1 until i > 100 loop
				-- Do some code ...
				i := i + 1
			end
			--======================================
				-- And yet another ...
			from i := 1_000 until l_my_condition loop
				i := i - 1
				l_my_condition := i < 0
			end
		end

	how_not_to_name_things
			-- We do not generally include the class type of a thing in its name.
		note
			synopsis: "[
				It is considered bad-form to put type names in the feature names.
				Why? Because what if the type of the feature changes? Then the name
				is no longer correct. Also--what if the feature name is polymorphic
				assignment, where the actual attached object has a completely different
				name? So--we want to name according to purpose (semantics) and not
				data type.
				]"
		local
			l_string: STRING -- does not tell the story of why `l_string' is here.
			l_name: STRING -- tells a much better semantic story.
			l_flag: BOOLEAN -- might seem okay, but all BOOLEANs are flags, but a flag for what?
			l_is_okay: BOOLEAN -- this is not much better, but context might dictate.
			l_is_finished: BOOLEAN -- tells a proper story even without seeing used.
			l_boolean: BOOLEAN -- really??? awww, come one now ...
			l_integer: INTEGER -- kind of the same slop, right?
			l_you_get_the_point: BOOLEAN -- True or False? :-)
		do
			if l_you_get_the_point then
				-- YAY!
			else
				-- Read the locals again! HA!
			end
		end

	quick_note_about_semi_colons
			-- They are the rare exception
		note
			synopsis: "[
				In Eiffel, we don't need semicolons at the end of lines.
				We can use them, if needed, but the need for them is rare.
				However, if you have a hard time breaking the habit, no worries--
				Eiffel still accepts them (but we hope you'll be okay not typing
				them!).
				]"
		local
			this,is,no,good,nor,either,cuz,its,hard,too,to,read: BOOLEAN
			we,dont,need,right,what,see,want: BOOLEAN
		do
				-- Cramming everything on one line is not really good form; hard to read ...
			this := is; no := good; nor := this; either := cuz; its := hard; too := read;

				-- Also ...
			we := dont;
			need := this;
			either := right; -- Why? Because semicolons just make things messy

				-- Instead
			what := we
			want := to
			see := is
			this := cuz
			its := good -- Every statement on its own line. Easier to ready, yes?
		end

end
