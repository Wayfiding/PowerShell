# What target server do we want to configure?
$TargetServer = "localhost"

# Create CIM session
$Session = New-CimSession $TargetServer

# Declare LCM Configuration
[DSCLocalConfigurationManager()] configuration LCMConfig {

    Node $TargetServer {
        Settings {
            RefreshMode= "Push"
            ConfigurationMode = "ApplyAndAutoCorrect"
            ConfigurationModeFrequencyMins = 15
            RebootNodeIfNeeded = $false # If you set to $true host will reboot without warning

        }

    }



}

# Generate LCM Config 

$LCMConfig = LCMconfig -Outputpath "C:\DSC\Config"

# Apply LCM configt to target host

Set-DscLocalConfigurationManager -CimSession $Session -Path "C:\DSC\Config"


# Get current LCM config

Get-DscLocalConfigurationManager -CimSession $Session