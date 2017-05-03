get-pssnapin -registered | add-pssnapin -passthru -ErrorAction SilentlyContinue
Get-Module -ListAvailable| Import-Module -PassThru -ErrorAction SilentlyContinue
Get-ADComputer -properties lastLogonDate -SearchBase "OU=Ve2,OU=Computers CG,DC=net,DC=crocusgroup,DC=ru" -filter * | where { $_.lastLogonDate -lt (get-date).addmonths(-3) } | out-File -Encoding default c:\ListOldComp\ListOldComp.txt