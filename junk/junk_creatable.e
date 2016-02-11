deferred class
	JUNK_CREATABLE

feature {NONE} -- Initialization

	make (a_objects: attached like creation_objects_anchor)
		deferred
		end

feature {NONE} -- Implementation: Creation Objects

	creation_objects_anchor: detachable TUPLE
		deferred
		end

end
