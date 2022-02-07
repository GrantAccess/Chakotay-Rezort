
# From an idea at 
# <https://www.youtube.com/watch?v=f9xPJXslVWE> 

# report FileSystem Drives connected to this computer.
Get-PSDrive | 
# In the case of "free" being greater than 1
where-Object {$_.free -gt 1} | 
# In each case, write-out rootdrive & its freespace formated by Gb 
ForEach-Object { Write-Host "Free Space for" $_.root "is" ("{0:N2}" -f ($_.free/1gb)) "Gb"  }
# Lable names, format and health
Get-Volume


<#
Get-PSDrive |
?{$_.Free -gt 1} |
%{$Count = 0;
Write-Host "";
}
{ $_.Name + ": Used: " + "{0:N2}" -f ($_.Used/1gb) + 
" Free: " + "{0:N2}" -f ($_.free/1gb) + " Total: " + "{0:N2}" -f 
(($_.Used/1gb)+($_.Free/1gb));
$Count = $Count + $_.Free;}
{Write-Host"";
Write-Host "Total Free Space " ("{0:N2}" -f ($Count/1gb))
 -backgroundcolor magenta}

 #>