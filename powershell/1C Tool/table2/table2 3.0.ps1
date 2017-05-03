[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "1C 8.3.9.1850"
$objForm.Size = New-Object System.Drawing.Size(400,300) 
$objForm.StartPosition = "CenterScreen"

function TypeInfo {


if ($RadioButton1.Checked -eq $true) {$type='1cv8c'}
if ($RadioButton2.Checked -eq $true) {$type='1cv8'}

Import-Module remotedesktop

Write-Host($alias+$type)

#Set-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -alias "$alias" -FilePath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -FileVirtualPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe" -IconPath "D:\Program Files (x86)\1cv8\8.3.9.1850\bin\$type.exe"


                     }

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objListBox.SelectedItem;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

        $wshell = New-Object -ComObject Wscript.Shell
            
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(110,220)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "Ок"
$OKButton.Add_Click({



    $x=$objListBox.SelectedItem;
        
        $alias = (Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" -DisplayName $x | ForEach-Object Alias)

  TypeInfo
        
        $wshell.Popup("Тип клиента для базы "+$x+" изменен",0,"Готово",0)
        
})
$objForm.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(200,220)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Отена"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,10) 
$objLabel.Size = New-Object System.Drawing.Size(280,20) 
$objLabel.Text = "Выберите базу:"
$objForm.Controls.Add($objLabel) 

$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location  = New-Object System.Drawing.Point(100,180)
$RadioButton1.Text = 'Тонкий (THIN)'
$RadioButton1.AutoSize = $true
$objForm.Controls.Add($RadioButton1)

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location  = New-Object System.Drawing.Point(200,180)
$RadioButton2.Text = 'Толстый (FAT)'
$RadioButton2.AutoSize = $true
$objForm.Controls.Add($RadioButton2)

$objListBox = New-Object System.Windows.Forms.ListBox 
$objListBox.Location = New-Object System.Drawing.Size(10,40) 
$objListBox.Size = New-Object System.Drawing.Size(360,20) 
$objListBox.Height = 140
        
        $srv = Get-RDRemoteApp -connectionbroker cg-ts-001.net.crocusgroup.ru -CollectionName "1C" | ForEach-Object DisplayName | Sort-Object
           
           foreach ($t in $srv) 

{ 
   [void] $objListBox.Items.Add($t)
} 

        

$objForm.Controls.Add($objListBox) 



$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()