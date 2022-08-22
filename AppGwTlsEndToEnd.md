É preciso alterar a regra dentro do Backend settings para HTTPS

O passo a seguir é preciso realizar nos servidores IIS:

![iis02](Images/iis02.png)
![iis03](Images/iis03.png)
![iis04](Images/iis04.png)

Não esquecer de remover a porta 80 no IIS:

Instale o certificado ca_bundle.crt em seu computador para poder exportar o mesmo.

![cert01](/Images/cert01.png)
![cert02](/Images/cert02.png)

Salve o mesmo em um lugar seguro.

Altere as configurações dentro do Backend Settings.

![https01](/Images/htpps01.png)