
### [[waRmZip.wsf]] v1.71 (Nov 2018)
### Peter Forret - https://github.com/pforret/WinAdmin
Utility to clean up/free up space in a folder (and its subfolders),
* compressing files after a certain number of days (with external program)
* rotating files after a certain number of days/above a certain size
* deleting files and/or empty folders after a certain period of time
* moving files to other folders/disks
_____________________________________________________________________________


Usage: waRmZip.wsf BASE [/ca:value] [/cp:value] [/cpp:value] [/ce:value] [/da:value] [/dc] [/df] [/dr] [/ma:value] [/md:value] [/mb] [/ra:value] [/rn:value] [/rp:value] [/fo:value] [/fn:value] [/gt:value] [/lt:value] [/r] [/nh] [/t] [/v] [/q] [/log:value]

Options:

BASE : base folder where cleanup starts

ca   : compress files after X days                     (default: no compress)
cp   : compress program - command line                 (default: wzzip.exe)
cpp  : compress program - command parameters           (default: folder\$out $folder\$in)
ce   : compressed file extension                       (default: .zip)

da   : delete files after X days                       (default: no delete)
dc   : delete compressed files too after X days        (default: don't delete archives)
df   : delete empty folders - only when /r is used     (default: don't delete folders)
dr   : delete read-only files/folders                  (default: don't delete read-only)

ma   : move files after X days                         (default: no backup)
md   : move files to this folder (can be local or UNC) (default: /ma does not work without this parameter)
	the following keywords are substituted: 
	$YEAR: YYYY, $MONTH: YYYYMM, $DAY: YYYYMMDD, $HOUR: HH, $COMP: COMPUTERNAME, $WEEKDAY: 1-7
	e.g: /md:F:\backup\$COMP\logfiles\$DAY
mb   : backup mode - do not delete file after moving   (default: delete)

ra   : rotate files after X days (creation date!)      (default: no rotate)
rn   : rotate & create new empty file after rotation   (default: do not create)
rp   : rotation prefix - D:YYYYMMDD                    (default: D)

fo   : filter only - only process files with extension (default: process all files)
fn   : filter not  - don't process files with extension(default: process all files)
gt   : greater than- only process when larger than     (default: 0 KB)
lt   : lesser than - only process when smaller than    (default: 4GB)
r    : recursive   - also process subfolders           (default: don't process subfolders)
nh   : no hidden   - do not process hidden files/folders(default: just process them)
t    : test mode   - don't actually process files - just show what would be done

v    : verbose     - show debug output during execution
q    : quiet       - no output during execution
log  : logfile     - write output to file
	if filename='D' use [script name].YYYYMMDD.log as log file
	if filename='M' use [script name].YYYYMM.log as log file
	if no filename given use [script name].log as log file


Examples: 
waRmZip.wsf /r  "C:\Inetpub\ftproot" /da:7 /df /dr /log:c:\Inetpub\ftp_cleanup.log
:: clean up FTP folders - delete all files older than 7 days and empty folders, even if read-only

waRmZip.wsf /r /f:.log "C:\WINNT\system32\Logfiles" /da:30 /dc /ca:14 /log:d
:: compress all log files older than 14 days, delete all files older than 30 days

waRmZip.wsf /r  "C:\Temp" /da:1 /df /q
:: delete all files older than 1 day, don't show output

waRmZip.wsf "d:\server\log" /ra:7 /fo:.txt /gt:1MB /log:d
:: rotate all .txt files greater than 1MB created more than 7 days ago

waRmZip.wsf /r /f:.log "C:\WINNT\system32\Logfiles" /ma:7 /md:f:\backup\$YEAR\$COMP\$DAY\IIS
:: move all log files older than 7 days to folder F:\backup\2004\server1\20040101\IIS

waRmZip.wsf /r /f:.log "C:\WINNT\system32\Logfiles" /ca:14 /cp:"c:\Program Files\7-Zip\7za.exe" /cpp:"a -tzip $out $in"
:: compress all log files older than 14 days with 7-Zip


