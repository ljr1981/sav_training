class
	JUNK_PERSON

inherit
	JUNK_CREATABLE
		redefine
			creation_objects_anchor
		end

create
	make

feature {NONE} -- Initailziation

	make (a_objects: attached like creation_objects_anchor)
		do

		end

feature {NONE} -- Implementation: Creation Objects

	creation_objects_anchor: detachable TUPLE [first, middle, last: STRING; age: INTEGER]

end
