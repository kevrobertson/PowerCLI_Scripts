$vlan=$args[0]
Set-NetAdapter -Name Ethernet3 -VlanID $vlan -Confirm:$false