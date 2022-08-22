# Azure-Application-Gateway-SSL/TLS Offload-TLS End-to-End

O Application Gateway do Azure é um balanceador de carga que atua na camada 7 do modelo OSI. 
O Application Gateway gerencia as solicitações que os aplicativos cliente enviam aos aplicativos Web hospedados 
em um pool de servidor Web (backend pool)

O pool de servidores Web pode ser composto por máquinas virtuais do Azure, virtual machine scale set (VMSS) do Azure,
App Services do Azure e até mesmo servidores on-premises.

O Application Gateway é um balanceador de carga regional e poder ser utilizado tanto para publicar uma aplicação externa quanto interna.

O Application Gateway fornece recursos de seguranç como Web Application Firewall (WAF), suporte para criptografia TLS/SSL do tráfego entre 
usuários e aplication gateway (SSL/TLS OffLoad), bem como entre os servidores da sua aplicação e o application gateway

# Estrutura do Application Gateway

* Frontend IP
* Listener
* Rules
* HTTP Settings
* Backend Pool

![appfw01](Images/appfw01.png)