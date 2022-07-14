### Especificação
A) Introdução  

O presente relatório diz respeito aos fluxos do Gestão de Medicação relativos às as regras de prescrição eletrónica de medicamentos a utentes
em regime de ambulatório hospitalar e os procedimentos de dispensa pelos/através dos Serviços Farmacêuticos Hospitalares destes
medicamentos, incluindo os que se destinam a ser administrados por profissionais de saúde nos serviços de ambulatório do hospital: hospital de
dia, consulta externa, cirurgia de ambulatório e serviço de urgência. Os fluxos do Gestão de Medicação são controlados pela interoperabilidade através do grupo de canais "82XX”. Mais especificamente, a comunicação no âmbito da gestão de medicação é mediada pelo PNB, através dos seguintes fluxos:
* Prescrição de medicação - 8200 - (fluxo síncrono).
* Consulta de Prescrição - 8210 - (fluxo síncrono).
* Dispensa de Medicação - 8220 - (fluxo síncrono).

A1) Prescrição de Medicação  

O fluxo de Prescrição de Medicação é representado pelo Evento 10724 - MED_PRESCRIPTION_SYNCHRONIZATION, através das operações:
* 10911 - MED_PRESCRIPTION_NEW - Prescrever Medicação
* 10912 - MED_PRESCRIPTION_CANCEL - Cancelar Prescrição de Medicação

Sempre que é efetuada uma nova prescrição/cancelamento pelas aplicações de origem, é enviado um pedido diretamente para o PNB, por
parte da aplicação emissora, quer se trate de uma aplicação interno ou de um player externo.
Sendo um fluxo síncrono, a aplicação emissora deve ficar a aguardar a resposta da PEMH pelo mesmo canal em que foi enviada a mensagem
de prescrição/cancelamento.

A arquitetura da integração do fluxo que passa pelo PNB, pode ser visualizado na Figura 1.

<img src="arch-pnb.png" width="100%"/>
<br>