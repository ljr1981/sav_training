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
		local
			l_db: SQLITE_DATABASE
			l_sql: SQLITE_STATEMENT
			l_insert: SQLITE_INSERT_STATEMENT
			l_insert_string: STRING
		do
			-----------------------------------------------------------------
				-- Create (if needed) and open DB ...
			create l_db.make_create_read_write ("my_test_sqlite3")

			-----------------------------------------------------------------
				-- CREATE TABLE ...
			l_db.begin_transaction (True)				-- Begin transaction
			create l_sql.make (sqlite_create, l_db)
			l_sql.ensure_connected
			l_db.commit									-- End (with commit)
			-----------------------------------------------------------------

			-----------------------------------------------------------------
				-- A bunch of INSERTs ...
			l_db.begin_transaction (True)				-- Begin transaction
			across
				sqlite_insert as ic_inserts
			loop
				create l_sql.make (ic_inserts.item, l_db)
				l_sql.ensure_connected
			end
			l_db.commit									-- End (with commit)
			-----------------------------------------------------------------

--			-----------------------------------------------------------------
--				-- A bunch of Random INSERTs ...
--			l_db.begin_transaction (True)				-- Begin transaction
--			across
--				1 |..| randomizer.random_integer_in_range (100 |..| 1_000) as ic
--			loop
--				l_insert_string := sqlite_insert_template.twin
--				l_insert_string.replace_substring_all ("<<ID>>", (ic.item + 10).out)
--				l_insert_string.replace_substring_all ("<<NAME>>", randomizer.random_first_last_name)
--				l_insert_string.replace_substring_all ("<<AGE>>", randomizer.random_integer_in_range (25 |..| 65).out)
--				l_insert_string.replace_substring_all ("<<ADDRESS>>", randomizer.random_city_name)
--				l_insert_string.replace_substring_all ("<<SALARY>>", randomizer.random_integer_in_range (30_000 |..| 100_000).out)
--				create l_sql.make (l_insert_string, l_db)
--				l_sql.ensure_connected
--			end
--			l_db.commit									-- End (with commit)
--			-----------------------------------------------------------------

			-----------------------------------------------------------------
				-- Close the database
			l_db.close
			-----------------------------------------------------------------
		end

feature {NONE} -- Implementation: Constants

	sqlite_create: STRING = "[
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
]"

	sqlite_insert: ARRAY [STRING]
		once
			Result := <<"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1, 'Paul', 32, 'California', 20000.00 );",
			"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (2, 'Allen', 25, 'Texas', 15000.00 );",
			"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (3, 'Teddy', 23, 'Norway', 20000.00 );",
			"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00 );",
			"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (5, 'David', 27, 'Texas', 85000.00 );",
			"INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (6, 'Kim', 22, 'South-Hall', 45000.00 );">>
		end

	sqlite_insert_template: STRING = "INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (<<ID>>, '<<NAME>>', <<AGE>>, '<<ADDRESS>>', <<SALARY>>);"

	randomizer: RANDOMIZER
			-- Random data generator for Current.

end


