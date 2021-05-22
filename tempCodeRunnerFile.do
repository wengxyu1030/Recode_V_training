	foreach var of varlist m2a-m2m {
	local lab: variable label `var' 
    replace `var' = . if ///
        !regexm("`lab'","trained") & ///
	(!regexm("`lab'","doctor|nurse|midwife|lady health worker|aide soignante|assistante accoucheuse|clinical officer|mch aide|auxiliary birth attendant|physician assistant|professional|ferdsher|skilled|community health care provider|birth attendant|hospital/health center worker|hew|auxiliary|icds|feldsher|mch|vhw|village health team|health personnel|gynecolog(ist|y)|obstetrician|internist|pediatrician|family welfare visitor|medical assistant|health assistant|ma/sacmo|obgyn") ///
	|regexm("`lab'","na^|-na|traditional birth attendant|untrained|unqualified|empirical midwife|trad.|other")) | regexm("`lab'","untrained")
	replace `var' = . if !inlist(`var',0,1)
	 }
	/* do consider as skilled if contain words in 
	   the first group but don't contain any words in the second group */
   
	egen anc_skill = rowtotal(m2a-m2m),mi	
	