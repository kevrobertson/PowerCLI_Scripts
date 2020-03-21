
[Array] $vmList = @( Get-VM -Location XXX | Sort Name );

foreach ( $vmItem in $vmList )
{
    [Array] $vmSnapshotList = @( Get-Snapshot -VM $vmItem );

    foreach ( $snapshotItem in $vmSnapshotList )
    {
        $vmProvisionedSpaceGB = [Math]::Round( $vmItem.ProvisionedSpaceGB, 2 );
        $vmUsedSpaceGB        = [Math]::Round( $vmItem.UsedSpaceGB,        2 );
        $snapshotSizeGB       = [Math]::Round( $snapshotItem.SizeGB,       2 );
        $snapshotAgeDays      = ((Get-Date) - $snapshotItem.Created).Days;

        $output = New-Object -TypeName PSObject;

        $output | Add-Member -MemberType NoteProperty -Name "VM"                 -Value $vmItem;
        $output | Add-Member -MemberType NoteProperty -Name "Name"               -Value $snapshotItem.Name;
        $output | Add-Member -MemberType NoteProperty -Name "Description"        -Value $snapshotItem.Description;
        $output | Add-Member -MemberType NoteProperty -Name "Created"            -Value $snapshotItem.Created;
        $output | Add-Member -MemberType NoteProperty -Name "AgeDays"            -Value $snapshotAgeDays;
        $output | Add-Member -MemberType NoteProperty -Name "ParentSnapshot"     -Value $snapshotItem.ParentSnapshot.Name;
        $output | Add-Member -MemberType NoteProperty -Name "IsCurrentSnapshot"  -Value $snapshotItem.IsCurrent;
        $output | Add-Member -MemberType NoteProperty -Name "SnapshotSizeGB"     -Value $snapshotSizeGB;
        $output | Add-Member -MemberType NoteProperty -Name "ProvisionedSpaceGB" -Value $vmProvisionedSpaceGB;
        $output | Add-Member -MemberType NoteProperty -Name "UsedSpaceGB"        -Value $vmUsedSpaceGB;
        $output | Add-Member -MemberType NoteProperty -Name "PowerState"         -Value $snapshotItem.PowerState;

        $output;
    }
}