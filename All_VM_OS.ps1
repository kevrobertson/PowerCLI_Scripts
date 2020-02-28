Get-VM | 
      Sort-Object -Property Name |
      Get-View -Property @("Name", "Config.GuestFullName", "Guest.GuestFullName") |
      Select-Object -Property Name, @{N="Configured OS";E={$_.Config.GuestFullName}}, @{N="Running OS";E={$_.Guest.GuestFullName}}
