note
	testing: "type/manual"

class
	DB_TEST_SET

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
				"covers/{MS_SQL_SERVER}"
		local
			l_db: MS_SQL_SERVER
		do
			create l_db.make
		end

	sqlite3_tests
		note
			steps: "[
				To utilize a SQLite3 DB, you will need to:
				
				(1) Download the SQLite3.def and SQLite3.dll
				(2) Place the def/dll files in the root of your project/EXE
				(3) Enjoy!
				]"
			helpful_sites: "To edit sqlite database:"
			EIS: "src=https://addons.mozilla.org/en-US/firefox/addon/5817 for a free Firefox SQLite database manager."
			EIS: "src=http://www.dbsoftlab.com/database-editors/database-browser/overview.html"
			EIS: "src=http://sqlitestudio.pl/"

			EIS: "src=https://www.sqlite.org/docs.html"
		do
		end

feature {NONE} -- Implementation: Constants

	randomizer: RANDOMIZER
			-- Random data generator for Current.

end


