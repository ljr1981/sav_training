class
	VEHICLE_JUNK

feature {MECHANIC, OWNER} -- Engine

	engine,
	transmission: ANY
		attribute
			create Result
		end

feature {OWNER, PASSENGERS} -- Interior

	seats,
	console,
	steering_wheel: ANY
		attribute
			create Result
		end

feature {OWNER, CAR_WASH} -- Exterior

	hood,
	body,
	doors,
	wheels,
	trim: ANY
		attribute
			create Result
		end

end
