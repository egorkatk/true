Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Для 1С 8.3.9.1850'
$main_form.Width = 400
$main_form.Height = 300
$main_form.AutoSize = $true
$main_form.StartPosition = "CenterScreen"

$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Width = 400
$TabControl.Height = 300

$TabPage1 = New-Object System.Windows.Forms.TabPage
$TabPage1.Text = 'Очистка кэша'

$GroupBox = New-Object System.Windows.Forms.GroupBox
$GroupBox.Text = "Очистка кэша на терминальниках"
$GroupBox.AutoSize = $true
$GroupBox.Location  = New-Object System.Drawing.Point(0,10)


$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Введите логин"
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
$TabPage2.Text = 'Тип клиента'

function TypeInfo {


if ($RadioButton1.Checked -eq $true) {$type='1cv8c'}
if ($RadioButton2.Checked -eq $true) {$type='1cv8'}

Import-Module remotedesktop

Set-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -alias "$alias" -FilePath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -FileVirtualPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -IconPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe"


                     }


        $wshell = New-Object -ComObject Wscript.Shell
            
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(150,240)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "Изменить"
$OKButton.Add_Click({



    $x=$objListBox.SelectedItem;
        
        $alias = (Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -DisplayName $x | ForEach-Object Alias)

  TypeInfo
        
        $wshell.Popup("Тип клиента для базы "+$x+" изменен",0,"Готово",0)
        
})
$TabPage2.Controls.Add($OKButton)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,10) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Выберите базу:"
$TabPage2.Controls.Add($objLabel) 

$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location  = New-Object System.Drawing.Point(100,200)
$RadioButton1.Text = 'Тонкий (THIN)'
$RadioButton1.AutoSize = $true
$TabPage2.Controls.Add($RadioButton1)

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location  = New-Object System.Drawing.Point(200,200)
$RadioButton2.Text = 'Толстый (FAT)'
$RadioButton2.AutoSize = $true
$TabPage2.Controls.Add($RadioButton2)

$objListBox = New-Object System.Windows.Forms.ListBox 
$objListBox.Location = New-Object System.Drawing.Size(10,40) 
$objListBox.Size = New-Object System.Drawing.Size(360,20) 
$objListBox.Height = 140
        
        $srv = Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" | ForEach-Object DisplayName | Sort-Object
           
           foreach ($t in $srv) 

{ 
   [void] $objListBox.Items.Add($t)
} 
      

$TabPage2.Controls.Add($objListBox) 

$TabControl.Controls.Add($TabPage1)
$TabControl.Controls.Add($TabPage2)
$TabControl.Location  = New-Object System.Drawing.Point(0,0)

$main_form.Controls.add($TabControl)

$main_form.ShowDialog()