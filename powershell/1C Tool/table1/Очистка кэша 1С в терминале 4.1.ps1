Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='1С'
$main_form.Width = 250
$main_form.Height = 200
$main_form.AutoSize = $true
$main_form.StartPosition = "CenterScreen"

$GroupBox = New-Object System.Windows.Forms.GroupBox
$GroupBox.Text = "Очистка кэша на терминальниках"
$GroupBox.AutoSize = $true
$GroupBox.Location  = New-Object System.Drawing.Point(10,10)


$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Логин"
$Label.Location  = New-Object System.Drawing.Point(10,20)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location  = New-Object System.Drawing.Point(10,40)
$TextBox.Text = ''
$TextBox.AcceptsReturn = $true
$main_form.Controls.Add($TextBox)

    $wshell = New-Object -ComObject Wscript.Shell

$button = New-Object System.Windows.Forms.Button
$button.Text = 'Выполнить'
$button.Location = New-Object System.Drawing.Point(10,70)
$main_form.Controls.Add($button)

$buttonCode={
$servers = "004", "005", "007", "008", "009", "010"
foreach ($ts in $servers)
{
$user = $TextBox.Text
$Path = 
"\\cg-ts-$ts\c$\Users\$user\AppData\*\1C\1cv8\*"

$items = Get-ChildItem -Path $Path 
$cnt   = $items.Count


if ($cnt -gt 0) {
    get-childitem $Path |remove-item -force -recurse
    $wshell.Popup("Удалено объектов: "+$cnt,0,"cg-ts-"+$ts,0)
} else {
    $wshell.Popup("Объекты не найдены",0,"cg-ts-"+$ts,0)
}
}
}
$button.Add_Click($buttonCode)
$GroupBox.Controls.Add($Label)
$GroupBox.Controls.Add($TextBox)
$GroupBox.Controls.Add($button)

$main_form.Controls.Add($GroupBox)

$main_form.ShowDialog()