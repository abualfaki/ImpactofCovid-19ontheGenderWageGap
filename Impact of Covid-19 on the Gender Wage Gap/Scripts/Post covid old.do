	clear 
	use "$path/Input/november2022.dta"
	
	drop if AGE_12 > 10 & (LFSSTAT == 3 | LFSSTAT == 4)
	
	*Drop obsersavation of people who earn less than $12 dollars an hour
	drop if HRLYEARN < 12 
	
	*Recode SEX variable 1 = female, 0 = male
	gen female = 0
	replace female = 1 if SEX == 2
	
	*Combine Married and Living in COmmon Law partners
	gen cohabit = 0
	replace cohabit = 1 if MARSTAT < 3
	
	*Combine Separated, Divorced and single never married in one category
	gen seperate = 0
	replace seperate = 1 if MARSTAT > 2 & MARSTAT < 6
	
	*Separate single people
	gen single = 0
	replace single = 1 if MARSTAT == 6
	
	*Immmigrants of less than 10 years of age

		
	******************************
	* POST COVID - November 2022 *
	******************************
	
	gen new_immig = 0
	replace new_immig = 1 if IMMIG == 1
	rename new_immig shortterm_immig 

	*Immigrants of more than 10 years
	gen old_immig = 0
	replace old_immig = 1 if IMMIG == 2
	rename old_immig longterm_immig
	
	*Canadian  Citizen
	gen canadian = 0
	replace canadian = 1 if IMMIG == 3
	
	*Interaction Terms
	gen shortterm_immig_female = shortterm_immig * female
	gen longterm_immig_female = longterm_immig * female
	
	*Candian Female
	gen canadian_female = canadian * female
	gen lhwage = log(HRLYEARN)
	
	*account for observations that are not in school
	gen notinschool = 0
	replace notinschool = 1 if SCHOOLN == 1
	
	*drop observstions that are full-time or part-time students
	drop if notinschool == 0
	drop notinschool
	
	*Obesrvations of people who complited their Diploma, Bachelor's degree and attained a degree beyond Bachelors
	gen higheredu = 0
	replace higheredu = 1 if EDUC > 3
	
	keep lhwage female cohabit seperate shortterm_immig longterm_immig canadian shortterm_immig_female longterm_immig_female canadian_female higheredu

	order lhwage female cohabit seperate shortterm_immig longterm_immig canadian shortterm_immig_female longterm_immig_female canadian_female higheredu
	
	*Drop 
	drop if missing(lhwage)
	
	regress lhwage female shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female
	
	reg lhwage female shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female higheredu
	
	
	/*
	recode SEX (2 = 1 "Female") (1 = 0 "Male") , gen(refemale)
	
	
	*Rename variable
	rename SEX female
	rename IMMIG immig
	rename EDUC edulevel
	
	
	*Interaction Term
	gen immi_female = immig * female
	
	*/