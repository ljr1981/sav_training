note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	EIS: "name=poker_rules", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"
	testing: "type/manual"

class
	POKER_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature -- Test routines

	poker_tests
		local
			l_card: PLAYING_CARD
			l_deck_1,
			l_deck_2: DECK_OF_CARDS
			l_p1,
			l_p2: POKER_HAND
		do
			create l_deck_1
			create l_deck_2
			assert_32 ("different_decks", across (1 |..| 52) as ic some
												l_deck_1.cards [ic.item].value /= l_deck_2.cards [ic.item].value
											end)
			create l_p1
			create l_p2
			across (1 |..| 5) as ic loop l_p1.cards.force (l_deck_1.cards [ic.item]) end
			across (6 |..| 10) as ic loop l_p2.cards.force (l_deck_1.cards [ic.item]) end
		end

	hand_comparison_tests
			-- Test various known hands to ensure hand compares work
		local
			l_p1,
			l_p2: POKER_HAND
		do
			create l_p1
			l_p1.cards.force (create {PLAYING_CARD}.make_diamond ({PLAYING_CARD}.ten))
			l_p1.cards.force (create {PLAYING_CARD}.make_diamond ({PLAYING_CARD}.jack))
			l_p1.cards.force (create {PLAYING_CARD}.make_diamond ({PLAYING_CARD}.queen))
			l_p1.cards.force (create {PLAYING_CARD}.make_diamond ({PLAYING_CARD}.king))
			l_p1.cards.force (create {PLAYING_CARD}.make_diamond ({PLAYING_CARD}.ace))
			create l_p2
			l_p2.cards.force (create {PLAYING_CARD}.make_club ({PLAYING_CARD}.five))
			l_p2.cards.force (create {PLAYING_CARD}.make_club ({PLAYING_CARD}.six))
			l_p2.cards.force (create {PLAYING_CARD}.make_club ({PLAYING_CARD}.seven))
			l_p2.cards.force (create {PLAYING_CARD}.make_club ({PLAYING_CARD}.eight))
			l_p2.cards.force (create {PLAYING_CARD}.make_club ({PLAYING_CARD}.nine))
--			assert ("royal_flush_beats_straight_flush", l_p1 > l_p2)
		end

end


