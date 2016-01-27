note
	description: "[
		Examples of CAPs and CAP-able items
		]"
	glossary: "Dictionary of Terms"
	term: "CAP",
			"[
				Certified Attachment Pattern is a pattern of code which can be statically
				analyzed by a compiler where the result of the analysis will be a certification
				that object references will never become Void (detached from an assigned object).
				]"
class
	CERTIFIED_ATTACHMENT_PATTERNS

feature -- Simple CAPs

	simple_and_familiar
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#The_standard_CAP_definition"
		local
			l_x: detachable ANY
		do
			if l_x /= Void then
				l_x.do_nothing -- Valid for formal arguments, local variables, and stable attributes
			end
		end

feature -- CAP-able Expressions

	cap_able_expressions
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#CAP-able_expressions"
		do
			if attached my_stable_string as al_x then
				do_nothing -- with `l_lx'
			end
		end

feature -- Stable Attributes

	my_stable_string: detachable STRING
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Stable_attributes"
			synopsis: "[
				Stable attributes are the ONLY class attributes which are CAP-able!
				This is because stable attributes, once attached at run-time, can never be Void again.
				]"
			usage: "[
				(1) This feature does NOT require initialization (either in creation procedure 
					or in "attribute .. end" (below))
				(2) This feature can be initialized (attached to an object) at any time (or never).
				(3) All access to this feature must happen using the Object Test Local method
					(e.g. "if attached my_stable_string [as al_string] then .. end").
				]"
            option: stable
        attribute
        end

	set_my_stable_string (a_string: attached like my_stable_string)
			-- `set_my_stable_string' with `a_string' into `my_stable_string'.
		note
			synopsis: "[
				An example setter for a stable attribute. Note the "attached like"
				in the argument type specification.
				]"
		do
			my_stable_string := a_string
		ensure
			set: attached my_stable_string and then a_string.same_string (my_stable_string)
		end

feature -- Local Variable CAPs

	local_variables
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Local_variables"
		local
			l_string: detachable STRING
		do
			if l_string /= Void then
				l_string.append ("abc") -- Valid
				l_string := Void
				-- l_string.append ("xyz"), producing the following error if uncommented:
					-- Error code: VUTA(2)
					-- Error: target of the Object_call might be void.
					-- What to do: ensure target of the call is attached.
			end
		end

feature -- Common CAPs

	common_CAPs
			-- `common_CAPs' where a creation instruction can serve as a CAP.
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Common_CAPs"
			synopsis: "[
				In the example below, the compiler is smart enough to know that if there is code between
				"create .." and any use of `l_str', that sets `l_str := Void' then the CAP is broken and
				the compiler will complain (static analysis of the code).
				]"
			EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"
		local
            l_str: detachable STRING
        do
            create l_str.make_empty
            -- l_str := Void 			-- Uncomment this line of code and the compiler will generate an error:
            							-- ECMA-367 Page 123 Section 8.23.14 VUTA(2) error (see EIS above).
            							-- "An Object_call is target-valid if and only if its target is an attached expression."
            l_str.append ("xyz")        -- Valid	
		end

feature -- Less Obvious Cases

	less_obvious_case_1
			-- `less_obvious_case_1' of a CAP using a non-strict boolean operator.
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Less_obvious_cases"

			see_also: "[
				ECMA-367, page 128, sections 8.24.4 to 8.24.11, which covers the notions
				of Boolean logic and how it combines with CAP (Certified Attachment Patterns).
				]"
				EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"

			glossary: "Dictionary of Terms"
			term: "non-strict",
					"[
					(1) Evaluation stops as soon as the truth or falsehood of the result is known. 
						Therefore in some cases only the first operand will be evalutated by the runtime.
						Also known as semi-strict (vs. strict). See EIS link below.
					]"
					EIS: "src=http://tecomp.sourceforge.net/index.php?file=doc/lang/basic.txt#chapter_6"
		local
			x: detachable STRING
		do
--			if x /= Void and x.is_empty then		-- Invalid because compiler does not transfer the CAP of x beyond the "and" (stict boolean operator)
--				do_nothing							-- ECMA-367 Page 123 Section 8.23.14 VUTA(2) error (see EIS above).
--			end										-- "An Object_call is target-valid if and only if its target is an attached expression."
			if x /= Void and then x.is_empty then	-- Valid because the compiler transfers the CAP-status of x through the semi-strict boolean operator
				do_nothing
			end
		end

	CAPs_and_logical_implication
			-- `CAPs_and_logical_implication' and the "implies" Boolean operator.
		note
			synopsis: "[
				Similar to the other semi-strict Boolean operators, logical implication
				works with the compiler to transfer the CAP logically through to other
				code within the code. In the example below, the else-part of the if-then
				is logically attached unless code is introduced that sets l_str to Void.
				]"
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Less_obvious_cases"
		local
			l_str: detachable STRING
		do
			if l_str /= Void implies some_expression then
				do_nothing
			else
				-- l_str := Void					-- Will cause an attachment error if uncommented.
				l_str.append ("xyz")				-- Valid because the "implies" Boolean operator is semi-strict and ..
			end
		end

	some_expression: BOOLEAN
			-- `some_expression' in support of `CAPs_and_logical_implication'.

;note
	glossary: "Dictionary of Terms"
	term: "CAP", "[
			Certified Attachment Pattern: A code pattern which can, through static
			analysis, be proven (using a compiler, the static anlyzer) to be "Void Safe"
			(i.e. will never be accessed while reference pointer is Void, Null, or Nil).
			]"
end
