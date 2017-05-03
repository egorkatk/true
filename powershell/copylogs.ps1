taskkill /F /IM ragent.exe
taskkill /F /IM rmngr.exe
taskkill /F /IM rphost.exe
taskkill /F /IM httpd.exe
taskkill /F /IM w3wp.exe
taskkill /F /IM 1cv8c.exe
taskkill /F /IM 1cv8.exe

$CurrentDate = Get-Date

if ($CurrentDate.Day -lt 10) {
$day = "0" + $CurrentDate.Day
}
else {
$day = $CurrentDate.Day
}

if ($CurrentDate.Month -lt 10) {
$month = "0" + $CurrentDate.Month
}
else {
$month = $CurrentDate.Month
}

$newfoldername = $newday +"."+ $newmonth +"."+ $CurrentDate.Year

Stop-Service '1C:Enterprise 8.3 Server Agent (x86-64)' -Force

Copy-Item -Path "\\cg-sql-1c-001\d$\LOGS" -Destination "\\cg-fs-003\IT Otdel\Отдел информационного обеспечения\1c\Logs\$newfoldername" -Force -Recurse

Start-Sleep 60

Remove-Item -path "\\cg-sql-1c-001\d$\LOGS\*" -Force -Recurse

Start-Service '1C:Enterprise 8.3 Server Agent (x86-64)'

set LOG_FILE="scripts.log"
set SERVICE_1C_NAME="1C:Enterprise 8.3 Server Agent (x86-64)"
set SERVICE_RAS_NAME="1C:Enterprise 8.3 Remote Server"
echo start %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
sc start %SERVICE_1C_NAME%
sc start %SERVICE RAS NAME%
echo done start %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%