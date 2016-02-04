class
	VEHICLE

feature {MECHANIC, OWNER} -- Engine

	engine: ANY
		attribute
			create Result
		end

	transmission: ANY
		attribute
			create Result
		end

feature {CAR_WASH} -- Body

	hood: ANY
		attribute
			create Result
		end

	doors: ANY
		attribute
			create Result
		end

	trunk: ANY
		attribute
			create Result
		end

feature {OWNER, PASSENGER} -- Interior

	seats: ANY
		attribute
			create Result
		end

	console: ANY
		attribute
			create Result
		end

	dash: ANY
		attribute
			create Result
		end

feature {OWNER, GAS_STATION_ATTENDENT} -- Exterior

	fuel_filler: ANY
		attribute
			create Result
		end

;end
