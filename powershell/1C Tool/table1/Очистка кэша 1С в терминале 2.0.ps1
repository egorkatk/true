$servers = "004", "005", "007", "008", "009", "010"
foreach ($ts in $servers)
{
$user = ""
$Path = 
"\\cg-ts-$ts\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-$ts\c$\Users\$user\AppData\Roaming\1C\1cv8"

get-childitem $Path -recurse | where {$_.lastwritetime -lt (get-date) -and -not $_.psiscontainer} |% {remove-item $_.fullname -force}
Start-Sleep 2
Get-ChildItem -Path "\\cg-ts-$ts\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-$ts\c$\Users\$user\AppData\Roaming\1C\1cv8" -Recurse -Force | 
Where-Object {$_.PSIsContainer -eq $true} | 
% {if((Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue | 
    Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).sum -eq $null){
    Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue}
    }
}