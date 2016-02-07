note
	description: "[
		A place to put notes and documentation related to Training Sessions.
		]"

	process: "[
		As more sessions are added, put their notes at the TOP 
		of the `session_notes' tag (below).
		]"

	EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"
	EIS: "name=class_tool_quick_reference", "src=$GITHUB/sav_training/docs/Eiffel Studio - Class Tool - Quick Reference.pdf", "protocol=PDF"
	EIS: "name=comprehensive_eiffel_syntax_guide", "src=http://eiffel-guide.com/"
	eis_note: "[
		The link above works because Eiffel Studio injects the path to the $GITHUB 
		environment variable into the OS call for the PDF file.
		]"

	EIS: "name=training_video_ECMA", "src=https://www.youtube.com/watch?v=RDSPBQX7EY8"
	EIS: "name=training_video_prefs", "src=https://www.youtube.com/watch?v=pNP1hBfkwx4"
	EIS: "name=training_video_notes", "src=https://www.youtube.com/watch?v=rAKOD2-l7E8"
	EIS: "name=training_video_creation", "src=https://www.youtube.com/watch?v=o0YYfmWURY4"
	EIS: "name=training_video_debug", "src=https://www.youtube.com/watch?v=H-SKuaw4ttg"
	EIS: "name=training_video_anchors", "src=https://www.youtube.com/watch?v=eNppFYmvj_I"
	EIS: "name=training_video_attributes", "src=https://www.youtube.com/watch?v=GIxTuLGSXbA"
	EIS: "name=training_video_combined", "src=https://www.youtube.com/watch?v=GIxTuLGSXbA"
	EIS: "name=training_video_setters", "src=https://www.youtube.com/watch?v=PD5Iqxd2YLU"
	EIS: "name=training_video_feature_groups", "src=https://www.youtube.com/watch?v=ryLLts_OKgQ"

	session_20160206: "[
		Saturday, February 6th, 2016 8:00 AM
		- Planned
			* Creation - Forms of
				- (1) `default_create' (2) one-to-many creation procedures
				- Eif: {ANY} `default_create' v. Java: "no-arg constructor" (see: Oracle tutorial)
				- Orthogonal: Arguments v. Procedures (how does this look in Java?)
					- max arg count = 4 (Eiffel Inspector)
					- class/feature too complex - refactor (more classes, more creators)
		- Unplanned
			* MVC (Model-View-Controller) Example using Eiffel Vision
				- Explain MVC as a "higher concept" (not a particular language implementation)
				- Build Windows app in Eiffel using MVC
				- Model: EV_APPLICATION - The event loop
				- View: EV_TITLED_WINDOW - The core visual container
				- Controller: Agents (functions wrapped as objects)
				- Agent queues (action queues)
		- Next
			- TUPLEs v. ARRAY as arguments (notion of compiler spoofing)
			- "compiler spoofing" arg count wrapped in run-time semantic where compiler cannot see
			- Argument anchoring (`creation_objects_anchor')
		]"
		EIS: "name=MVC", "src=$GITHUB/sav_training/docs/Model–view–controller.pdf"

	session_20160203: "[
		Wednesday, February 3rd, 2016 7:30 AM
		- Planned
			* Feature groups - Theory to Implementation (Language-X)
				- Simple class (e.g. class VEHICLE end)
				- Add empty feature groups
				- Add feature group names (comments)
				- Add features (engine, transmission, ...)
				- Add feature group clients
				- Compare/Contrast w/"public", "private", "hidden", etc.
			* Creation - Theory to Implementation (Language-X)
				- All languages have the notion of "creation"
				- Creation happens from a set of plans: Class
				- Creation theory (Pancake recipe theory)
				- More than one recipe, but just one notion of PANCAKE
				- 1-notion-having-many-creation-recipes-is-OKAY!
				- init (int pancakeCreationCode, int CreatorCode);
				- vs.
				- class PANCAKE

					create {HOME_BREW}
					  make_deairas_method,
					  make_brads_method,
					  make_bradleys_method,
					  make_michaels_method,
					  make_larrys_method

					create {CHEFS}
					  make_alton_brown_method,
					  make_gordon_ramsey
		]"
	EIS: "name=ecma_object_creation", "src=$GITHUB/sav_training/docs/object_creation.pdf"
	EIS: "name=comprehensive_eiffel_syntax_guide", "src=http://eiffel-guide.com/"
	EIS: "name=official_oracle_java_constructor", "src=https://docs.oracle.com/javase/tutorial/java/javaOO/constructors.html"
	EIS: "name=java_constructor_complete_study", "src=http://beginnersbook.com/2013/03/constructors-in-java/"
	EIS: "name=understanding_java_constructors", "src=http://www.javaworld.com/article/2076204/core-java/understanding-constructors.html"
	overall_reality_of_java_rules: "[
		The Java rules to object creation are irrational contrivances, where a
		constrivance is a device, especially in literary or artistic composition, 
		that gives a sense of artificiality. Therefore, the Java rules for object
		creation are artificial.
		]"
	EIS: "src=http://stackoverflow.com/questions/22627038/constructor-name-and-class-name-are-the-same-in-java-why"
	answer: "There is NO RATIONAL or LOGICAL reason for the Java constructor rules!"

	session_20160130: "[
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

	session_20160123: "[
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

