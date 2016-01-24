note
	description: "An abstract notion of a general {PRODUCT}."
class
	PRODUCT

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize Current.
		do
			id := ""
			name := ""
			create price.make_from_string ("0.00")
		end

feature -- Access

feature {NONE} -- Implementation

	id: attached like alpha_anchor
			--`id' and `name' of Current {PRODUCT}.
		attribute
			create Result.make_empty
		end

	name: attached like alpha_anchor
			-- `name' of Current {PRODUCT}.
		attribute
			create Result.make_empty
		end

	price: DECIMAL
			-- `price' of Current {PRODUCT}.
		attribute
			create Result.make_from_string ("0.00")
		end

feature -- Setters

	set_id (a_id: attached like alpha_anchor)
			-- ??
		do
			id := a_id
		ensure
			set: id.same_string (a_id)
		end

feature {NONE} -- Implementation: Type anchors

	alpha_anchor: detachable STRING_32
			-- `alpha_anchor' for things needing to be {STRING}.

;note
	correctness_proof: "[
		A product consists of the following data:
		- ID: unique ID
		- Name: some string describing the product
		- Price: Price we sell to customers
		- Unit Cost: Price we paid for the product
		- UOM: unit of measure
		
		A product consists of the following operations:
		- Markup: Calculation of Unit_cost * ?
		- Extended Price: Calculation of Price X Quantity

		]"
	glossary: "A dictionary of terms"
	term: "product",
			"an article or substance that is manufactured or refined for sale."
	EIS: "src=https://en.wikipedia.org/wiki/Product_(business)"
end
