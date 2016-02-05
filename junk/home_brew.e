class
	HOME_BREW

feature -- Pancakes

	pancakes: ARRAYED_LIST [PANCAKE]
		do
			create Result.make (5)
			Result.force (create {PANCAKE}.make_deairas_method)
			Result.force (create {PANCAKE}.make_brads_method)
			Result.force (create {PANCAKE}.make_bradleys_method)
			Result.force (create {PANCAKE}.make_michaels_method)
			Result.force (create {PANCAKE}.make_larrys_method)
		end

end


