 <#
 Description: This script is to delete old snapshots in a AWS account. In this, any snapshot less than current date time will eb deleted. You can modify the date/time as per your need
 Owner: Jagat Pradhan
  #>

$all_snapshots = (Get-EC2Snapshot -OwnerId 459279873295 | Where-Object {$_.StartTime -lt (Get-Date)}).SnapshotId

foreach ($snapshot in $all_snapshots)

{
             
             Remove-EC2Snapshot -SnapshotId $snapshot
             Write-Host $snapshot "Deleted" -ForegroundColor Green
}
