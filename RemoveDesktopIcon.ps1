#region Description
<#     
       .NOTES
       ===========================================================================
       Created on:         2020/05/30 
       Created by:         Drago Petrovic
       Organization:       MSB365.blog
       Filename:           RemoveDesktopIcon.ps1     

       Find us on:
             * Website:  https://www.msb365.blog
             * Technet:  https://social.technet.microsoft.com/Profile/MSB365
             * LinkedIn: https://www.linkedin.com/in/drago-petrovic/
             * Xing:     https://www.xing.com/profile/Drago_Petrovic
       ===========================================================================
       .DESCRIPTION
		This script controls whether a defined desktop icon exists or not. If the icon exists on the desktop, the corresponding shortcut on the desktop will be deleted.
		
		
       .NOTES
        Modify the variables in the Region "Mofify variables -> Desktop Icons that has to be deleted <-" Add, change or remove the Icons and the Code in the variable region and "Script" region

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
             V0.10, 2020/05/30 - Initial version




--- keep it simple, but significant ---


--- by MSB365 Blog ---

#>
#endregion

#region Mofify variables -> Desktop Icons that has to be deleted <-
$Icon1 = "Microsoft Teams.lnk"
$Icon2 = "Brave.lnk"
$Icon3 = "firefox.lnk"
$Icon4 = "7zip.lnk"
$Icon5 = "notepadplusplus.lnk"
$Icon6 = "keepass.lnk"
$Icon7 = "putty.lnk"
$Icon8 = "adobereader.lnk"
$Icon9 = "forticlientvpn.lnk"
$Icon10 = "teamviewer.lnk"
$Icon11 = "vlc.lnk"
$Icon12 = "filezilla.lnk"

#endregion

#region Script
If ((Test-Path "$env:USERPROFILE\Desktop\$Icon1") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon1" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon2") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon2" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon3") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon3" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon4") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon4" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon5") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon5" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon6") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon6" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon7") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon7" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon8") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon8" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon9") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon9" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon10") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon10" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon11") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon11" –Force
}

If ((Test-Path "$env:USERPROFILE\Desktop\$Icon12") -eq $true)
{
Remove-Item "$($env:USERPROFILE)\Desktop\$Icon12" –Force
}

#endregion
