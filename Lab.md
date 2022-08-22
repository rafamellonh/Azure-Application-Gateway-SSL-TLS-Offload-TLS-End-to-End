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

__Criar um RG e uma Virtual Network com 3 subnet's.__

* Resource group  - RGAPP
* Region -Brazil South
* VNET01 10.100.0.0/16
* SUB-PRD01 (10.100.1.0/24), SUB-APPWG (10.100.250.0/24), AzureBastionSubnet (10.100.251.0/26)

__Criar duas VMs em zonas diferentes__
```
VM01 :
esource group - RGAPP
Virtual machine - VM01
Region - Brazil South
Availability options
Availability zone
Availability zone 1
Image - Windows Server 2022 Datacenter: Azure Edition - Gen2
Size - Standard D2s v3 (2 vcpus, 8 GiB memory)
Username - rafael.admin

Networking
Virtual network - VNET01
Subnet - SUB-PRD01 (10.100.1.0/24)
Public IP - None
NIC network security group - None

VM02 : 
esource group - RGAPP
Virtual machine - VM02
Region - Brazil South
Availability options
Availability zone
Availability zone 3
Image - Windows Server 2022 Datacenter: Azure Edition - Gen2
Size - Standard D2s v3 (2 vcpus, 8 GiB memory)
Username - rafael.admin

Networking
Virtual network - VNET01
Subnet - SUB-PRD01 (10.100.1.0/24)
Public IP - None
NIC network security group - None
```


__Criar um NSG e associar a SUBNET-PRD01__
```
Resource group - RGAPP
Region - Brazil South
name - NSG01
```

__Criar o bastion para realizar a conexão nos computadores__

```
Basics
Name - BST01

Resource group - RGAPP
Region - Brazil South
Virtual network - VNET01
Subnets - AzureBastionSubnet
Public IP address - PIP-BST01
Tier - Standard
Instance count - 2
Copy and paste - Enabled

```

__Deploy Application Gateway__
O deploy do Appplication Gateway foi divido em duas novas páginas



SSL/TLS OffLoad [SSL/TLS OffLoad](https://github.com/rafamellonh/Azure-Application-Gateway-SSL-TLS-Offload-TLS-End-to-End/blob/main/AppGwOffload.md).

TLS End to End [TLS End to End](https://github.com/rafamellonh/Azure-Application-Gateway-SSL-TLS-Offload-TLS-End-to-End/blob/main/AppGwOffload.md)
