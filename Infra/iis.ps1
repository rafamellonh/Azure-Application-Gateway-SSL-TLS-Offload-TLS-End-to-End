#Instalar IIS com Management Tools
Add-WindowsFeature Web-Server -IncludeManagementTools

#Remover a pagina iisstart
remove-item C:\inetpub\wwwroot\iisstart.htm

#Configurar as paginas Default
Add-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "LAB APP GW -- $($env:computername)"

Add-WindowsFeature Web-Server -IncludeManagementTools 
remove-item C:\inetpub\wwwroot\iisstart.htm
Add-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "LAB APP GW -- $($env:computername)"