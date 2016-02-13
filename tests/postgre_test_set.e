note
	testing: "type/manual"

class
	POSTGRE_TEST_SET

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

	database_tests
		note
			testing:
				"covers/{MSL_SQL_SERVER}"
		local
			l_db: MSL_SQL_SERVER
		do
			create l_db.make
		end

feature {NONE} -- Implementation: Constants

	randomizer: RANDOMIZER
			-- Random data generator for Current.

end


