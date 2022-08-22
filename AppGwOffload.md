__Criar Application Gateway SSL/TLS Offload__

![appfw04](Images/appfw04.png)
![appfw05](Images/appfw05.png)
![appfw06](Images/appfw06.png)
![appfw07](Images/appfw07.png)
![appfw08](Images/appfw08.png)
![appfw09](Images/appfw09.png)

__Configurar PROBE__

![probe01](Images/probe.png)

__Instalar IIS nas VMs e configurar o DNS para apontar para o IP do Application Gateway__

![IIS01](Images/IIS01.png)

![DNS01](Images/DNS01.png)

__Testar o acesso pelo navegador__

![test01](Images/tes01.png)

__Criar redirecionamento para o HTTP encaminhar para HTTPS__

É preciso criar um listener para que quando o usuário tente entrar no site por http ele seja encaminhado para https.

![lstHttp01](Images/lstHttp.png)

__Criar nova Rule para adicionar o Listener adiciona para HTTP__

É preciso configurar dentro da regra para ele redirecionar o acesso para dentro do listener que utiliza HTTPS.

Isso força o uso do HTTPS.

![rule01](Images/rule01.png)