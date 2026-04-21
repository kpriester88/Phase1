# ==================================================
# SESSION 13: THE AUTOMATED ONBOARDING
# Operator Deployment Script
# ==================================================

Write-Host "[*] Beginning Engineering Onboarding..."

1..5 | ForEach-Object {
  $UserParams = @{
	Path                  = "OU=Engineering,DC=Titan,DC=local"
	Name                  = "Eng_User$_"
	SamAccountName        = "Eng_User$_"
	Enabled	              = $true
	ChangePasswordAtLogon = $true
	AccountPassword       = (ConvertTo-SecureString "Password123" -AsPlainText -Force)
   }
    
   New-ADUser @UserParams
}


Write-Host "[+] All engineers onboarded successfully." 