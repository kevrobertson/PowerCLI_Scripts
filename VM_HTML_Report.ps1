$cred = Get-Credential administrator@cpt.lab

Connect-VIServer X.X.X.X -cred $cred

$vms = Get-VM -Name *

$vms | ConvertTo-Html | Out-File 'C:\Users\kerober2\desktop\PSOutputs\VMreport.html'

Start-Process 'C:\Users\kerober2\desktop\PSOutputs\VMreport.html'
