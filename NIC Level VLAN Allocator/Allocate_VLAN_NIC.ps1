$vlaninputs = Import-CSV c:\path-csv\vlaninputs.csv

foreach ($vm in $vlaninputs){
$vm1 = Get-VM -Name $vm.vm
$vlan = $vm.vlan
$script = "C:\Users\Administrator\Desktop\vlan.ps1"
Invoke-VMScript -vm $vm1 -ScriptText "$script $vlan" -GuestUser 'Administrator' -GuestPassword 'XXXXXXXXX' -ScriptType Powershell -Confirm:$false 
}