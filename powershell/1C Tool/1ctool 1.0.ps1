Add-Type -assembly System.Windows.Forms


$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='1С'
$main_form.Width = 250
$main_form.Height = 200
$main_form.AutoSize = $true
$main_form.StartPosition = "CenterScreen"

$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Width = 250
$TabControl.Height = 200

$TabPage1 = New-Object System.Windows.Forms.TabPage
$TabPage1.Text = 'Очистка кэша'

$GroupBox = New-Object System.Windows.Forms.GroupBox
$GroupBox.Text = "Очистка кэша на терминальниках"
$GroupBox.AutoSize = $true
$GroupBox.Location  = New-Object System.Drawing.Point(0,10)


$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Логин"
$Label.Location  = New-Object System.Drawing.Point(10,30)
$Label.AutoSize = $true
$TabPage1.Controls.Add($Label)

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location  = New-Object System.Drawing.Point(10,50)
$TextBox.Text = ''
$TextBox.AcceptsReturn = $true
$TabPage1.Controls.Add($TextBox)

    $wshell = New-Object -ComObject Wscript.Shell

$button = New-Object System.Windows.Forms.Button
$button.Text = 'Выполнить'
$button.Location = New-Object System.Drawing.Point(10,80)
$TabPage1.Controls.Add($button)

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
$TabPage1.Controls.Add($Label)
$TabPage1.Controls.Add($TextBox)
$TabPage1.Controls.Add($button)

$TabPage1.Controls.Add($GroupBox)


$TabPage2 = New-Object System.Windows.Forms.TabPage
$TabPage2.Text = 'TabPage2'

$TabControl.Controls.Add($TabPage1)
$TabControl.Controls.Add($TabPage2)
$TabControl.Location  = New-Object System.Drawing.Point(0,0)

$main_form.Controls.add($TabControl)

$main_form.ShowDialog()