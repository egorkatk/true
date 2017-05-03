Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='1С'
$main_form.Width = 250
$main_form.Height = 200
$main_form.AutoSize = $true
$main_form.StartPosition = "CenterScreen"
$main_form.Topmost = $True

$GroupBox = New-Object System.Windows.Forms.GroupBox
$GroupBox.Text = "Очистка кэша на терминальнике"
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

$button = New-Object System.Windows.Forms.Button
$button.Text = 'Выполнить'
$button.Location = New-Object System.Drawing.Point(10,70)
#$button.DialogResult = [System.Windows.Forms.DialogResult]::OK
$main_form.Controls.Add($button)

$buttonCode={
$servers = "004"
foreach ($ts in $servers)
{
$user = $TextBox.Text
$Path = 
"\\cg-ts-$ts\c$\Users\$user\AppData\Local\1C\1cv8", 
"\\cg-ts-$ts\c$\Users\$user\AppData\Roaming\1C\1cv8"

get-childitem $Path -recurse | where {$_.lastwritetime -lt (get-date) -and -not $_.psiscontainer} |% {remove-item $_.fullname -force}
}
}
$button.Add_Click($buttonCode)
$GroupBox.Controls.Add($Label)
$GroupBox.Controls.Add($TextBox)
$GroupBox.Controls.Add($button)

$main_form.Controls.Add($GroupBox)

$main_form.ShowDialog()