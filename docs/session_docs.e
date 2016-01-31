note
	description: "A place to put notes and documentation related to Training Sessions."

	process: "As more sessions are added, put their notes at the TOP of the `session_notes' tag (below)."

	EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"
	EIS: "name=class_tool_quick_reference", "src=$GITHUB/sav_training/docs/Eiffel Studio - Class Tool - Quick Reference.pdf", "protocol=PDF"
	EIS: "name=comprehensive_eiffel_syntax_guide", "src=http://eiffel-guide.com/"
	eis_note: "The link above works because Eiffel Studio injects the path to the $GITHUB environment variable into the OS call for the PDF file."

	EIS: "name=training_video_ECMA", "src=https://www.youtube.com/watch?v=RDSPBQX7EY8"
	EIS: "name=training_video_prefs", "src=https://www.youtube.com/watch?v=pNP1hBfkwx4"
	EIS: "name=training_video_notes", "src=https://www.youtube.com/watch?v=rAKOD2-l7E8"
	EIS: "name=training_video_creation", "src=https://www.youtube.com/watch?v=o0YYfmWURY4"
	EIS: "name=training_video_debug", "src=https://www.youtube.com/watch?v=H-SKuaw4ttg"
	EIS: "name=training_video_anchors", "src=https://www.youtube.com/watch?v=eNppFYmvj_I"
	EIS: "name=training_video_attributes", "src=https://www.youtube.com/watch?v=GIxTuLGSXbA"
	EIS: "name=training_video_combined", "src=https://www.youtube.com/watch?v=GIxTuLGSXbA"
	EIS: "name=training_video_setters", "src=https://www.youtube.com/watch?v=PD5Iqxd2YLU"

	session_20150130: "[
		Saturday, January 30th, 2016 9:00 AM
		- Planned
			* Demo: Basic-text vs. Clickable-view and note references
			* More on creation
			* More on assignment (e.g. ":=" assignment operator) (see ECMA: 8.22.2 Syntax: Assignments)
			* More on Void Safety and CAPs (Certified Attachment Patterns)
			* More on Design by Contract (see ECMA: 8.9Correctness and contracts)
			* More on code constructs: (see ECMA: 8.17 Control structures)
				(1) Compounds (sequences)			(ECMA: 8.17.1 		Semantics: Compound (non-exception) semantics)
				(2) Conditionals 					(ECMA: 8.17.2-6 	Syntax: Conditionals)
				(3) Multi-branch instructions		(ECMA: 8.17.7-15 	Syntax: Multi-branch instructions)
				(4) Loops							(ECMA: 8.17.16 		Syntax: Loops)
				(5) Debug instructions				(ECMA: 8.17.18-19 	Syntax: Debug instructions)
			* More on testing to prove library code
			* More on "How Eiffel Compiles" (a look under the hood -- EIFGENs & Freeze/Melting-ice-tech)
				Degree 6: Examining System			- Ensuring the project universe is well-formed and understood.
				Degree 5: Parsing Classes			- Syntax is checked on all classes within universe.
				Degree 4: Analyzing Inheritance		- Ensures valid/conforming inheritance structure.
				Degree 3: Checking Types			- Ensures valid application of the Type-system.
				Degree 2: Generating Byte Code		- "Byte-code" is "melted-code" for the Eiffel-runtime.
				Degree 1: Generating Metadata		- "Metadata" is what allows the IDE to work with references (e.g. Pick-n-drop).
				Melting System Changes				-

				Eiffel Compilation Succeeded
		- Created
			* New classes for CAPS (e.g. {CERTIFIED_ATTACHMENT_PATTERNS} and {CAP_TEST_SET})
			* "Poker" cluster under "training" - Demo of {COMPARABLE} using {PLAYING_CARD} and {POKER_HAND}
		- Eiffel Studio Setups
			* Pick-n-Drop: use the following steps to set PnD:
				(1) From the menu: Tools -> Preferences
				(2) Click the "Flat View" button
				(3) Type "pick" in the "Filter" textbox
				(4) Change the PnD option from False -> True
		]"
	EIS: "src=https://www.eiffel.org/doc/eiffelstudio/How%%20EiffelStudio%%20Compiles"

	session_20150123: "[
		Saturday, January 23rd, 2016 9:00 AM
		============================
		- Create a simple class as "class CLASS_NAME end"
		- Make it more interesting by adding "deferred" and discuss why it is more useful
		- Discussion Points: 
			* Introduce ADT (Abstract Data Type) -- The math precursor of the notion of a class
			* Introduce AST (Abstract Syntax Tree) -- What the compiler builds using Left-to-Right-Lookahead compiling
			* Introduce the ECMA Standard specification and its importance ("Know thy compiler" and "Think like the compiler")
			* Introduce Notes Vs. Comments Vs. Code and the Self-documenting Principle
			* Introduce the notion of class note
			* Introduce kinds of notes: (1) Correctness Proof spec (2) External EIS links (3) Metadata parsing ... etc
			* Build a new class called: {PRODUCT} <-- switch your editor to "Clickable view (Ctrl-Shift-C)" to pick-n-drop
			* Introduce feature groups and feature "Export Status" -- Use the ECMA spec to show the BNF-E syntax spec
			* In {PRODUCT} add Correctness Proof notes to the bottom of the class based on ADT (attributes, routine, creations)
			* Start building code!
			* Added {PRODUCT}.id and {PRODUCT}.name and then played around with `silly quotes' and renaming (refactor tool)
			* Introduce the notion of a "type anchor" feature
			* Introduce how to do feature structures like: "id, name: STRING"
			* Introduce the notion of "attribute" as a keyword and construct -- also "why we need this" (e.g. purpose)
			* Introduce the notion of "creation" and "setter"
			* Introduce the notion of Void Safety vs. Null Pointer references
		- Next time:
			* More on creation
			* More on assignment
			* More on Void Safety and CAPs (Certified Attachment Patterns)
			* More on Design by Contract
			* More on code constructs: (1) Compounds (sequences) (2) Loops (3) Conditionals
			* More on testing to prove library code
			* More on "How Eiffel Compiles" (a look under the hood -- EIFGENs & Freeze/Melting-ice-tech)
		]"

deferred class
	SESSION_DOCS

end
