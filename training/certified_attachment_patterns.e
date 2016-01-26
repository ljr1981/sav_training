note
	description: "[
		Examples of CAPs and CAP-able items
		]"

class
	CERTIFIED_ATTACHMENT_PATTERNS

feature -- CAPs

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

	cap_able_expressions
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#CAP-able_expressions"
			synopsis: "[
				In the first context in the definition above, the expression exp can be an Object-Test Local. 
				An Object-Test Local is the identifier specified for a fresh local entity in an object test. 
				Remember, object tests are coded using the attached syntax.
				
				            attached x as l_x 
				
				In the object test expression above, the identifier l_x is an Object-Test Local.
				In the second context, the expression can be a read-only entity. Read-only entities are:
				
				Constant attributes
				Formal arguments
				Object-Test Locals
				Current
				
				Additionally, the Eiffel Software compiler allows for stable attributes and local variables to 
				be protected by a CAP.
				]"
		do
			if attached my_stable_string as al_x then
				do_nothing -- with `l_lx'
			end
		end

	set_my_stable_string (a_string: attached like my_stable_string)
			-- ???
		do
			my_stable_string := a_string
		ensure
			set: attached my_stable_string as al_string and then attached al_string
		end

	my_stable_string: detachable ANY
		note
			EIS: "src=https://docs.eiffel.com/book/method/what-makes-certified-attachment-pattern#Stable_attributes"
			synopsis: "[
				Stable attributes are the only class attributes which are CAP-able. This is because 
				stable attributes, once attached at run-time, can never have a void value again. So, 
				you use stable attributes safely by using them under the protection of a CAP. Consider 
				this stable attribute:
				    
				    my_stable_string: detachable STRING
				        note
				            option: stable
				        attribute
				        end
				        
				The detachable attribute my_stable_string, because it is stable, is not required to be 
				initialized during the creation of instances of the class in which it is a feature. That 
				means that for each instance, my_stable_string can be initialized later during the instance's 
				life-cycle or not at all. But because it is detachable, my_stable_string cannot be accessed 
				in any context in which it cannot be determined that it is currently attached. For ordinary 
				attributes, this means either using an object test and accessing the object through an object 
				test local, or using using a local variable under the protection of a CAP.
				
				Stable attributes however, can be used directly in a CAP, as shown below:
				            
				            if my_stable_string /= Void then
				                my_stable_string.append ("abc")        -- Valid
				                    ...
				                    
				So using stable attributes can reduce the need to initialize rarely used attributes, and the 
				need to code object tests.
				]"
            option: stable
        attribute
        end

	local_variables
		note
			synopsis: "[
				Local variables can be used in a CAP as long as they are not the target of 
				an assignment whose source is Void or some expression which could possibly 
				be void.
				
				So, for a local variable l_string, the following is valid:
				        
				        local
				            l_string: detachable STRING
				        do
				            if l_string /= Void then
				                l_string.append ("abc")        -- Valid
				                    ...
				But, if l_string had been a target of an assignment in which the source could 
				possibly have been void, then it could no longer be guaranteed that l_string 
				is not void. So, assuming that my_detachable_string is an attribute declared 
				as type detachable STRING, the second application of append in this example 
				would be invalid:
				        
				        local
				            l_string: detachable STRING
				        do
				            if l_string /= Void then
				                l_string.append ("abc")        -- Valid
				                l_string := my_detachable_string
				                l_string.append ("xyz")        -- Invalid: my_detachable_string might have been void
				                    ...
				]"
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

	common_CAPs
			-- ???
		note
			synopsis: "[
				Common CAPs
				We've already seen the simple test for void as a CAP:
				    local
				        l_str: detachable STRING
				 
				                ...
				 
				            if l_str /= Void then
				                l_str.append ("xyz")        -- Valid
				            end
				Additionally, a creation instruction can serve as a CAP. After the execution of a creation instruction, the target of the creation instruction will be attached:
				        local
				            l_str: detachable STRING
				        do
				            create l_str.make_empty
				            l_str.append ("xyz")        -- Valid
				                ...
				]"
		local
            l_str: detachable STRING
        do
            create l_str.make_empty
            l_str.append ("xyz")        -- Valid	
		end


;note
	glossary: "Dictionary of Terms"
	term: "CAP", "[
			Certified Attachment Pattern: A code pattern which can, through static
			analysis, be proven (using a compiler, the static anlyzer) to be "Void Safe"
			(i.e. will never be accessed while reference pointer is Void, Null, or Nil).
			]"
end
