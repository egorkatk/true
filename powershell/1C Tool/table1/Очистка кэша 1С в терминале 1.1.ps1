$user = ""
$server = "cg-ts-004", "cg-ts-005", "cg-ts-007", "cg-ts-008", "cg-ts-009", "cg-ts-010"
$Path = 
"\\$server\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\$server\c$\Users\$user\AppData\Roaming\1C\1cv8"

get-childitem $Path -recurse | where {$_.lastwritetime -lt (get-date) -and -not $_.psiscontainer} |% {remove-item $_.fullname -force}
Start-Sleep 5
Get-ChildItem -Path "\\$server\c$\Users\$user\AppData\Local\1C\1cv8", "\\$server\c$\Users\$user\AppData\Roaming\1C\1cv8" -Recurse -Force | 
Where-Object {$_.PSIsContainer -eq $true} | 
% {if((Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue | 
    Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).sum -eq $null){
    Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue}
    }