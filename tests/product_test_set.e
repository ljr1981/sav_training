note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	testing: "type/manual"

class
	PRODUCT_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		redefine
			on_prepare
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature {NONE} -- Implementation

	on_prepare
			-- <Precursor>
		do
			create randomizer
		end

feature -- Test routines

	product_creation_tests
		local
			l_product: PRODUCT
		do
			create l_product.make (["823764873", "askdhksdjhf"])
		end

	product_junk_creation
		local
			l_product: PRODUCT_JUNK
		do
			create l_product
			assert ("id_empty", l_product.id.is_empty)
			assert ("name_empty", l_product.name.is_empty)
			l_product.id := "876238746" 		-- uses the assign -> set_id
			l_product.id := "87263487326"
			l_product.name := "JHGDJFHGJHGSD"	-- ditto for this but using set_name
			create l_product.make_with_data ("7634876", "hgasdjhgsdjhaf")
		end

feature {NONE} -- Implementation: Constants

	randomizer: RANDOMIZER
			-- Random data generator for Current.

end


