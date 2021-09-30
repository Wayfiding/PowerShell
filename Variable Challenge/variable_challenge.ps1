#Read User Input
$first_name = Read-Host -Prompt 'What your First name' 
$last_name = Read-Host -Prompt 'What your Last name' 

# Get today date with proper formatting
$today_date = get-date -Format "ddmmyy-hhmmss"
$long_date = get-date -Format -F

#Creating the file
New-Item -Path ".\Variable Challenge\$today_date-$first_name-$last_name.txt"

#Setting content inside of the file 
Set-Content -Path ".\Variable Challenge\$today_date-$first_name-$last_name.txt" -Value "First Name: $first_name"
Add-Content -Path ".\Variable Challenge\$today_date-$first_name-$last_name.txt" -Value "Last Name: $Last_name"
Add-Content -Path ".\Variable Challenge\$today_date-$first_name-$last_name.txt" -Value "Date: $long_date"