note
	various_language_specifications: "[
		Specification documents for various languages
		=============================================
		
		There are a wide range of specifications for programming languages
		(especially the ones most used according to the Tiobe Index). The
		following notes represent a link to either a local PDF document or
		to some web resoure URL/URI. The number of pages is included to 
		provide some sense of scope. For eample, C++ with its 1,359 pages
		down to Python with 1 (possibly 2, depending on how you print it).
		
		If one spends a little time casually browsing these specifications,
		it ought to become obvious how each specification is alike and how
		they differ. The common programmer will (no doubt) be incredibly
		lost in a sea of technical jargon that seems largely targeted at
		language designers and not of much value to the average programmer.
		
		However, if you read the rest and then begin reading the Eiffel
		specification, one ought to quickly realize how helpful and learnable
		the specification is (in relative comparison). Nevertheless, it is
		precisely this form of understanding and reading that quickly
		propels a reader and student of these languages to mastery of them.
		Why? Because the compiler (parser, lexer, etc.) is built based on
		these logical constructions and rules. Understanding the rules
		translates instantly to a deep understanding to the language tool.
		
		Therefore—reading, understanding, and learning your language
		specification is a powerful tool with powerful rewards for those
		who take the time to read, learn, and understand as well as they
		can.
		]"

	top_ten_tiobe_index: "[
Jan 2016	Jan 2015	Change	Programming Language	Ratings	Change
1			2			change	Java					21.465%	+5.94%
2			1			change	C						16.036%	-0.67%
3			4			change	C++						6.914%	+0.21%
4			5			change	C#						4.707%	-0.34%
5			8			change	Python					3.854%	+1.24%
6			6					PHP						2.706%	-1.08%
7			16			change	Visual Basic .NET		2.582%	+1.51%
8			7			change	JavaScript				2.565%	-0.71%
9			14			change	Assembly language		2.095%	+0.92%
10			15			change	Ruby					2.047%	+0.92%
		]"
			EIS: "src=http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html"

	C: 		"pages=", 538
			EIS: "src=$GITHUB/sav_training/docs/n1124.pdf"

	Cpp:	"pages=", 1_359
			EIS: "src=$GITHUB/sav_training/docs/n3690.pdf"

	csharp: "pages=", 513
			EIS: "src=$GITHUB/sav_training/docs/CSharp Language Specification.pdf"

	eiffel: "pages=", 174
			EIS: "name=ecma_367_standard", "src=$GITHUB/sav_training/docs/ECMA-367.pdf"

	java: 	"pages=", 768
			EIS: "src=$GITHUB/sav_training/docs/jls8.pdf"

	php: 	"pages=", 167
			EIS: "src=https://github.com/php/php-langspec/blob/a610388d637b67294925d3b1dbbc0a54b7d94428/spec/php-spec-draft.md#grammars"
			EIS: "src=$GITHUB/sav_training/docs/php-langspec_php-spec-draft.pdf"

	python: "pages=", 1
			EIS: "src=https://docs.python.org/2/reference/grammar.html"

	ruby: 	"pages=", 311
			EIS: "src=$GITHUB/sav_training/docs/000011432.pdf"
end
