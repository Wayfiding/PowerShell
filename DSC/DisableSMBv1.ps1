# What target server do we want to configure?
$TargetServer = "localhost"
$ConfigPath = "C:\DSC\Config"

# Create CIM session
$Session = New-CimSession $TargetServer

# Uninstall SMBv1
Configuration UninstallSMBv1 {

    #Import the DSC Module
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    #Node Config
    Node $TargetServer {
        WindowsFeature "SMB1"{
            Name = "FS-SMB1"
            Ensure = "Absent"

        }

        }
}

#Generate Node MOF File
$UninstallSMBv1 = UninstallSMBv1 -OutputPath $ConfigPath

# Apply DSC Configuration to Node
Start-DscConfiguration -CimSession $Session -Path $ConfigPath -Wait -Verbose

# Test DSC Node Against Configuration
Test-DscConfiguration -CimSession $Session -Path $ConfigPath

