class
	TEMPLATE_CUSTOMER

feature -- Fields

	CompanyName: STRING
		attribute
			create Result.make_empty
		end

	contact_name: detachable ANY

	field1,
	field2,
	field3,
	region: detachable ANY

;note
	synopsis: "[
		What is a {TEMPLATE_CUSTOMER}?
		===================
		A {TEMPLATE_CUSTOMER} class is what the {DATABASE_MANAGER [ODBC]} uses to transfer SQL Query
		results from the ODBC driver to an ARRAYED_LIST [TEMPLATE_CUSTOMER]. The steps to do this
		basically are:
		
		(1) Create this template class.
		(2) Add an attribute feature for each field in the SQL SELECT statement.
		(3) Use this class in calls to:
				l_result := data_manager.load_list_with_select (sql, create {TEMPLATE_CUSTOMER})
				
		NOTES:
		======
		(a) The attribute features created here must match in data-type to the SQL SELECT data types.
		(b) Use the attribute keyword instead of a creation procedure, which sets the feature.
			The `template loading' process will make copies of the TEMPLATE_* and then fill the field
			attributes features with data from the ODBC result set for you. Having your own code to
			set the field values is a computational waste--so self-initializing attributes are good
			enough.
		(c) In this {TEMPLATE_CUSTOMER}, we only have one field called `CompanyName'. Notice that
			the feature name is CamelCased, which is atypical (not normal) to Eiffel naming convention,
			which_is_usually_underscored_names. This is because, if you examine the Northwind Customer
			table, you will find a field named `CompanyName'. Unless you want to say: 
			"SELECT [CompanyName] as company_name FROM [Northwind].[dbo].[Customers]" (which you can do),
			then your "template-field-names" must be precise matches for the field names used in your
			SQL SELECT statements.
		]"
end
