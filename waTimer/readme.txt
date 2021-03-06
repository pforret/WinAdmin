
### [[waTimer.wsf]] v1.21 (Nov 2018)
### Peter Forret - https://github.com/pforret/WinAdmin
Script to time execution of programs/scripts and calculate throughput statistics afterwards.
Usage: waTimer.wsf cmd par [/total:value] [/bar:value] [/calc:value] [/unit:value] [/scale:value] [/isize:value] [/osize:value] [/text] [/ver] [/v] [/q] [/log:value]

Options:

cmd   : command - WAIT/START/PROGRESS/STOP
par   : parameter - (WAIT) # seconds to wait - (START/STOP) timer ID
total : (PROGRESS) show progress for X of TOTAL things that have been done (default: 100)
bar   : (PROGRESS) show progress as bar instead of as numbers (always to STDOUT, not to file)
calc  : (STOP) calculate # events/sec stats
		/calculate:5120000 : divide 5120000 by the # of seconds elapsed to calculate e.g. bytes/sec
unit  : (STOP) Unit to use for calculation display (default: #/sec)
scale : (STOP) Scale for stat calculation (default: 1)
		/scale:100 = divide calculate input by 100 (e.g. to get m instead of cm)
		/scale:hr  = multiply to get per hour stats (also /scale:min for minutes)
		/scale:K(k,M,m,G,g): divide to get Kilo,Mega,Giga (k uses 1000, K uses 1024)
isize : (STOP) Filename of input: size will be used to calculate stats
osize : (STOP) Filename of output: size will be used to calculate stats
text  : (STOP) only output pure numbers, no fancy text (easier for parsing)

ver   : version - show version and license information
	
v     : verbose - show debug output during execution
q     : quiet   - show no output during execution
log   : logfile - log output in file
	if filename='D' use [script name].YYYYMMDD.log as log file
	if filename='M' use [script name].YYYYMM.log as log file
	if no filename given use [script name].log as log file

Examples:

waTimer PROGRESS 88 /total:150
:: should give: 
:: 58.67%

waTimer PROGRESS 88 /total:150 /bar
:: should give 
:: [#############################_____________________] 58.67%

waTimer START test
waTimer WAIT 3
waTimer STOP test /calc:20 /scale:hr /unit:tests/hour
:: should give something like
:: waTimer - test : 3.75 seconds elapsed
:: waTimer - test : Throughput = 19,204 tests/hour

:: _____ TYPICAL SEQUENCE _____
waTimer START mytest
:: ...
waTimer PROGRESS 50 /total:150
:: ...
waTimer PROGRESS 100 /total:150
:: ...
waTimer PROGRESS 150 /total:150
waTimer STOP  mytest /calc:150  /unit:copy/hr

