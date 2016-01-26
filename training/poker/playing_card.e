note
	description: "[
		Abstraction of a Playing Card
		]"
	EIS: "name=class_tool_quick_reference", "src=$GITHUB\sav_training\training\poker\poker-hand-rankings.pdf", "protocol=PDF"

class
	PLAYING_CARD

inherit
	COMPARABLE

create
	make,
	make_club,
	make_diamond,
	make_heart,
	make_spade

feature {NONE} -- Initialization

	make_club (a_value: like value)
			-- `make_club' with `a_value'.
		require
			in_range: (value_lower |..| value_upper).has (a_value)
		do
			make (a_value, clubs_symbol)
		end

	make_diamond (a_value: like value)
			-- `make_diamond' with `a_value'.
		require
			in_range: (value_lower |..| value_upper).has (a_value)
		do
			make (a_value, diamonds_symbol)
		end

	make_heart (a_value: like value)
			-- `make_heart' with `a_value'.
		require
			in_range: (value_lower |..| value_upper).has (a_value)
		do
			make (a_value, hearts_symbol)
		end

	make_spade (a_value: like value)
			-- `make_spade' with `a_value'.
		require
			in_range: (value_lower |..| value_upper).has (a_value)
		do
			make (a_value, spades_symbol)
		end

	make (a_value: like value; a_suit: like suit)
			-- `make_club' with `a_value'.
		do
			value := a_value
			suit := a_suit
		end

feature -- Access

	value: INTEGER

	suit: CHARACTER_32

feature -- Comparison

	is_less alias "<" (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := (suit_value (suit) < suit_value (a_other.suit)) or else value < a_other.value
		end

	suit_value (a_suit: like suit): INTEGER
			-- What is the `suit_value' of `a_suit' character?
		note
			rule: "[
				Suits order: Alphabetical order: clubs, diamonds,hearts,spades.
				]"
		require
			suited: suit_symbols.has (a_suit)
		do
			across suit_symbols as ic until ic.item = a_suit loop Result := ic.cursor_index end
			Result := Result + 1
		ensure
			in_range: (1 |..| 4).has (Result)
		end

feature -- Constants

	duece: INTEGER = 1
	ten: INTEGER = 9
	jack: INTEGER = 10
	queen: INTEGER = 11
	king: INTEGER = 12
	ace: INTEGER = 13

	suit_symbols: STRING_32
		once
			create Result.make_empty
			Result.append_character (clubs_symbol)
			Result.append_character (diamonds_symbol)
			Result.append_character (hearts_symbol)
			Result.append_character (spades_symbol)
		ensure
			size: Result.count = 4
			content: Result.has (clubs_symbol) and
						Result.has (diamonds_symbol) and
						Result.has (hearts_symbol) and
						Result.has (spades_symbol)
		end

feature {NONE} -- Implementation: Constants

	value_lower: INTEGER = 1
	value_upper: INTEGER = 13

	clubs_symbol: CHARACTER_32 = '%/0xA7/'
	diamonds_symbol: CHARACTER_32 = '%/0xA8/'
	hearts_symbol: CHARACTER_32 = '%/0xA9/'
	spades_symbol: CHARACTER_32 = '%/0xAA/'

invariant
	one_to_thirteen: (value_lower |..| value_upper).has (value)
	in_suit: suit_symbols.has (suit)

end
