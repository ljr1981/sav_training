note
	EIS: "name=java_awt_Class_Point", "src=https://docs.oracle.com/javase/7/docs/api/java/awt/Point.html"
class
	JAVA_POINT

-- Constructor and Description
	-- Point()
	-- Point(int x, int y)
	-- Point(Point p)

create
	make_at_origin,
	make_at_x_y,
	make_with_companion

feature {NONE} -- Initialization

	make_at_origin
			-- `make_at_origin' (0, 0)
		do
			do_nothing --
		end

	make_at_x_y (a_x, a_y: INTEGER)
			-- `make_at_x_y' `a_x' `a_y'.
		do
			x := a_x
			y := a_y
		ensure
			x_set: x = a_x
			y_set: y = a_y
		end

	make_with_companion (a_point: JAVA_POINT)
		do
			companion := a_point
		end

feature -- Access

	companion: detachable JAVA_POINT
			-- `companion' of Current.

	x, y: INTEGER
			-- 2D Coordinates

;note
	java_point_description: "[
		Constructors 
		Constructor and Description
		Point()
		Constructs and initializes a point at the origin (0, 0) of the coordinate space.
		Point(int x, int y)
		Constructs and initializes a point at the specified (x,y) location in the coordinate space.
		Point(Point p)
		Constructs and initializes a point with the same location as the specified Point object.
		]"
end
