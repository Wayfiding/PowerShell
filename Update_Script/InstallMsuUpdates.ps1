#Run the Script as administrator
#Possibly change this variable depending on where you updates are saved
$UpdatePath = "C:\Updates"

# Get-HotFix > "$UpdatePath\old_hotfix_list.txt"

# Get a list of all updates in the fold
$Updates = Get-ChildItem -Path $UpdatePath | Where-Object {$_.Name -like "*.msu"}

ForEach ($Update in $Updates){

    #Get the full path to the update file
    $UpdateFilePath = $Update.FullName
    #logging
    Write-Host "Installing update $Update"
    # Install the update
    Start-Process -wait wusa -ArgumentList "/update $UpdateFilePath","/quiet","/norestart"
    

}

#Create  new Hostfix list
Get-HotFix > "$UpdatePath\new_hotfix_list.txt"