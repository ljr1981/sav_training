note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
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
			create l_p1
			across (1 |..| 5) as ic loop l_p1.cards.force (l_deck_1.cards [ic.item]) end
			across (6 |..| 10) as ic loop l_p1.cards.force (l_deck_1.cards [ic.item]) end
		end

end


