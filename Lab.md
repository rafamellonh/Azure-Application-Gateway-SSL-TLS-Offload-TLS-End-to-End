# Criar LAB

__Link para criar certificado__

https://app.zerossl.com/login

__Converter certificado para pfx__

https://www.sslshopper.com/ssl-converter.html


__Script para instalar IIS__

#Script VM-WEB
# Instalar IIS com Management Tools
Add-WindowsFeature Web-Server -IncludeManagementTools

# Remover a pagina iisstart 
remove-item C:\inetpub\wwwroot\iisstart.htm

# Configurar as paginas Default
Add-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "LAB APP GW -- $($env:computername)"


# LAB

Criar um RG e uma Virtual Network com 3 subnet's.

* Resource group  - RGAPP
* Region -Brazil South
* VNET01 10.100.0.0/16
* SUB-PRD01 (10.100.1.0/24),SUB-APPWG (10.100.250.0/24),AzureBastionSubnet (10.100.251.0/26)