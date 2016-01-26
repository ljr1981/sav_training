note
	description: "[
		Representation of a {DECK_OF_CARDS}.
		]"

class
	DECK_OF_CARDS

inherit
	ANY
		redefine
			default_create
		end

feature {NONE} -- Implementation

	default_create
			-- <Precursor>
		do
			create shuffle_engine
			create internal_cards.make (52)
			shuffle
		end

feature -- Access

	cards: ARRAYED_LIST [PLAYING_CARD]
			-- `deck' of {PLAYING_CARD} items.
		do
			create Result.make (52)
			across internal_cards as ic loop
				if (1 |..| 13).has (ic.item) then
					Result.force (create {PLAYING_CARD}.make_club (ic.item))
				elseif (14 |..| 26).has (ic.item) then
					Result.force (create {PLAYING_CARD}.make_diamond (ic.item - 13))
				elseif (27 |..| 39).has (ic.item) then
					Result.force (create {PLAYING_CARD}.make_heart (ic.item - 26))
				elseif (40 |..| 52).has (ic.item) then
					Result.force (create {PLAYING_CARD}.make_spade (ic.item - 39))
				end
			end
		end

feature -- Basic Operations

	shuffle
			-- `shuffle' `cards'.
		local
			l_card,v: INTEGER
		do
			internal_cards.wipe_out
			create internal_cards.make (52)
			from
				l_card := shuffle_engine.random_integer_in_range (1 |..| 52)
				v := 1_000
			until
				internal_cards.count > 50
			loop
				if not internal_cards.has (l_card) then
					internal_cards.force (l_card)
				end
				l_card := shuffle_engine.random_integer_in_range (1 |..| 52)
				v := v - 1
			variant
				v
			end
			across (1 |..| 52) as ic until internal_cards.count > 51 loop
				if not internal_cards.has (ic.item) then
					internal_cards.force (ic.item)
				end
			end
		end

feature -- Constants

	max_count: INTEGER = 52

feature {NONE} -- Implementation

	internal_cards: ARRAYED_LIST [INTEGER]
			-- `internal_cards' as numbers from 1 to 52.

	shuffle_engine: RANDOMIZER
			-- `shuffle_engine' of `cards'.

end
