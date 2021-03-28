
******************************
*** Child vaccination ********
******************************   

*c_measles	child			Child received measles1/MMR1 vaccination
        
		gen c_measles  =. 
		if ~inlist(name,"Albania2008","Azerbaijan2006","Guyana2009") {
			replace c_measles = 1 if inrange(h9,1,3)  
			replace c_measles = 0 if h9 == 0  	
		}
		if inlist(name,"Albania2008") {
			replace c_measles = 1 if (inrange(h9,1,3) | inrange(sh9,1,3) | inrange(sv9,1,3))  
			replace c_measles = 0 if h9 == 0 & sh9 == 0 & sv9 == 0   
		}
		if inlist(name,"Azerbaijan2006") {
			replace c_measles = 1 if inrange(h9,1,3) | inrange(s506mr,1,3)
			replace c_measles = 0 if h9 == 0 & s506mr == 0  
		}
		if inlist(name,"Guyana2009") {
			replace c_measles = 1 if inrange(h9,1,3) | inrange(smr1,1,3)
			replace c_measles = 0 if h9 == 0 & smr1 == 0  
		}
		
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        gen c_dpt1  = . 
		replace c_dpt1  = 1 if inrange(h3,1,3)
		replace c_dpt1  = 0 if h3 == 0  
		
		if inlist(name,"Albania2008") {
			replace c_dpt1  = 1 if (inrange(h3,1,3) | inrange(sh3,1,3) | inrange(sv3,1,3))  
		    replace c_dpt1  = 0 if h3 == 0 & sh3 == 0 & sv3 == 0
		}
*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination				
		gen c_dpt2  = . 
		replace c_dpt2  = 1 if inrange(h5,1,3)
		replace c_dpt2  = 0 if h5 == 0  
		
		if inlist(name,"Albania2008") {
			replace c_dpt2  = 1 if (inrange(h5,1,3) | inrange(sh5,1,3) | inrange(sv5,1,3))  
		    replace c_dpt2  = 0 if h5 == 0  & sh5 == 0 & sv5 == 0
		}
		
*c_dpt3	child			Child received DPT3/Pentavalent3 vaccination				
		gen c_dpt3  = . 
		replace c_dpt3  = 1 if inrange(h7,1,3) 
		replace c_dpt3  = 0 if h7 == 0  
		
		if inlist(name,"Albania2008") {
			replace c_dpt3  = 1 if (inrange(h7,1,3) | inrange(sh7,1,3) | inrange(sv7,1,3))  
		    replace c_dpt3  = 0 if h7 == 0 & sh7 == 0 & sv7 == 0
		}
	
*c_bcg	child			Child received BCG vaccination
		gen c_bcg  = . 
		replace c_bcg  = 1 if inrange(h2,1,3) 
		replace c_bcg  = 0 if h2 == 0  	
		
		if inlist(name,"Albania2008") {
			replace c_bcg  = 1 if inrange(h2,1,3) | inrange(sh2,1,3) | inrange(sv2,1,3)
			replace c_bcg  = 0 if h2 == 0 & sh2 == 0 & sv2 == 0
		}
		
*c_polio1	child			Child received polio1/OPV1 vaccination
		gen c_polio1  = .  
		replace c_polio1  = 1 if inrange(h4,1,3) 
		replace c_polio1  = 0 if h4 ==0  
		if inlist(name,"Albania2008") {
			replace c_polio1  = 1 if inrange(h4,1,3) | inrange(sh4,1,3) | inrange(sv4,1,3)
			replace c_polio1  = 0 if h4 == 0  & sh4 == 0 & sv4 == 0
		}
*c_polio2	child			Child received polio2/OPV2 vaccination				
		gen c_polio2  = .  
		replace c_polio2  = 1 if inrange(h6,1,3)  
		replace c_polio2  = 0 if h6 ==0  
		if inlist(name,"Albania2008") {
			replace c_polio2  = 1 if inrange(h6,1,3) | inrange(sh6,1,3) | inrange(sv6,1,3)
			replace c_polio2  = 0 if h6 == 0 & sh6 == 0 & sv6 == 0
		}
		
*c_polio3	child			Child received polio3/OPV3 vaccination				
		gen c_polio3  = .  
		replace c_polio3  = 1 if inrange(h8,1,3)
		replace c_polio3  = 0 if h8 ==0  
		if inlist(name,"Albania2008") {
			replace c_polio3  = 1 if inrange(h8,1,3) | inrange(sh8,1,3) | inrange(sv8,1,3)
			replace c_polio3  = 0 if h8 == 0 & sh8 == 0 & sv8 == 0
		}
		
*c_fullimm	child			Child fully vaccinated						
		gen c_fullimm =.  										/*Note: polio0 is not part of allvacc- see DHS final report*/
		replace c_fullimm =1 if (c_measles==1 & c_dpt1 ==1 & c_dpt2 ==1 & c_dpt3 ==1 & c_bcg ==1 & c_polio1 ==1 & c_polio2 ==1 & c_polio3 ==1)  
		replace c_fullimm =0 if (c_measles==0 | c_dpt1 ==0 | c_dpt2 ==0 | c_dpt3 ==0 | c_bcg ==0 | c_polio1 ==0 | c_polio2 ==0 | c_polio3 ==0)  
		replace c_fullimm =. if b5 ==0  

/*add more logic for Rwanda2005 below
///dfdfdfdfdf
						
