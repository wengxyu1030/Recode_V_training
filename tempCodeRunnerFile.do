clonevar c_caesarean = m17
	replace c_caesarean = . if c_caesarean == 9
	replace c_caesarean = . if m15 == 11|m15 == 12|m15 == 96