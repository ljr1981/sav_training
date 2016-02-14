note
	see: "notes at end of class"
class
	MS_SQL_SERVER

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize this example.
		local
			l_result: ARRAYED_LIST [TEMPLATE_CUSTOMER]
		do
			create data_manager
			establish_connection
			l_result := data_manager.load_list_with_select (customer_company_names_sql, create {TEMPLATE_CUSTOMER})
			data_manager.disconnect
		end

feature -- Access

	establish_connection
			-- Establish connection with `Internal_connection_string_template'.
		local
			l_connection_string: STRING
		do
			if data_manager.is_connected then
				data_manager.disconnect
			end
			l_connection_string := Internal_connection_string_template.twin
			l_connection_string.replace_substring_all ("<<DB_SERVER>>", Database_server)
			l_connection_string.replace_substring_all ("<<DB_DATABASE>>", Database_name)
			data_manager.set_connection_string_information (l_connection_string)
			data_manager.establish_connection
		ensure
			connected: data_manager.is_connected
		end

	data_manager: DATABASE_MANAGER [ODBC]

feature {NONE} -- Constants

	Database_server: STRING = "SOFTWAREDUDE\LOCALINSTANCE"
			-- `Database_server' name used in Current. Usually derived from configuration file.

	Database_name: STRING = "Northwind"
			-- `Database_name' contained within `Database_server'. Also, usually in configuration file.

	Internal_connection_string_template: STRING_8 = "Driver={SQL Server Native Client 11.0};Server=<<DB_SERVER>>;Database=<<DB_DATABASE>>;Trusted_Connection=yes;"
		   -- Generic connection string with replacement <<TAG>>s: <<DB_SERVER>> and <<DB_DATABASE>>.
		   -- Use a Trusted Connection or a User with an ID and PW--whatever makes sense for your situation.

	customer_company_names_sql: STRING = "[
SELECT 
	[CompanyName], 
	[ContactName] as contact_name,
	[ContactTitle] as field1,
	[Address] as field2,
	[City] as field3,
	[Region] as region
FROM 
	[Northwind].[dbo].[Customers]
]"
			-- Using the fully qualified SQL SELECT to ensure accuracy through ODBC.

note
	postgresql_steps: "[
		(1) Ensure PostGreSQL DB is installed and updated (v. 9.5.x)
		(2) Ensure PostGreSQL Admin III is installed (v. 1.22.x)
		(3) Ensure Eiffel libraries are in project:
			(3a) Store 	"c:\program files\eiffel software\eiffelstudio 15.11 gpl\library\store\store-safe.ecf"
			(3b) ODBC 	"c:\program files\eiffel software\eiffelstudio 15.11 gpl\library\store\dbms\rdbms\odbc\odbc-safe.ecf"
		(4) After PostGreSQL DB is installed, run the Stack Installer
			* This will install the needed ODBC drivers
				(plus other items like GIS DB and Apache/PHP).
		]"
	EIS: "name=installer_binaries", "src=http://www.postgresql.org/download/"
	EIS: "name=PostGreSQL_connection_strings", "src=https://www.connectionstrings.com/postgresql/"
	sql_server_steps: "[
		(1) Ensure SQL Server is installed.
		(2) Ensure Northwind database is installed.
		(3) Ensure SQL Server Management Studio is installed.
		
		NOTE: You do NOT need to create a User or System DSN to use the ODBC
				driver! For the MS SQL Server connection, the ODBC class will
				handle making the connection directly with the ODBC driver.
		]"
	EIS: "name=SQL_Server_download", "src=https://www.microsoft.com/en-us/search/result.aspx?q=sql+server+2014+express&form=dlc"
	EIS: "name=Northwind_sample_DB", "src=https://www.microsoft.com/en-us/download/details.aspx?id=23654"
	EIS: "name=SQL_Server_connection_strings", "src=https://www.connectionstrings.com/sql-server/"
end
