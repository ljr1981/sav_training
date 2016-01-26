note
	description: "[
		Representation of a {POKER_HAND} consisting of 5 {PLAYING_CARD} items.
		]"

class
	POKER_HAND

inherit
	COMPARABLE

feature -- Comparison

	is_less alias "<" (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := hand_ranking < a_other.hand_ranking
		end

feature -- Access

	cards: SORTED_TWO_WAY_LIST [PLAYING_CARD]
			-- `cards' in Current {POKER_HAND}.
		attribute
			create Result.make
		end

	hand_ranking: INTEGER
			-- `hand_ranking' of `cards' from `royal_flush' to `high_card' or `no_card'.
		note
			synopsis: "[
				This ranking system below works because the is_rank logic works
				in a downward order starting at `is_royal_flush' and working down.
				If this order is changed, then this feature will break!
				]"
		do
			if is_royal_flush then
				Result := royal_flush
			elseif is_straight_flush then
				Result := straight_flush
			elseif is_four_of_a_kind then
				Result := four_of_a_kind
			elseif is_full_house then
				Result := full_house
			elseif is_flush then
				Result := flush
			elseif is_straight then
				Result := straight
			elseif is_three_of_a_kind then
				Result := three_of_a_kind
			elseif is_two_pair then
				Result := two_pair
			elseif is_one_pair then
				Result := one_pair
			elseif is_high_card then
				Result := high_card
			else
				Result := no_card
			end
		end

feature -- Hand Ranking

	is_royal_flush: BOOLEAN
			-- `is_royal_flush'?
		note
			rule: "5 cards of same suit; in sequece from 10 to Ace."
			odds: 649_739, 1
		require
			full_hand: is_full_hand
			sorted: cards.sorted
		do
			Result := all_cards_same_suit and
						are_cards_in_sequence and
						first_card_value = {PLAYING_CARD}.ten and
						last_card_value = {PLAYING_CARD}.ace
		end

	is_straight_flush: BOOLEAN
			-- `is_straight_flush'?
		note
			rule: "5 cards of same suit; in sequence"
			odds: 72_192, 1
		require
			full_hand: is_full_hand
			sorted: cards.sorted
		do
			Result := all_cards_same_suit and
						are_cards_in_sequence and
						not is_royal_flush
		end

	is_four_of_a_kind: BOOLEAN
			-- `is_straight_flush'?
		local
			l_suits: ARRAYED_LIST [INTEGER]
		do
			create l_suits.make (4)
			across cards as ic loop
				l_suits [ic.item.suit.code] := l_suits [ic.item.suit.code] + 1
			end
			Result := across l_suits as ic some ic.item = 4 end and
						not is_straight_flush and
						not is_royal_flush
		end

	is_full_house: BOOLEAN
			-- `is_straight_flush'?
		local
			l_values: ARRAYED_LIST [INTEGER]
		do
			create l_values.make (13)
			across cards as ic loop
				l_values [ic.item.value] := l_values [ic.item.value] + 1
			end
			Result := (across l_values as ic some ic.item = 3 end
							and
						across l_values as ic some ic.item = 2 end) and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_flush: BOOLEAN
			-- `is_straight_flush'?
		do
			Result := all_cards_same_suit and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_straight: BOOLEAN
			-- `is_straight_flush'?
		do
			Result := are_cards_in_sequence and
						not is_flush and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_three_of_a_kind: BOOLEAN
			-- `is_straight_flush'?
		local
			l_values: ARRAYED_LIST [INTEGER]
		do
			create l_values.make (13)
			across cards as ic loop
				l_values [ic.item.value] := l_values [ic.item.value] + 1
			end
			Result := across l_values as ic some ic.item = 3 end and
						not is_straight and
						not is_flush and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_two_pair: BOOLEAN
			-- `is_straight_flush'?
		local
			l_values: ARRAYED_LIST [INTEGER]
			l_pair_count: INTEGER
		do
			create l_values.make (13)
			across cards as ic loop
				l_values [ic.item.value] := l_values [ic.item.value] + 1
			end
			across l_values as ic loop
				if ic.item = 2 then
					l_pair_count := l_pair_count + 1
				end
			end
			Result := l_pair_count = 2 and
						not is_three_of_a_kind and
						not is_straight and
						not is_flush and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_one_pair: BOOLEAN
			-- `is_straight_flush'?
		local
			l_values: ARRAYED_LIST [INTEGER]
			l_pair_count: INTEGER
		do
			create l_values.make (13)
			across cards as ic loop
				l_values [ic.item.value] := l_values [ic.item.value] + 1
			end
			across l_values as ic loop
				if ic.item = 2 then
					l_pair_count := l_pair_count + 1
				end
			end
			Result := l_pair_count = 1 and
						not is_two_pair and
						not is_three_of_a_kind and
						not is_straight and
						not is_flush and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

	is_high_card: BOOLEAN
			-- `is_high_card'?
		do
			Result := not is_one_pair and
						not is_two_pair and
						not is_three_of_a_kind and
						not is_straight and
						not is_flush and
						not is_full_house and
						not is_four_of_a_kind and
						not is_straight_flush and
						not is_royal_flush
		end

feature -- Hand Rank Constants

	royal_flush: INTEGER = 11
	straight_flush: INTEGER = 10
	four_of_a_kind: INTEGER = 9
	full_house: INTEGER = 8
	flush: INTEGER = 7
	straight: INTEGER = 6
	three_of_a_kind: INTEGER = 5
	two_pair: INTEGER = 4
	one_pair: INTEGER = 3
	high_card: INTEGER = 2
	no_card: INTEGER = 1

feature -- Queries

	first_card_value: INTEGER
			-- `first_card_value'?
		do
			Result := cards [1].value
		end

	last_card_value: INTEGER
			-- `last_card_value'?
		do
			Result := cards [5].value
		end

	is_full_hand: BOOLEAN
			-- `is_full_hand' as `cards' count is `max_count'?
		do
			Result := cards.count = max_count
		ensure
			not_empty: not is_empty_hand
		end

	is_empty_hand: BOOLEAN
			-- `is_empty_hand' as `cards' count is `min_count'?
		do
			Result := cards.count = min_count
		ensure
			not_full: not is_full_hand
		end

	all_cards_same_suit: BOOLEAN
			-- `all_cards_same_suit' in `cards'?
		do
			Result := across ((min_count + 2) |..| max_count) as ic all cards [ic.item].suit = cards [1].suit end
		end

	are_cards_in_sequence: BOOLEAN
			-- `are_cards_in_sequence'?
		do
			Result := across ((min_count + 2) |..| max_count) as ic all
							cards [ic.item].value = cards [ic.cursor_index - 1].value + 1
						end
		end

feature {NONE} -- Implementation: Constants

	min_count: INTEGER = 0
	second_card: INTEGER = 2
	max_count: INTEGER = 5

invariant
	min_zero: min_count = 0
	card_count: (min_count |..| max_count).has (cards.count)

end
