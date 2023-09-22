clear 
set more off
capture log close
set type double

	*** Set your working directory here
		
	global path = "C:/Users/abkmu/Documents/3900/Final Project/F.P"
	global Input = "$path/Input"
	global Output = "$path/Output"
	
	log using "$path/Logs/gen_wage_immi_gap", text replace
	

	use "$path/Input/november2019.dta"
	

	*****************
	* Resrtrictions *
	*****************
	
		*Drop obsersavation over 65 yrs and unemployed and not in Labour force
		drop if AGE_12 > 10 & (LFSSTAT == 3 | LFSSTAT == 4)
		
		*Drop obsersavationS of people who earn less than $12 dollars an hour
		drop if HRLYEARN < 12 
		
		*account for observations that are not in school
		gen notinschool = 0
		replace notinschool = 1 if SCHOOLN == 1
		
		*drop observstions that are full-time or part-time students
		drop if notinschool == 0
		drop notinschool
		
		drop if COWMAIN != 1 & COWMAIN != 2
		

	*******************************
	* Model Independent variables *
	*******************************
		****************
		* COMBINATIONS *
		****************
		
			*Combine Married and Living in COmmon Law partners
			gen cohabit = 0
			replace cohabit = 1 if MARSTAT < 3
			
			*Combine widowed, Separated, Divorced in one category
			*gen seperate = 0
			*replace seperate = 1 if MARSTAT > 2 & MARSTAT < 6
			
			*Separate single people
			gen single = 0
			replace single = 1 if MARSTAT == 6
	
		*Recode SEX variable 1 = female, 0 = male
		gen female = 0
		replace female = 1 if SEX == 2
		
		*Tenure
		rename TENURE tenure
		
		*Immmigrants of less than 10 years of age
		gen new_immig = 0
		replace new_immig = 1 if IMMIG == 1
		rename new_immig shortterm_immig 

		*Immigrants of more than 10 years
		gen old_immig = 0
		replace old_immig = 1 if IMMIG == 2
		rename old_immig longterm_immig
		
		*Obesrvations of people who complited their Diploma, Bachelor's degree and attained a degree beyond Bachelors
		gen higheredu = 0
		replace higheredu = 1 if EDUC > 3
		
		*Province
		rename PROV province
		
		*Union Membership
		rename UNION union_mem
		
		*Industry
		rename NAICS_21 industry
		
		
		*********************
		* Interaction Terms *
		*********************
			gen shortterm_immig_female = shortterm_immig * female
			
			gen longterm_immig_female = longterm_immig * female

	
	**********************
	* Dependent variable *
	**********************
	
		gen lhwage = log(HRLYEARN)
	
		reg lhwage female cohabit single shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female higheredu tenure union_mem i.province i.industry

	
	*keep lhwage female cohabit seperate shortterm_immig longterm_immig canadian shortterm_immig_female longterm_immig_female canadian_female higheredu

	*order lhwage female cohabit seperate shortterm_immig longterm_immig canadian shortterm_immig_female longterm_immig_female canadian_female higheredu
	
	*Drop 
	*drop if missing(lhwage)
	
	/*
	regress lhwage female shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female
	
	reg lhwage female shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female higheredu
	*/
	

	
	
	******************************
	* POST COVID - November 2022 *
	******************************
	clear 
	use "$path/Input/november2022.dta"
	

	*****************
	* Resrtrictions *
	*****************
	
		*Drop obsersavation over 65 yrs and unemployed and not in Labour force
		drop if AGE_12 > 10 & (LFSSTAT == 3 | LFSSTAT == 4)
		
		*Drop obsersavationS of people who earn less than $12 dollars an hour
		drop if HRLYEARN < 12 
		
		*account for observations that are not in school
		gen notinschool = 0
		replace notinschool = 1 if SCHOOLN == 1
		
		*drop observstions that are full-time or part-time students
		drop if notinschool == 0
		drop notinschool
		
		drop if COWMAIN != 1 & COWMAIN != 2
		

	*******************************
	* Model Independent variables *
	*******************************
		****************
		* COMBINATIONS *
		****************
		
			*Combine Married and Living in COmmon Law partners
			gen cohabit = 0
			replace cohabit = 1 if MARSTAT < 3
			
			*Combine widowed, Separated, Divorced in one category
			*gen seperate = 0
			*replace seperate = 1 if MARSTAT > 2 & MARSTAT < 6
			
			*Separate single people
			gen single = 0
			replace single = 1 if MARSTAT == 6
	
	
		*Recode SEX variable 1 = female, 0 = male
		gen female = 0
		replace female = 1 if SEX == 2
		
		*Tenure
		rename TENURE tenure
		
		*Immmigrants of less than 10 years of age
		gen new_immig = 0
		replace new_immig = 1 if IMMIG == 1
		rename new_immig shortterm_immig 

		*Immigrants of more than 10 years
		gen old_immig = 0
		replace old_immig = 1 if IMMIG == 2
		rename old_immig longterm_immig
		
		*Obesrvations of people who complited their Diploma, Bachelor's degree and attained a degree beyond Bachelors
		gen higheredu = 0
		replace higheredu = 1 if EDUC > 3
		
		*Province
		rename PROV province
		
		*Union Membership
		rename UNION union_mem
		
		*Industry
		rename NAICS_21 industry
		
		
		*********************
		* Interaction Terms *
		*********************
			gen shortterm_immig_female = shortterm_immig * female
			
			gen longterm_immig_female = longterm_immig * female

	
	**********************
	* Dependent variable *
	**********************
	
		gen lhwage = log(HRLYEARN)
	
		reg lhwage female cohabit single shortterm_immig longterm_immig shortterm_immig_female longterm_immig_female higheredu tenure union_mem i.province i.industry

	
	
	log close