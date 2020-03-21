
$vds = "XXX"
$vdsname = get-vdswitch $vds
 
$vdsPortgroup = Import-Csv c:\users\kerober2\desktop\inputs.csv
 
foreach ($portgroup in $vdsPortgroup){
Get-vdswitch $vdsname | New-VDPortgroup -name $portgroup.pgName -NumPorts $portgroup.numports -VlanId $portgroup.vlanID
}
 
