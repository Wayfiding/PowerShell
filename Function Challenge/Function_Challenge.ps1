
Function SubMenu1($Message) {
   Write-Output "=== Sub Menu 1 ===
    Please choose a Option Below :
    1) Option 1
    2) Option 2
    3) Go Back"
    Write-Output "`n $Message"
    switch (Read-Host ){
        1{Clear-Host;SubMenu1}
        2{Clear-Host;SubMenu2}
        3{Clear-Host;MainMenu}
        default {Clear-Host;SubMenu1("Error: You did not choose a valid option")}
    }
}

Function SubMenu2($Message) {
    Write-Output "=== Sub Menu 2 ===
    Please choose a Option Below :
    1) Option 1
    2) Option 2
    3) Go Back"
    Write-Output "`n $Message"
    switch (Read-Host ){
        1{Clear-Host;SubMenu1}
        2{Clear-Host;SubMenu2}
        3{Clear-Host;MainMenu}
        default {Clear-Host;SubMenu2("Error: You did not choose a valid option")}
    }
}


Function MainMenu($Message) {
    Clear-Host
    Write-Output  "=== Main Menu ===
    Please choose a Option Below :
    1) SubMenu 1
    2) SubMenu 2
    3) Quit"
    Write-Output "`n $Message"
    switch (Read-Host){
        1{Clear-Host;SubMenu1}
        2{Clear-Host;Submenu2}
        3{Clear-Host;break}
        default {MainMenu("Error: You did not choose a valid option")}
    }
}

MainMenu