# Inteli - Instituto de Tecnologia e Liderança 

<p align="center">
<a href= "https://www.inteli.edu.br/"><img src="https://www.inteli.edu.br/wp-content/uploads/2021/08/20172028/marca_1-2.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0"></a>
</p>

# Probody

## Colossus-MK1

## Integrantes: 
Elisa de Oliveira Flemer, Giovanna Rodrigues, João Furquim de Campos Suarez, Marcos Vinicius Alves de Moura, Thomas Barton e Yasmin Vitória Rocha de Jesus


## Descrição

Probody é um simulador de estratégia biomédico que visa informar jovens de forma lúdica acerca da prevenção contra o câncer.
<br><br>
<p align="center">
<img src="https://i.imgur.com/FldcjGB.png" alt="PROBODY" border="0">
  Imagem autoral
</p>


Probody é um simulador de estratégia biomédico. Nesse sentido, objetiva ensinar seu público-alvo—isto é, adolescentes—, as principais causas, fatores de risco e modos de prevenção de cânceres. Para esse fim, Probody coloca o jogador dentro dos órgãos do corpo humano atuando como o metabolismo do avatar e controlando um linfócito, a  protagonista "Celinha", para que combata as substâncias cancerígenas e células cancerosas que aparecerem. Ademais, cabe também ao jogador monitorar diferentes partes do corpo, associando certas atividades com uma maior presença de carcinógenos em órgãos relacionados, e selecionar os melhores hábitos saudáveis para contrabalancear um dado fator de risco. Porém, caso falhe em combater os carcinógenos, o jogador deverá reiniciar o jogo do início. Ainda nesse aspecto, o jogo possui um tutorial que visa explicar ao jogador suas mecânicas para que esse consiga chegar ao final sem enjoar do jogo antes. Dessa forma, o jogo trabalha a temática do câncer de forma leve e que gera em seus jogadores uma mentalidade de prevenção aos maus hábitos que podem gerar prejuízos para a sua saúde.

## 🛠 Estrutura de pastas

-Raiz<br>
|<br>
|-->documentos<br>
  &emsp;|-->antigos<br>
  &emsp;|GDD.docx ou Documentação.docx<br>
|-->executáveis<br>
  &emsp;|-->windows<br>
  &emsp;|-->HTML<br>
|-->imagens<br>
|-->src<br>
|readme.md<br>
|license.txt<br>

A pasta raiz contem dois arquivos que devem ser alterados:

<b>README.MD</b>: Arquivo que serve como guia e explicação geral sobre seu projeto. O mesmo que você está lendo agora.

<b>license.txt</b>: Arquivo de licença do projeto, para que qualquer um possa entender até que ponto podem utilizar seu projeto. Aconselhável utilizar a licença Creative Commons Attribution 4.0 International.

Há também 4 pastas que seguem da seguinte forma:

<b>documentos</b>: Aqui estarão todos os documentos do projeto, mas principalmente o <b>GDD (Game Design Document)/Documentação do Sistema</b>. Há uma pasta <b>antigos</b> onde estarão todas as versões antigas da documentação.

<b>executáveis</b>: Aqui estarão todos os executáveis do jogo, prontos para rodar. Há no mínimo 2 pastas, uma para binários <b>Windows</b> e uma para a <b>Web/HTML</b>

<b>imagens</b>: Algumas imagens do jogo/sistema e logos prontos para serem utilizados e visualizados.

<b>src</b>: Nesta pasta irá todo o código fonte do jogo/sistema, pronto para para ser baixado e modificado.

## 🛠 Instalação
<b>Windows:</b>

Não há instalação! Apenas executável!
Encontre o JOGO.exe na pasta executáveis e execute-o como qualquer outro programa. Só tome cuidado para não fechar o prompt de comando (tela preta) que será aberta simultaneamente. Se você a fechar, o jogo fechará também.

<b>HTML:</b>

Não há instalação!
Encontre o index.html na pasta executáveis e execute-o como uma página WEB (através de algum browser).

## 📈 Exemplo de uso
O jogo inicia com o jogador tendo duas opções (corpo feminino e corpo masculino) e uma delas é escolhida para prosseguir.
<img src="https://i.imgur.com/eVPcDZK.png" alt="Tela de escolha de sexo" border="0">

Logo após a escolha de uma das opções, um nome poderá ser escolhido.
<img src="https://i.imgur.com/g29FbJO.png" alt="Tela de escolha de nome" border="0">

Após a escolha do nome, o jogador é direcionado para a tela inicial onde o tempo começará a ser contabilizado. Nesse momento, instruções serão oferecidas a partir da manchete enquanto a barra de vida varia de acordo com a agilidade do jogador em associar os órgãos com a informação transmitida, ao associar, será preciso clicar no órgão específico representado na ilustração do corpo humano.
<img src="https://imgur.com/IykQvRc.png" alt="Tela principal" border="0">

Quando o órgão é clicado, é necessário eliminar os carcinógenos indicados pela seta vermelha, os responsáveis por essa eliminação é a Celinha junto ao metabolismo, um bom linfócito incumbido pela defesa do corpo humano e que está identificado com a seta roxa. Cada eliminação possibilita ganhos de pontos e, além dos carcinógenos, há presença de células cancerosas que crescem continuamente e que são responsáveis por acabar com o jogo.

## 💻 Configuração para Desenvolvimento

Para abrir este projeto, você necessida do <a href="https://godotengine.org/download">GODOT 3.4.3</a> and OpenGL 2.1 / OpenGL ES 2.0 compatible hardware. O projeto pode ser importado através do arquivo zipado na pasta "src" ou do arquivo project.godot, localizado dentro da pasta zipada.

## 🗃 Histórico de lançamentos

A cada atualização os detalhes devem ser lançados aqui.
* 0.2.9 - 08/04/2022
    * MUDANÇA: Refatoração do código
* 0.2.8 - 02/04/2022
    * MUDANÇA: Atualização do godot projeto
* 0.2.7 - 30/03/2022
    * ADD: Executaveis para playtest
* 0.2.6 - 26/03/2022
    * MUDANÇA: Atualização do godot projeto
* 0.2.5 - 25/03/2022
    * ADD: Fase Adulta
    *  MUDANÇA: Atualização do GDD
* 0.2.4 - 19/03/2022
    * ADD: Comentarios no codigo
    * MUDANÇA: Atualização do GDD
* 0.2.3 - 16/03/2022
    * ADD: Estomago e Utero
* 0.2.2 - 15/03/2022
    * CONSERTO: Bug fix
* 0.2.1 - 12/03/2022
    * MUDANÇA: Atualização do godot projeto
* 0.2.0 - 03/03/2022
    * MUDANÇA: Atualização do godot projeto
* 0.1.1 - 25/02/2022
    * MUDANÇA: Atualização do godot projeto e GDD
* 0.1.0 - 18/02/2022
    * O primeiro lançamento adequado
    * ADD: Primeira Versão do jogo
* 0.0.1 - 14/02/2022
    * Trabalho em andamento
    * ADD: Criado GDD.docs

## 📋 Licença/License

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/Spidus/Teste_Final_1">MODELO GIT INTELI</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.yggbrasil.com.br/vr">INTELI, VICTOR BRUNO ALEXANDER ROSETTI DE QUIROZ</a> is licensed under <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"></a></p>

## 🎓 Referências

Aqui estão as referências usadas no projeto.

1. <https://github.com/iuricode/readme-template>
2. <https://github.com/gabrieldejesus/readme-model>
3. <https://creativecommons.org/share-your-work/>
