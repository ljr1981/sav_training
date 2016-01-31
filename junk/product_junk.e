note
	description: "Representation of a {PRODUCT}."

class
	PRODUCT_JUNK

create
	default_create,
	make_empty,
	make_with_data

feature {NONE} -- Initialization

	make_empty
			-- Initialize Current with `id' and `name' as empty.
		do
			create id.make_empty
			create name.make_empty
		ensure
			id_empty: id.is_empty
			name_empty: name.is_empty
		end

	make_with_data (a_id, a_name: like id)
			-- `make_with_data': `a_id' and `a_name'.
		do
			id := a_id
			name := a_name
		ensure
			id_set: id.same_string (a_id)
			name_set: name.same_string (a_name)
		end

feature -- Access

	id: STRING assign set_id
			-- `id' of Current {PRODUCT}.
		attribute
			create Result.make_empty
		ensure
			empty: Result.is_empty
		end

	name: STRING assign set_name
			-- `name' of Current {PRODUCT}.
		attribute
			create Result.make_empty
		ensure
			empty: Result.is_empty
		end

feature -- Settings

	set_id (a_id: like id)
			-- `set_id' with `a_id'.
		require
			not_empty: not a_id.is_empty
		do
			id := a_id
		ensure
			set: id.same_string (a_id)
			not_empty: not id.is_empty
		end

	set_name (a_name: like name)
			-- `set_name' with `a_name'.
		require
			not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			set: name.same_string (a_name)
			not_empty: not name.is_empty
		end

;note
	specification: "[
		Represents the general notion of a {PRODUCT} with
		a product ID, name, price(s), and supporting operations.
		]"
end
