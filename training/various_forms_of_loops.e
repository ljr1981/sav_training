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

				-- Now lets go "across" the list (i.e. iterate it) ...
			across l_names as ic_names loop
				print (ic_names.item)
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

end
