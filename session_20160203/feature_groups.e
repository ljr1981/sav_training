note
	description: "Training notes about feature groups."
	synopsis: "[
		The "feature" keyword or reserved word allows you to group
		the features of your class into logical groups however you
		think makes sense.
		
		Each group of features can be "export controlled" to a
		particular list of Client classes and their descendants.
		This gives you ultimate control over what Clients get
		access to each feature group.
		
		It is quite common to have a group of features exported
		to a particlar list of Clients and then one of those
		features gets more specialized, so you cull it out to
		its own new feature group with its own particular list
		of Clients.
		]"
	EIS: "name=comprehensive_eiffel_syntax_guide", "src=http://eiffel-guide.com/"

class
	FEATURE_GROUPS

feature

	feature_comment, is_optional: BOOLEAN

feature -- Comment is group name

	a, b, c: INTEGER

feature -- And another

	e, f, g: REAL_64

feature -- Look right to "Features" tool

	x, y, z: STRING
		attribute
			create Result.make_empty
		end

feature -- Export to ANY by default

	and_so, on: INTEGER

feature {ANY} -- Same as default export

	so, forth: INTEGER

feature {LIST} -- Only LIST and descendants

	exported_to, just_list: REAL

feature {STACK, ARRAY} -- Only STACK and ARRAY

	only_exported,to_stack, and_array: ARRAY [ANY]
		attribute
			Result := <<>>
		end

feature {NONE} -- Complete secret

	completely, secret, features: ANY
		attribute
			create Result
		end

end
