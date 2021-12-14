#region Description
<#     
       .NOTES
       ===========================================================================
       Created on:         2020/02/18 
       Created by:         Drago Petrovic
       Organization:       MSB365.blog
       Filename:           Allow-RDP-forAzureUPN.ps1     

       Find us on:
             * Website:  https://www.msb365.blog
             * Technet:  https://social.technet.microsoft.com/Profile/MSB365
             * LinkedIn: https://www.linkedin.com/in/drago-petrovic/
             * Xing:     https://www.xing.com/profile/Drago_Petrovic
       ===========================================================================
       .DESCRIPTION
		Add a Azure Account (UPN) to allowed remote Desktop users and enable Windows Firewall Inbound rules.
		
		
       .NOTES
        Modify the UPN of the user in the line 50. Run this script by using Intunes. The RDS service will not be enabled with this Script, only the Windows Firewall Inbound rules. 
		The Script has to be executed with administrative permissions.

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
             V0.10, 2020/02/18 - Initial version




--- keep it simple, but significant ---


--- by MSB365 Blog ---

#>
#endregion

#Set AzureAD UPN
$ADUser = "svc_staging@praxis-gruppe.ch"


net localgroup "Remote Desktop Users" /add "AzureAD\$ADUser"
net localgroup "Administrators" /add "AzureAD\$ADUser"

<#New-LocalUser "user_name" -Password $Password -FullName "full_user_name" -Description "Lokaler ITPoint Admin User für RDP Support"
Add-LocalGroupMember -Group "Administrators" -Member "Admin02"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "Admin02"
#>

Enable-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP
Enable-NetFirewallRule -Name RemoteDesktop-UserMode-In-UDP
Enable-NetFirewallRule -Name RemoteDesktop-Shadow-In-TCP

