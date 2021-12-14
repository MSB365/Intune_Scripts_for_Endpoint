#region Description
<#     
       .NOTES
       ===========================================================================
       Created on:         2020/12/02 
       Created by:         Drago Petrovic
       Organization:       MSB365.blog
       Filename:           Font-Install.ps1     

       Find us on:
             * Website:  https://www.msb365.blog
             * Technet:  https://social.technet.microsoft.com/Profile/MSB365
             * LinkedIn: https://www.linkedin.com/in/drago-petrovic/
             * Xing:     https://www.xing.com/profile/Drago_Petrovic
       ===========================================================================
       .DESCRIPTION
             
       
       .NOTES

       .EXAMPLE
       .\Font-Install.ps1 -pcNames wsv001,wsv002,wsv003 -fontFolder "\\myserver\shared\Fonts"
             

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
param(
[Parameter(Mandatory=$true,Position=0)]
[ValidateNotNull()]
[array]$pcNames,
[Parameter(Mandatory=$true,Position=1)]
[ValidateNotNull()]
[string]$fontFolder
)
$padVal = 20
$pcLabel = "Connecting To".PadRight($padVal," ")
$installLabel = "Installing Font".PadRight($padVal," ")
$errorLabel = "Computer Unavailable".PadRight($padVal," ")
$openType = "(Open Type)"
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$objShell = New-Object -ComObject Shell.Application
if(!(Test-Path $fontFolder))
{
    Write-Warning "$fontFolder - Not Found"
}
else
{
    $objFolder = $objShell.namespace($fontFolder)
    foreach ($pcName in $pcNames)
    {
        Try{
            Write-Output "$pcLabel : $pcName"
            $null = Test-Connection $pcName -Count 1 -ErrorAction Stop
            $destination = "\\",$pcname,"\c$\Windows\Fonts" -join ""
            foreach ($file in $objFolder.items())
            {
                $fileType = $($objFolder.getDetailsOf($file, 2))
                if(($fileType -eq "OpenType font file") -or ($fileType -eq "TrueType font file"))
                {
                    $fontName = $($objFolder.getDetailsOf($File, 21))
                    $regKeyName = $fontName,$openType -join " "
                    $regKeyValue = $file.Name
                    Write-Output "$installLabel : $regKeyValue"
                    Copy-Item $file.Path  $destination
                    Invoke-Command -ComputerName $pcName -ScriptBlock { $null = New-ItemProperty -Path $args[0] -Name $args[1] -Value $args[2] -PropertyType String -Force } -ArgumentList $regPath,$regKeyname,$regKeyValue
                }
            }
        }
        catch{
            Write-Warning "$errorLabel : $pcName"
        }
    }
}