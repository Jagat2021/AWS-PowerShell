 <#
 Description: This script is to delete available volumes in a AWS account. Those volumes which are not in use
 Owner: Jagat Pradhan
  #>
 
 # List all the Ec2 volume id which are in available state (not in-use)
 $available_volumes = (Get-EC2Volume | Where-Object {$_.State -eq "available"}).VolumeId

 # Loop code to remove all the volume ids
  foreach ($volme_id in $available_volumes)
             {
                    Remove-EC2Volume -VolumeId $volme_id
                    Write-Host $volme_id "was in availabel state, hence deleted!" -ForegroundColor Green
             }
Write-Host "Script Execution Completed" -ForegroundColor Cyan