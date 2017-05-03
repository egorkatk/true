$user = ""
$Path = 
"\\cg-ts-004\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-004\c$\Users\$user\AppData\Roaming\1C\1cv8",

"\\cg-ts-005\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-005\c$\Users\$user\AppData\Roaming\1C\1cv8",

"\\cg-ts-007\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-007\c$\Users\$user\AppData\Roaming\1C\1cv8",

"\\cg-ts-008\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-008\c$\Users\$user\AppData\Roaming\1C\1cv8",

"\\cg-ts-009\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-009\c$\Users\$user\AppData\Roaming\1C\1cv8",

"\\cg-ts-010\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-010\c$\Users\$user\AppData\Roaming\1C\1cv8"

get-childitem $Path -recurse | where {$_.lastwritetime -lt (get-date) -and -not $_.psiscontainer} |% {remove-item $_.fullname -force}
Start-Sleep 5
Get-ChildItem -Path "\\cg-ts-004\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-004\c$\Users\$user\AppData\Roaming\1C\1cv8", "\\cg-ts-005\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-005\c$\Users\$user\AppData\Roaming\1C\1cv8", "\\cg-ts-007\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-007\c$\Users\$user\AppData\Roaming\1C\1cv8", "\\cg-ts-008\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-008\c$\Users\$user\AppData\Roaming\1C\1cv8", "\\cg-ts-009\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-009\c$\Users\$user\AppData\Roaming\1C\1cv8", "\\cg-ts-010\c$\Users\$user\AppData\Local\1C\1cv8", "\\cg-ts-010\c$\Users\$user\AppData\Roaming\1C\1cv8" -Recurse -Force | 
Where-Object {$_.PSIsContainer -eq $true} | 
% {if((Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue | 
    Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).sum -eq $null){
    Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue}
    }