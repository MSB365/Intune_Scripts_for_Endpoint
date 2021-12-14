#Create Schedule Task
Get-ScheduledTask -TaskName "PushLaunch" -ErrorAction SilentlyContinue -OutVariable task

if (!$task) {
    $taskname = "PushLaunch"
    $taskdescription = "Initialize MDM Enrollment by Task Scheduler"
    $action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\DeviceEnroller.exe' -Argument '/c /AutoenrollMDM'
    $trigger =  New-ScheduledTaskTrigger -AtLogOn 
    $settings = New-ScheduledTaskSettingsSet
    $path = "\Microsoft\Windows\EnterpriseMgmt"
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskname -Description $taskdescription -Settings $settings -User "System" -TaskPath $path
} else {
Write-Host "$task already exists - no further action needed!" -ForegroundColor Green
}