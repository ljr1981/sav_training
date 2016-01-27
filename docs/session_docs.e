note
	description: "A place to put notes and documentation related to Training Sessions."

	process: "As more sessions are added, put their notes at the TOP of the `session_notes' tag (below)."

	EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"
	EIS: "name=class_tool_quick_reference", "src=$GITHUB/sav_training/docs/Eiffel Studio - Class Tool - Quick Reference.pdf", "protocol=PDF"
	eis_note: "The link above works because Eiffel Studio injects the path to the $GITHUB environment variable into the OS call for the PDF file."

	session_notes: "[
		Saturday, January 23rd, 2016
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
