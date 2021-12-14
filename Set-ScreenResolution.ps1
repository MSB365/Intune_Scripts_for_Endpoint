#region Description
<#     
       .NOTES
       ===========================================================================
       Created on:         2020/07/01 
       Created by:         Drago Petrovic | Dominic Manning
       Organization:       MSB365.blog
       Filename:           Set-ScreenResolution.ps1     

       Find us on:
             * Website:           https://www.msb365.blog
             * Microsoft:         https://mvp.microsoft.com/en-us/PublicProfile/5003446?fullName=Drago%20Petrovic
             * Technet:           https://social.technet.microsoft.com/Profile/drago%20petrovic
             * MS Tech Community: https://techcommunity.microsoft.com/t5/user/viewprofilepage/user-id/219022
             * LinkedIn:          https://www.linkedin.com/in/drago-petrovic/
             * Xing:              https://www.xing.com/profile/Drago_Petrovic
       ===========================================================================
       .DESCRIPTION
             Sets the Screen Resolution of the primary monitor 
             Uses Pinvoke and ChangeDisplaySettings Win32API to make the change.

       .EXAMPLE
             Set-ScreenResolution -Width 1024 -Height 768
             

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
             V0.10, 2020/07/01 - Initial version

 

--- keep it simple, but significant ---
#>

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

Function Set-ScreenResolution { 
 
<# 
    .Synopsis 
        Sets the Screen Resolution of the primary monitor 
    .Description 
        Uses Pinvoke and ChangeDisplaySettings Win32API to make the change 
    .Example 
        Set-ScreenResolution -Width 1024 -Height 768         
    #> 
param ( 
[Parameter(Mandatory=$true, 
           Position = 0)] 
[int] 
$Width, 
 
[Parameter(Mandatory=$true, 
           Position = 1)] 
[int] 
$Height 
) 
 
$pinvokeCode = @" 
 
using System; 
using System.Runtime.InteropServices; 
 
namespace Resolution 
{ 
 
    [StructLayout(LayoutKind.Sequential)] 
    public struct DEVMODE1 
    { 
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] 
        public string dmDeviceName; 
        public short dmSpecVersion; 
        public short dmDriverVersion; 
        public short dmSize; 
        public short dmDriverExtra; 
        public int dmFields; 
 
        public short dmOrientation; 
        public short dmPaperSize; 
        public short dmPaperLength; 
        public short dmPaperWidth; 
 
        public short dmScale; 
        public short dmCopies; 
        public short dmDefaultSource; 
        public short dmPrintQuality; 
        public short dmColor; 
        public short dmDuplex; 
        public short dmYResolution; 
        public short dmTTOption; 
        public short dmCollate; 
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] 
        public string dmFormName; 
        public short dmLogPixels; 
        public short dmBitsPerPel; 
        public int dmPelsWidth; 
        public int dmPelsHeight; 
 
        public int dmDisplayFlags; 
        public int dmDisplayFrequency; 
 
        public int dmICMMethod; 
        public int dmICMIntent; 
        public int dmMediaType; 
        public int dmDitherType; 
        public int dmReserved1; 
        public int dmReserved2; 
 
        public int dmPanningWidth; 
        public int dmPanningHeight; 
    }; 
 
 
 
    class User_32 
    { 
        [DllImport("user32.dll")] 
        public static extern int EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE1 devMode); 
        [DllImport("user32.dll")] 
        public static extern int ChangeDisplaySettings(ref DEVMODE1 devMode, int flags); 
 
        public const int ENUM_CURRENT_SETTINGS = -1; 
        public const int CDS_UPDATEREGISTRY = 0x01; 
        public const int CDS_TEST = 0x02; 
        public const int DISP_CHANGE_SUCCESSFUL = 0; 
        public const int DISP_CHANGE_RESTART = 1; 
        public const int DISP_CHANGE_FAILED = -1; 
    } 
 
 
 
    public class PrmaryScreenResolution 
    { 
        static public string ChangeResolution(int width, int height) 
        { 
 
            DEVMODE1 dm = GetDevMode1(); 
 
            if (0 != User_32.EnumDisplaySettings(null, User_32.ENUM_CURRENT_SETTINGS, ref dm)) 
            { 
 
                dm.dmPelsWidth = width; 
                dm.dmPelsHeight = height; 
 
                int iRet = User_32.ChangeDisplaySettings(ref dm, User_32.CDS_TEST); 
 
                if (iRet == User_32.DISP_CHANGE_FAILED) 
                { 
                    return "Unable To Process Your Request. Sorry For This Inconvenience."; 
                } 
                else 
                { 
                    iRet = User_32.ChangeDisplaySettings(ref dm, User_32.CDS_UPDATEREGISTRY); 
                    switch (iRet) 
                    { 
                        case User_32.DISP_CHANGE_SUCCESSFUL: 
                            { 
                                return "Success"; 
                            } 
                        case User_32.DISP_CHANGE_RESTART: 
                            { 
                                return "You Need To Reboot For The Change To Happen.\n If You Feel Any Problem After Rebooting Your Machine\nThen Try To Change Resolution In Safe Mode."; 
                            } 
                        default: 
                            { 
                                return "Failed To Change The Resolution"; 
                            } 
                    } 
 
                } 
 
 
            } 
            else 
            { 
                return "Failed To Change The Resolution."; 
            } 
        } 
 
        private static DEVMODE1 GetDevMode1() 
        { 
            DEVMODE1 dm = new DEVMODE1(); 
            dm.dmDeviceName = new String(new char[32]); 
            dm.dmFormName = new String(new char[32]); 
            dm.dmSize = (short)Marshal.SizeOf(dm); 
            return dm; 
        } 
    } 
} 
 
"@ 
 
Add-Type $pinvokeCode -ErrorAction SilentlyContinue 
[Resolution.PrmaryScreenResolution]::ChangeResolution($width,$height) 
} 