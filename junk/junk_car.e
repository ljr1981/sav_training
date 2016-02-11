note
	description: "Summary description for {JUNK_CAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	JUNK_CAR

inherit
	JUNK_CREATABLE

create
	make
	
feature {NONE} -- Initailziation

	make (a_objects: attached like creation_objects_anchor)
		do

		end

feature {NONE} -- Implementation: Creation Objects

	creation_objects_anchor: detachable TUPLE [make, model, vin: STRING]

end
