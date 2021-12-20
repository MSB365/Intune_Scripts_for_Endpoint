If ($ENV:PROCESSOR_ARCHITEW6432 -eq "AMD64") {
    Try {
        &"$ENV:WINDIR\SysNative\WindowsPowershell\v1.0\PowerShell.exe" -File $PSCOMMANDPATH
    }
    Catch {
        Throw "Failed to start $PSCOMMANDPATH"
    }
    Exit
}

Function CleanUpAndExit() {
    Param(
        [Parameter(Mandatory=$True)][String]$ErrorLevel
    )


    # Write results to registry for Intune Detection
    $Key = "HKEY_LOCAL_MACHINE\Software$StoreResults"
    $NOW = Get-Date -Format "yyyyMMdd-hhmmss"

    If ($ErrorLevel -eq "0") {
        [microsoft.win32.registry]::SetValue($Key, "Success", $NOW)
    } else {
        [microsoft.win32.registry]::SetValue($Key, "Failure", $NOW)
        [microsoft.win32.registry]::SetValue($Key, "Error Code", $Errorlevel)
    }
    
    # Exit Script with the specified ErrorLevel
    EXIT $ErrorLevel
}

# ---------------------------------------------------------------------------- #
# Set Generic Script Variables, etc.
# ---------------------------------------------------------------------------- #
$StoreResults = "InTheCloud247\AppXRemove\v1.1"

# List of Applications to Remove
$AppPackages  = @()
$AppPackages += 'Microsoft.Xbox.TCUI'
$AppPackages += 'Microsoft.XboxApp'
$AppPackages += 'Microsoft.XboxGameOverlay'
$AppPackages += 'Microsoft.XboxIdentityProvider'
$AppPackages += 'Microsoft.XboxSpeechToTextOverlay'
$AppPackages += 'MicrosoftTeams'

$Error.Clear()
foreach ($App In $AppPackages) {

    $Package = Get-AppxPackage | Where-Object {$_.Name -eq $App}
	$ProvisionedPackage = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $App}
    If ($Package -ne $null) {
        Write-Host "Removing Package : $App"
        Remove-AppxPackage -Package $Package.PackageFullName
    } Else {
		Write-Host "Package $App not found"
	}

	If ($ProvisionedPackage -ne $null) {
		Write-Host "Removing ProvisionedPackage : $App"
		Remove-AppxProvisionedPackage -online -Packagename $ProvisionedPackage.Packagename
	} Else {
		Write-Host "Provisioned Package $App not found"
	}
}

If ($Error.Count -gt 0) {
    write-host "Removing AppX Packages failed: $($Error[0])"
    CleanUpAndExit -ErrorLevel 101
} else {
    write-host "Successfully Removed AppX packages"
}

CleanUpAndExit -ErrorLevel 0