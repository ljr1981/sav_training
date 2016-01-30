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
			create l_product.make (["", ""])
		end

feature {NONE} -- Implementation: Constants

	randomizer: RANDOMIZER
			-- Random data generator for Current.

end


