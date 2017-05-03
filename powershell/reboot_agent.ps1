#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ARENDA' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ARENDA'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ARENDA' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ARENDA'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$BUH_ANATON' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$BUH_ANATON'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$BUH_ANATON' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$BUH_ANATON'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$SMALLBUSINESSES' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$SMALLBUSINESSES'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$SMALLBUSINESSES' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$SMALLBUSINESSES'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_HALL' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_HALL'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_HALL' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_HALL'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_INT' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_INT'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_INT' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_INT'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUSGROUP' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUSGROUP'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUSGROUP' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUSGROUP'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_MALL' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_MALL'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_MALL' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_MALL'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_VEGAS' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_VEGAS'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_VEGAS' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_VEGAS'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$TMC' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$TMC'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$TMC' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$TMC'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_SHOPS' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_SHOPS'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_SHOPS' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_SHOPS'}
#--------------------------#
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_OTHER' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-002 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_OTHER'}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Stop-Service 'SQLAgent$ZUP_CROCUS_OTHER' -Force}
Start-Sleep 5
Invoke-Command -ComputerName cg-sql-001 -ScriptBlock {Start-Service 'SQLAgent$ZUP_CROCUS_OTHER'}