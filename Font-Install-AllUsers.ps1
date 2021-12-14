#region Description
<#     
       .NOTES
       ===========================================================================
       Created on:         2020/12/02 
       Created by:         Drago Petrovic
       Organization:       MSB365.blog
       Filename:           Font-Install-AllUsers.ps1     

       Find us on:
             * Website:  https://www.msb365.blog
             * Technet:  https://social.technet.microsoft.com/Profile/MSB365
             * LinkedIn: https://www.linkedin.com/in/drago-petrovic/
             * Xing:     https://www.xing.com/profile/Drago_Petrovic
       ===========================================================================
       .DESCRIPTION
             
       
       .NOTES
       Run this as a Computer Startup script to allow installing fonts from C:\InstallFont\
       Run this as a Computer Startup Script in Group Policy

       .EXAMPLE
       .\Font-Install-AllUsers.ps1 
             

       .COPYRIGHT
       Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
       to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
       and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

       The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
       FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
       WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
       ===========================================================================
       .CHANGE LOG
             V0.10, 2020/12/02 - Initial version




--- keep it simple, but significant ---


--- by MSB365 Blog ---

#>
#endregion

#region Logo
Write-Host "MMMMMMMM               MMMMMMMM   SSSSSSSSSSSSSSS BBBBBBBBBBBBBBBBB   " -ForegroundColor gray -NoNewline 
Write-Host " 333333333333333           66666666   555555555555555555 " -ForegroundColor yellow
Write-Host "M:::::::M             M:::::::M SS:::::::::::::::SB::::::::::::::::B  " -ForegroundColor gray -NoNewline 
Write-Host "3:::::::::::::::33        6::::::6    5::::::::::::::::5 " -ForegroundColor yellow
Write-Host "M::::::::M           M::::::::MS:::::SSSSSS::::::SB::::::BBBBBB:::::B " -ForegroundColor gray -NoNewline 
Write-Host "3::::::33333::::::3      6::::::6     5::::::::::::::::5 " -ForegroundColor yellow
Write-Host "M:::::::::M         M:::::::::MS:::::S     SSSSSSSBB:::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "3333333     3:::::3     6::::::6      5:::::555555555555 " -ForegroundColor yellow
Write-Host "M::::::::::M       M::::::::::MS:::::S              B::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "            3:::::3    6::::::6       5:::::5            " -ForegroundColor yellow
Write-Host "M:::::::::::M     M:::::::::::MS:::::S              B::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "            3:::::3   6::::::6        5:::::5            " -ForegroundColor yellow
Write-Host "M:::::::M::::M   M::::M:::::::M S::::SSSS           B::::BBBBBB:::::B " -ForegroundColor gray -NoNewline 
Write-Host "    33333333:::::3   6::::::6         5:::::5555555555   " -ForegroundColor yellow
Write-Host "M::::::M M::::M M::::M M::::::M  SS::::::SSSSS      B:::::::::::::BB  " -ForegroundColor gray -NoNewline 
Write-Host "    3:::::::::::3   6::::::::66666    5:::::::::::::::5  " -ForegroundColor yellow
Write-Host "M::::::M  M::::M::::M  M::::::M    SSS::::::::SS    B::::BBBBBB:::::B " -ForegroundColor gray -NoNewline 
Write-Host "    33333333:::::3 6::::::::::::::66  555555555555:::::5 " -ForegroundColor yellow
Write-Host "M::::::M   M:::::::M   M::::::M       SSSSSS::::S   B::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "            3:::::36::::::66666:::::6             5:::::5" -ForegroundColor yellow
Write-Host "M::::::M    M:::::M    M::::::M            S:::::S  B::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "            3:::::36:::::6     6:::::6            5:::::5" -ForegroundColor yellow
Write-Host "M::::::M     MMMMM     M::::::M            S:::::S  B::::B     B:::::B" -ForegroundColor gray -NoNewline 
Write-Host "            3:::::36:::::6     6:::::65555555     5:::::5" -ForegroundColor yellow
Write-Host "M::::::M               M::::::MSSSSSSS     S:::::SBB:::::BBBBBB::::::B" -ForegroundColor gray -NoNewline 
Write-Host "3333333     3:::::36::::::66666::::::65::::::55555::::::5" -ForegroundColor yellow
Write-Host "M::::::M               M::::::MS::::::SSSSSS:::::SB:::::::::::::::::B " -ForegroundColor gray -NoNewline 
Write-Host "3::::::33333::::::3 66:::::::::::::66  55:::::::::::::55 " -ForegroundColor yellow
Write-Host "M::::::M               M::::::MS:::::::::::::::SS B::::::::::::::::B  " -ForegroundColor gray -NoNewline 
Write-Host "3:::::::::::::::33    66:::::::::66      55:::::::::55   " -ForegroundColor yellow
Write-Host "MMMMMMMM               MMMMMMMM SSSSSSSSSSSSSSS   BBBBBBBBBBBBBBBBB   " -ForegroundColor gray -NoNewline 
Write-Host " 333333333333333        666666666          555555555     " -ForegroundColor yellow

Write-Host "                ------------------------------------------------------------------------------------------------------         " -ForegroundColor magenta
Write-Host "                        ┬┌─┌─┐┌─┐┌─┐  ┬┌┬┐  ┌─┐┬┌┬┐┌─┐┬  ┌─┐       ┌┐ ┬ ┬┌┬┐  ┌─┐┬┌─┐┌┐┌┬┌─┐┬┌─┐┌─┐┌┐┌┌┬┐" -ForegroundColor cyan
Write-Host "                        ├┴┐├┤ ├┤ ├─┘  │ │   └─┐││││├─┘│  ├┤   ───  ├┴┐│ │ │   └─┐││ ┬││││├┤ ││  ├─┤│││ │ " -ForegroundColor cyan
Write-Host "                        ┴ ┴└─┘└─┘┴    ┴ ┴   └─┘┴┴ ┴┴  ┴─┘└─┘       └─┘└─┘ ┴   └─┘┴└─┘┘└┘┴└  ┴└─┘┴ ┴┘└┘ ┴ " -ForegroundColor cyan 
Start-Sleep -s 2
#endregion


$SourceDir   = "\\sigsvm01102.lan.sire.ch\data$\Templates\IT\LINOTYPE\"
$Source      = "\\sigsvm01102.lan.sire.ch\data$\Templates\IT\LINOTYPE\*"
$Destination = (New-Object -ComObject Shell.Application).Namespace(0x14)
$directory  = "C:\MDM\Fonts"

# Create the source directory if it doesn't already exist
#New-Item -ItemType Directory -Force -Path $SourceDir

{
        New-Item -Path $directory -ItemType directory
}

Get-ChildItem -Path $Source -Include '*.ttf','*.ttc','*.otf' -Recurse | ForEach {
    If (-not(Test-Path "C:\Windows\Fonts\$($_.Name)")) {

        $Font = "$directory\$($_.Name)"
        
        # Copy font to local temporary folder
        Copy-Item $($_.FullName) -Destination $directory
        
        # Install font
        $Destination.CopyHere($Font,0x10)

        # Delete temporary copy of font
        Remove-Item $Font -Force
    }
}