gen c_pnc_any = .
		replace c_pnc_any = 0 if m62 != . | m66 != . | m70 != . 
		replace c_pnc_any = 1 if (m63 <= 306 & m64_skill == 1) | (m67 <= 306 & m68_skill == 1) | (m71 <= 306 & m72_skill == 1) 
		replace c_pnc_any = . if inlist(m63,199,299,399,998) | inlist(m67,199,299,399,998) | inlist(m71,199,299,399,998) | m62 == 8 | m66 == 8 | m70 == 8 
	
	
	gen c_pnc_eff = .
		
		replace c_pnc_eff = 0 if m62 != . | m66 != . | m70 != .
		replace c_pnc_eff = 1 if (((inrange(m63,100,124) | m63 == 201 ) & m64_skill == 1) | ((inrange(m67,100,124) | m67 == 201) & m68_skill == 1)) & ((inrange(m71,100,124) | m71 == 201) & m72_skill == 1) 
		replace c_pnc_eff = . if inlist(m63,199,299,399,998) | inlist(m67,199,299,399,998) | inlist(m71,199,299,399,998) | m62 == 8 | m66 == 8 | m70 == 8 