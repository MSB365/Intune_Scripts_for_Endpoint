$directory = "C:\MDM\"


If ((Test-Path -Path $directory) -eq $false)
{
        New-Item -Path $directory -ItemType directory
}