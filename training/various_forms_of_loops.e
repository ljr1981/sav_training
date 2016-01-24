note
	description: "[
		In this Training Class, we're going to examine various forms of loops.
		]"

class
	VARIOUS_FORMS_OF_LOOPS

feature -- From Loops

	basic_from_loop
			-- A `basic_from_loop'.
		note
			synopsis: "[
				Below is a loop that simply counts from 1 to 1,000
				]"
		local
			i: INTEGER
		do
			from i := 1
			until i > 1_000
			loop
				print (i.out)
				i := i + 1
			end
		end

	iterate_over_an_arrayed_list
			-- How to `iterate_over_an_arrayed_list'.
		note
			synpsis: "[
				An "across-loop" is something like a "for-each" in other languages.
				]"
		local
			l_names: ARRAYED_LIST [STRING]
			l_range: INTEGER_INTERVAL
		do
				-- First, make a list to iterate ...
			create l_names.make_from_array (<<"Fred", "Wilma", "Pebbles", "Barney", "Betty", "Bam-bam">>)
											-- The << .. >> is referred to as a "manifest array", which means
											-- the compiler sees the << as a signal telling it that an ARRAY is coming!
											-- The >> signals the end of the ARRAY. The ".." items in the list
											-- are a signal to the compiler that we have an ARRAY [STRING].
											-- An ARRAY [CHARACTER] is: <<'a', 'b', 'c'>>
											-- An ARRAY [INTEGER] is:	<<1, 2, 3, 4, 5>>
											-- An ARRAY [BOOLEAN] is: 	<<True, False, True, True>>
											-- An ARRAY [REAL] is: 		<<1.1, 2.7, 3.4, 5.1>>
											-- In all cases << signals ARRAY and the manifest type signals the [G] of ARRAY [G]

				-- Now lets go "across" the `l_names' list (i.e. iterate it) ...
			across l_names as ic_names loop
				print (ic_names.item)
			end

				-- We can go directly across manifest arrays too ...
			across <<"Fred", "Wilma", "Pebbles", "Barney", "Betty", "Bam-bam">> as ic loop
				print (ic.item)
			end
				-- or ...
			across <<0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100>> as ic loop
				print (ic.item.out + ",") -- Outputs: 0,10,20,30,40,50,60,70,80,90,100,
			end

				-- We can also iterate over or "go across" integers as well ...
			across 1 |..| 1_000 as ic loop
				print (ic.item.out) -- Outputs: 1 2 3 4 5 6 .. 1000
			end

				-- We can do this with a class too ...
			l_range := 1 |..| 1_000
			across l_range as ic loop -- Turns out, we can do this because {INTEGER_INTERVAL} inherits from {ITERABLE}
				print (ic.item.out) -- Outputs: 1 2 3 4 5 6 .. 1000
			end
				-- NOTE: Why `ic'? What does that stand for?
				--			`ic' = {ITERATION_CURSOR}, which is what we get from something that is {ITERABLE}.
				--			`ic.item' is {ITERATION_CURSOR}.item --that is--the class has a feature called `item',
				--			which is what the "across loop" it iterating over and the `item' represents the item
				--			in the cursor where the cursor index is presently pointing.
		end

	across_and_from_can_be_combined
			-- Here is how `across_and_from_can_be_combined'!
		note
			synopsis: "[
				The "across" and "from" loops are not necessarily separate constructs.
				The "across" tells the compiler that we're iterating over something {ITERABLE}.
				The "from" tells the compiler that the code-block within it is prep-work
				for the loop at large. The until says, "We may not iterate over the entire
				{ITERABLE} thing." The "loop" part is still the loop part--that is--code
				that is executed for each item in the {ITERABLE} thing.
				
				NOTE: across and from loops can get even more expressive (see examples below).
				]"
		local
			i: INTEGER
		do
			across
				<<0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100>> as ic
			from
				i := 55
			until
				ic.item > i
			loop
				print (ic.item.out + ",") -- Outputs: 0,10,20,30,40,50,
			end
		end

	prevent_endless_loops
			-- How to `prevent_endless_loops'!
		note
			synopsis: "[
				From time to time, we write loops which never end. We call
				them "endless". An endless loop is a bug. All loops must end!
				The simplest way to prevent a loop from being endless is to
				provide a "variant", which is a sort of "count-down" value,
				starting at some high value and decreasing to zero. When the
				variant value goes negative, the compiler will stop the loop
				and declare an error.
				
				We do not have to be precise in knowing what is the max number
				of iterations our loop will make. We may or may not know the
				precise value. When we do not know the precise value, we can
				guess--that is okay! The point of the variant is to stop the
				loop from running endlessly.
				
				The variant helps to tell a reader of the code the intent of
				the designer of the code. It says, "Here--and no further!"
				Knowing the variant may also reveal something about the nature
				of the problem we are solving.
				
				Because of the way the "variant" works, it is a powerful
				bug preventing mechanism in our loops. PLEASE--use a loop
				variant as often as you can! It may not only reveal an
				endless loop, but a loop that one day may run longer than
				you originally thought--and YOU WANT to know that as well!
				]"
		local
			i,v: INTEGER
		do
			from
				i := 1
				v := 1_001
			until
				i > 1_000
			loop
				i := i + 1  -- What if I forget to increment my loop counter?
				--					If I do, my loop will never stop because 1 (i)
				--					will never increment and get larger than 1_000_000.
				v := v - 1
			variant
				v -- declares that `v' is not just some number. Once `v' is declared as
					-- the "variant", it is expected to decrement by at least 1 on each
					-- iteration. If it does not, this is also considered an error, and
					-- the program stops, thereby putting a failsafe on the nature of the
					-- operation of the variant value.
			end
		end

	the_loop_invariant
			-- How to use `the_loop_invariant'.
		note
			synopsis: "[
				In the example loop below, we see two significant things:
				(1) We see that our "counter" `i' is both a counter and a loop variant
					(i.e. it is counting down to 0)
				(2) We see a new thing: "invariant" followed by a "tag" and a boolean expression.
				
				The intent of this loop is to count down from 1_000 to 0 by two's. The loop
				invariant states that before the loop starts that the value of `i' must be
				evenly divisable by 2. This same boolean assertion must hold True after
				each iteration of the loop. If it does not, then we're not counting down
				by two's--are we??? :-)
				
				NOTE: You can have as many invariants as you like! For example:
						we also want to express that we're actually counting
						down and NOT up!
						
				So--the tag `even' is a logical boolean assertion that `i' is even
				and the tag `down' is a logical boolean assertion that `j' is always
				greater than `i', which proves we're counting down and not up!
				]"
		local
			i,j: INTEGER
		do
			from
				i := 1_000
				j := i + 2 -- Sets `j' and satisfies the loop invariant the first time
			invariant
				even: (i \\ 2) = 0
				down: i < j
			until
				i = 0
			loop
				j := i	-- Captures the "old" value of `i' for the invariant "down".
				i := i - 2
			variant
				i
			end
		end

end
