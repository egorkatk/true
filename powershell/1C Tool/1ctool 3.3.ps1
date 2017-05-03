Import-Module remotedesktop

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

$objListBox1 = New-Object System.Windows.Forms.ListBox 
$objListBox1.Location = New-Object System.Drawing.Size(10,125) 
$objListBox1.Size = New-Object System.Drawing.Size(360,20) 
$objListBox1.Height = 140

$TabPage1.Controls.Add($objListBox1)

$button1 = New-Object System.Windows.Forms.Button
$button1.Text = 'Выполнить'
$button1.Location = New-Object System.Drawing.Point(10,80)
$TabPage1.Controls.Add($button1)

$buttonCode={

$objListBox1.Items.Clear()

$servers = "004", "005", "007", "008", "009", "010"

foreach ($ts in $servers)
{
$user = $TextBox.Text
$Path = "\\cg-ts-$ts\c$\Users\$user\AppData\*\1C\1cv8\*"

$items = Get-ChildItem -Path $Path 
$cnt   = $items.Count


if ($cnt -gt 0) {
    Remove-Item -path $Path -Force -Recurse
    $objListBox1.Items.Add("На cg-ts-"+$ts+" удалено объектов: "+$cnt)   
} else {
    $objListBox1.Items.Add("Объекты на cg-ts-"+$ts+" не найдены")
}
}
}
$button1.Add_Click($buttonCode)
$TabPage1.Controls.Add($Label)
$TabPage1.Controls.Add($TextBox)
$TabPage1.Controls.Add($button1)

$TabPage1.Controls.Add($GroupBox)


$TabPage2 = New-Object System.Windows.Forms.TabPage
$TabPage2.Text = 'Тип клиента'

function buttonoff {
$OKButton.Enabled = $false
$SearchButton.Enabled = $false
$CheckButton.Enabled = $false
}

function buttonon {
$OKButton.Enabled = $true
$SearchButton.Enabled = $true
$CheckButton.Enabled = $true
}

function TypeInfo {

buttonoff  

if ($RadioButton1.Checked -eq $true) {$type='1cv8c'}
if ($RadioButton2.Checked -eq $true) {$type='1cv8'}

Set-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -alias "$alias" -FilePath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -FileVirtualPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -IconPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe"

buttonon  

                     }

function  search {

buttonoff                  

$objListBox2.Items.Clear()

$search = $TextBox2.Text

       $srv = Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C"  -DisplayName "*$search*"| ForEach-Object DisplayName | Sort-Object
          
           foreach ($t in $srv) 

{ 
   [void] $objListBox2.Items.Add($t)
}

buttonon                   
                    
}

        $wshell = New-Object -ComObject Wscript.Shell
            
$TextBox2 = New-Object System.Windows.Forms.TextBox
$TextBox2.Location = New-Object System.Drawing.Size(10,30) 
$TextBox2.Size = New-Object System.Drawing.Size(250,20) 
$TextBox2.Text = ""
$TextBox2.AcceptsReturn = $true
$TabPage2.Controls.Add($TextBox2) 

$SearchButton = New-Object System.Windows.Forms.Button
$SearchButton.Location = New-Object System.Drawing.Size(290,28)
$SearchButton.Size = New-Object System.Drawing.Size(75,23)
$SearchButton.Text = "Поиск"
$SearchButton.Add_Click({search})
$TabPage2.Controls.Add($SearchButton)

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(208,240)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "Изменить"
$OKButton.Enabled = $false
$OKButton.Add_Click({

    $x=$objListBox2.SelectedItem;
        
        $alias = (Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -DisplayName $x | ForEach-Object Alias)

  TypeInfo
        
        $wshell.Popup("Тип клиента для базы "+$x+" изменен",0,"Готово",0)
        
})

$TabPage2.Controls.Add($OKButton)

$CheckButton = New-Object System.Windows.Forms.Button
$CheckButton.Location = New-Object System.Drawing.Size(108,240)
$CheckButton.Size = New-Object System.Drawing.Size(75,23)
$CheckButton.Text = "Проверить"
$CheckButton.Enabled = $false
$CheckButton.Add_Click({

$OKButton.Enabled = $false
$SearchButton.Enabled = $false
$CheckButton.Enabled = $false 

    $x=$objListBox2.SelectedItem;

        $Checktype = (Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -DisplayName $x | ForEach-Object FilePath)
               
if ($Checktype -like "*1cv8.exe") {
        $wshell.Popup("База: "+$x+". Тип клиента: Толстый (FAT)",0,"Готово",0) 
} else {
        $wshell.Popup("База: "+$x+". Тип клиента: Тонкий (THIN)",0,"Готово",0) 
}

$OKButton.Enabled = $true
$SearchButton.Enabled = $true
$CheckButton.Enabled = $true 
        
})

$TabPage2.Controls.Add($CheckButton)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,10) 
$objLabel.Size = New-Object System.Drawing.Size(230,20) 
$objLabel.Text = "Выберите базу:"
$TabPage2.Controls.Add($objLabel) 

$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Checked = $true
$RadioButton1.Location  = New-Object System.Drawing.Point(100,210)
$RadioButton1.Text = 'Тонкий (THIN)'
$RadioButton1.AutoSize = $true
$TabPage2.Controls.Add($RadioButton1)

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location  = New-Object System.Drawing.Point(200,210)
$RadioButton2.Text = 'Толстый (FAT)'
$RadioButton2.AutoSize = $true
$TabPage2.Controls.Add($RadioButton2)

$objListBox2 = New-Object System.Windows.Forms.ListBox 
$objListBox2.Location = New-Object System.Drawing.Size(10,60) 
$objListBox2.Size = New-Object System.Drawing.Size(360,20) 
$objListBox2.Height = 140

$TabPage2.Controls.Add($objListBox2) 

$TabControl.Controls.Add($TabPage1)
$TabControl.Controls.Add($TabPage2)
$TabControl.Location  = New-Object System.Drawing.Point(0,0)

$main_form.Controls.add($TabControl)

$main_form.ShowDialog()