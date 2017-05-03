$old="*8.3.9.1850*"
$new="8.3.9.1818"
$dn="*oso*"
$a = Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" | where {$_.DisplayName -like $dn}

foreach ($proc in $a) {
        if ($proc.FilePath -like "*1cv8c.exe*") {Set-RDRemoteApp -CollectionName "1C" -alias $proc.Alias -FilePath "D:\Program Files (x86)\1cv8\$new\bin\1cv8c.exe" -FileVirtualPath "D:\Program Files (x86)\1cv8\$new\bin\1cv8c.exe" -IconPath "D:\Program Files (x86)\1cv8\$new\bin\1cv8c.exe"}
        else {Set-RDRemoteApp -CollectionName "1C" -alias $proc.Alias -FilePath "D:\Program Files (x86)\1cv8\$new\bin\1cv8.exe" -FileVirtualPath "D:\Program Files (x86)\1cv8\$new\bin\1cv8.exe" -IconPath "D:\Program Files (x86)\1cv8\$new\bin\1cv8.exe"}
}