<#
	.SYNOPSIS
		Brute Force Zip Files

	.DESCRIPTION
		Brute Force Zip Files in PowerShell using 7Zip

	.NOTES
		Aurthor: https://securethelogs.com
		
#>

function psbrutezip {

$myArray = @(
"",
"__________  ___________________                __                .__        ",
"\______   \/   _____/\______   \_______ __ ___/  |_  ____ _______|__|_____  ",
"|     ___/\_____  \  |    |  _/\_  __ \  |  \   __\/ __ \\___   /  \____ \ ",
"|    |    /        \ |    |   \ |  | \/  |  /|  | \  ___/ /    /|  |  |_> > ",
"|____|   /_______  / |______  / |__|  |____/ |__|  \___  >_____ \__|   __/  ",
"               \/         \/                         \/      \/  |__|      "   ,         
""
"Creator: https://securethelogs.com / @securethelogs",
"")

$myArray



$7z = "C:\Program Files\7-Zip\7z.exe"
$testifinstalled = Test-Path "$7z"
$Thepasswordis = ""


if ($testifinstalled -eq "True") {

#Is Installed
Write-Output "7Zip installed........"
Write-Output "Let's Brute ........"
Write-Output "`n"

$ziploc = Read-Host -Prompt "Location of Zipped File :"
$Passwordlist = Read-Host -Prompt "Location of Wordlist :"
$passwords = Get-Content $Passwordlist

foreach ($i in $passwords){


$brute = & 'C:\Program Files\7-Zip\7z.exe' e "$ziploc" -p"$i" -y

if ($brute -contains "Everything is Ok"){

$Thepasswordis = $i

Write-Output "Password Found: $Thepasswordis"


} # Brute IF

else {

#do nothing

}


} # Foreach Rule


# ------------ Output End ---------------------

if ($Thepasswordis -eq "") {
Write-Output "------------ End -------------------"
Write-Output "`n"
Write-Output "Password Not Found"
Write-Output "`n"
}

else {

Write-Output "------------ End -------------------"
Write-Output "`n"
Write-Output "The Password Is: $Thepasswordis"
Write-Output "`n"

}



} # Testifinstalled If Rule



else {

#7Zip Isn't Installed

Write-Output "7Zip doesn't appear to be installed. This script requires it, so if you wish to use, please install."
Write-Output "`n"


}



}