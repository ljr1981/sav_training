note
	concepts: "[
		QUESTION: What makes this class "more useful"?
		
		(1) The reserved word "deferred" does the trick!
		(2) By not being deferred, the {SIMPLEST_BUT_NOT_VERY_USEFUL_CLASS}
			implied it has an implementation, but it does not. Creating
			an instance of it does nothing for us.
		(3) However, this class loses the expectation of creation and
			takes up the banner of: "I-am-the-basis-for-others", which
			is a far more powerful concept.
		]"
deferred class
	SIMPLE_BUT_MORE_USEFUL_CLASS

note
	next: "[
		Let's add some features to a deferred class that we design ...
		]"
end
