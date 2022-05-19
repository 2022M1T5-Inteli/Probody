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
|--> documentos<br>
  &emsp;|--> antigos<br>
  &emsp;|--> GDD.docx<br>
  &emsp;|--> GDD.pdf<br>
|--> executáveis<br>
  &emsp;|--> windows<br>
  &emsp;|--> HTML<br>
|--> imagens<br>
|--> src<br>
  &emsp;|--> Probody<br>
|readme.md<br>
|license.txt<br>

<b>README.MD</b>: Arquivo que serve como guia e explicação geral sobre o projeto. O mesmo que você está lendo agora.

<b>license.txt</b>: Arquivo de licença do projeto, para que qualquer um possa entender até que ponto podem utilizar este projeto.

<b>documentos</b>: Aqui estão todos os documentos do projeto, principalmente o <b>GDD (Game Design Document)/Documentação do Sistema</b>. Há uma pasta <b>antigos</b> onde estão todas as versões antigas da documentação.

<b>executáveis</b>: Aqui estão todos os executáveis do jogo, prontos para rodar e dividiodos em HTML e Desktop.

<b>imagens</b>: Algumas imagens do jogo/sistema e logos prontos para serem utilizados e visualizados.

<b>src</b>: Nesta pasta há todo o código fonte do jogo/sistema, pronto para para ser baixado e modificado.

## 🛠 Instalação
<b>Windows:</b>

Não há instalação! Apenas executável!
Encontre o JOGO.exe na pasta executáveis e execute-o como qualquer outro programa.

<b>HTML:</b>

Não há instalação!
Encontre o index.html na pasta executáveis e execute-o como uma página WEB (através de algum browser).

## 📈 Exemplo de uso
Ao clicar no botão de start através da tela de menu, o jogador tem duas opções (corpo feminino e corpo masculino) e uma delas é escolhida para prosseguir.
<img src="https://i.imgur.com/eVPcDZK.png">

Logo após a escolha de uma das opções, um nome poderá ser escolhido.
<img src="https://i.imgur.com/g29FbJO.png">

Antes de ser direcionado para a tela inicial, o tutorial é introduzido
<img src="https://i.imgur.com/IjxeWYD.png">

Após a escolha do nome, o jogador é direcionado para a tela inicial onde o tempo começará a ser contabilizado. Nesse momento, instruções serão oferecidas a partir da manchete enquanto a barra de vida varia de acordo com a agilidade do jogador em associar os órgãos com a informação transmitida, ao associar, será preciso clicar no órgão específico representado na ilustração do corpo humano.
<img src="https://imgur.com/IykQvRc.png" alt="Tela principal" border="0">

Quando o órgão é clicado, é necessário eliminar os carcinógenos indicados pela seta vermelha, os responsáveis (indicados pela seta roxa) por essa eliminação é a Celinha junto ao metabolismo. Cada eliminação possibilita a acumulação de pontos (seta amarela) e, além dos carcinógenos, há presença de células cancerosas (seta azul) que crescem continuamente e que são responsáveis por acabar com o jogo. Já o ícone azul (seta rosa) é o botão para pausar o jogo.
<img src="https://i.imgur.com/e8ohOVd.png">
<img src="https://i.imgur.com/LFtC6Js.png">

Caso não consiga eliminar todos os carcinógenos e células cancerosas, uma tela de game over aparecerá e o jogo será resetado ao clicar no botão de reiniciar, direcionando para a tela de menu.
<img src="https://i.imgur.com/qdqIM1E.png">

Voltando para a tela inicial, é possível identificar ícones seguidos de pop-ups que informa o estado do corpo, riscos e prevenções.
<img src="https://i.imgur.com/NJjBvaK.png">

As prevenções são os bons hábitos, estes hábitos diminuem as chances de desenvolver cânceres específicos que são abordados no jogo e podem ser comprados com os pontos adquiridos através da loja representado pelo ícone de coração.
<img src="https://i.imgur.com/Ryzqy2y.png">
<img src="https://i.imgur.com/oIRhJSJ.png">


## 💻 Configuração para Desenvolvimento

Para abrir este projeto, você necessita do <a href="https://godotengine.org/download">GODOT 3.4.3</a> and OpenGL 2.1 / OpenGL ES 2.0 compatible hardware. O projeto pode ser importado através do arquivo zipado na pasta "src" ou do arquivo project.godot, localizado dentro da pasta zipada.

## 🗃 Histórico de lançamentos
* 0.3.0 - 13/04/2022
    * MUDANÇA: Executável e código finais
* 0.2.9 - 08/04/2022
    * MUDANÇA: Refatoração do código
* 0.2.8 - 02/04/2022
    * MUDANÇA: Entregável de código e GDD
* 0.2.7 - 30/03/2022
    * ADD: Executáveis para playtest
* 0.2.6 - 26/03/2022
    * MUDANÇA: Entregável de código e GDD
* 0.2.5 - 25/03/2022
    * ADD: Fase Adulta
    *  MUDANÇA: Atualização do GDD
* 0.2.4 - 19/03/2022
    * ADD: Comentários no código
    * MUDANÇA: Atualização do GDD
* 0.2.3 - 16/03/2022
    * ADD: Estômago e útero
* 0.2.2 - 15/03/2022
    * CONSERTO: Arrumamos bugs
* 0.2.1 - 12/03/2022
    * MUDANÇA: Entregável de código e GDD
* 0.2.0 - 03/03/2022
    * MUDANÇA: Entregável de código e GDD
* 0.1.1 - 25/02/2022
    * MUDANÇA: Entregável de código e GDD
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

IURICODE. GitHub, 2020. Disponível em: https://github.com/iuricode/readme-template. Acesso em: 5 fev. 2022.

JESUS, Gabriel de. GitHub, 2020. Disponível em: https://github.com/gabrieldejesus/readme-model. Acesso em: 5 fev. 2022.

SHARE your work. Creative Commons, 2020. Disponível em: https://creativecommons.org/share-your-work/. Acesso em: 5 fev. 2022.

LINIETSKY, Juan; MANZUR, Ariel. Godot Engine, 2007. Engine open-source para desenvolvimento de jogos. Disponível em: https://godotengine.org/download/. Acesso em: 13 set. 2022.

PAULINE, Miles. 370343562. DepositPhotos, 2022. Disponível em: https://st3.depositphotos.com/30433694/37034/i/1600/depositphotos_370343562-stock-photo-human-bladder-prostate-isolated-white.jpg. Acesso em: 13 abr. 2022.

PIKOVIT. 488351984. DepositPhotos, 2022. Disponível em: https://st2.depositphotos.com/5775856/48835/v/1600/depositphotos_488351984-stock-illustration-organs-and-nervous-system.jpg. Acesso em: 13 abr. 2022.

PIKOVIT. 489813532. DepositPhotos, 2022. Disponível em: https://st2.depositphotos.com/5775856/48981/v/1600/depositphotos_489813532-stock-illustration-organs-and-nervous-system.jpg. Acesso em: 13 abr. 2022.

MALIJA. 70298479. DepositPhotos, 2022. Disponível em: https://st2.depositphotos.com/1605581/7029/i/950/depositphotos_70298479-stock-photo-blue-abstract-contemporary-texture-background.jpg. Acesso em: 13 abr. 2022.

HEART free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/heart_3237429?term=heart&page=1&position=47&page=1&position=47&related_id=3237429&origin=search#. Acesso em: 31 mar. 2022.

METABOLISM free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/metabolism_2176932?term=metabolism&page=1&position=30&page=1&position=30&related_id=2176932&origin=tag#. Acesso em: 31 mar. 2022.

CADUCEUS free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/caduceus_3609896?term=caduceus&page=1&position=44&page=1&position=44&related_id=3609896&origin=search. Acesso em: 1 mar. 2022.

NO smoking free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/no-smoking_6655280?term=dont%20smoke&page=1&position=8&page=1&position=8&related_id=6655280&origin=search#. Acesso em: 24 fev. 2022.

HEARTBEAT free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/heartbeat_2791163?term=health&page=1&position=14&page=1&position=14&related_id=2791163&origin=search#. Acesso em: 24 fev. 2022.

SALAD free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/salad_3123321?term=healthy%20food&page=1&position=22&page=1&position=22&related_id=3123321&origin=tag. Acesso em: 24 fev. 2022.

EXERCISE free icon. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/barbell_2936886?term=exercise&page=1&position=59&page=1&position=59&related_id=2936886&origin=search. Acesso em: 24 fev. 2022.

HUMAN intestine anatomy on white background. Vecteezy, 2022. Disponível em: https://www.vecteezy.com/vector-art/1609618-human-intestine-anatomy-on-white-background. Acesso em: 18 mar. 2022.

MOLECULE illustration vector. Vecteezy, 2022. Disponível em:https://www.vecteezy.com/vector-art/3281162-molecule-vector-illustration-design. Acesso em: 23 fev. 2022.

SCIENTIFIC medical infographic human skin layers. Freepik, 2022. Disponível em: https://www.freepik.com/free-vector/scientific-medical-infographic-human-skin-layers_5849144.htm. Acesso em: 18 mar. 2022.

VARIOUS modern hud flat elements. Freepik, 2022. Disponível em: https://www.freepik.com/free-vector/various-modern-hud-flat-elements-set_9651005.htm#query=user%20interface%20tech&position=0&from_view=search. Acesso em: 18 mar. 2022.

WINNING game sound effect. Orange Free Sounds, 2022. Disponível em: https://orangefreesounds.com/winning-game-sound-effect/#google_vignette. Acesso em: 18 mar. 2022.

ARCADE game jump coin. Mixkit, 2022. Disponível em: https://mixkit.co/free-sound-effects/win/. Acesso em: 18 mar. 2022.

FAST pace typing on mechanical keyboard. Fesliyan Studios, 2022. Disponível em: https://www.fesliyanstudios.com/royalty-free-sound-effects-download/keyboard-typing-6. Acesso em: 25 mar. 2022.

GOOD result. Freesound, 2022. Disponível em: https://freesound.org/people/unadamlar/sounds/341985/. Acesso em: 18 mar. 2022.

ACHIEVEMENT bell. Mixkit, 2022. Disponível em: https://mixkit.co/free-sound-effects/win/. Acesso em: 18 mar. 2022.

ARCADE game jump coin. Mixkit, 2022. Disponível em: https://mixkit.co/free-sound-effects/win/. Acesso em: 18 mar. 2022.

FALLING game over. Mixkit, 2022. Disponível em:  https://mixkit.co/free-sound-effects/game-over/. Acesso em: 18 mar. 2022.

BEER icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/beer_2945048?term=beer&page=1&position=41&page=1&position=41&related_id=2945048&origin=tag. Acesso em: 25 fev. 2022.

SAUSAGE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/spicy-sausage_2523528?related_id=2523528&origin=tag. Acesso em: 25 fev. 2022.
SUNSCREEN icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/suncream_3104922?term=sunscreen&page=1&position=14&page=1&position=14&related_id=3104922&origin=tag. Acesso em: 25 fev. 2022.

LIVER icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/liver_387591?term=liver&page=1&position=1&page=1&position=1&related_id=387591&origin=tag.  Acesso em: 3 mar. 2022.

STOMACH icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/stomach_387626?term=stomach&page=1&position=11&page=1&position=11&related_id=387626&origin=tag.  Acesso em: 3 mar. 2022.

DIGESTIVE system icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/large-intestine_4615338?term=digestive%20system&page=1&position=16&page=1&position=16&related_id=4615338&origin=tag.  Acesso em: 3 mar. 2022.

UTERUS icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/uterus_3790199?term=uterus&page=1&position=12&page=1&position=12&related_id=3790199&origin=tag.  Acesso em: 3 mar. 2022. 

PROSTATE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/prostate_2214994?term=prostate%20cancer&page=1&position=49&page=1&position=49&related_id=2214994&origin=tag.  Acesso em 3 mar. 2022.

PROSTATE cancer icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/prostate-cancer_5258394?term=prostate%20cancer&page=1&position=30&page=1&position=30&related_id=5258394&origin=tag.  Acesso em: 11 mar. 2022.

MALE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/male_2894116?term=male&page=1&position=17&page=1&position=17&related_id=2894116&origin=tag.  Acesso em: 1 abr. 2022.

FEMENINE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/femenine_866954?term=female&page=1&position=1&page=1&position=1&related_id=866954&origin=search. Acesso em: 1 abr. 2022.

SKIN icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/hair_387573?related_id=387573&origin=pack. Acesso em: 3 mar. 2022.

LUNGS icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/lungs_387593?related_id=387593&origin=pack. Acesso em: 3 mar. 2022.

PAUSE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/pause_4194794?term=pause&page=1&position=57&page=1&position=57&related_id=4194794&origin=search. Acesso em: 22 mar. 2022.

VOLUME icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/free-icon/volume_727269?term=volume&page=1&position=3&page=1&position=3&related_id=727269&origin=search. Acesso em: 24 mar. 2022.

MUTE icons. Flaticon, 2022. Disponível em: https://www.flaticon.com/premium-icon/mute_1538549?term=volume&page=1&position=38&page=1&position=38&related_id=1538549&origin=search. Acesso em 24 mar. 2022.

HUMAN organs on poster. Flaticon, 2022. Disponível em: https://www.vecteezy.com/vector-art/294440-human-organs-on-poster. Acesso em 3 mar. 2022.

3 gaming hq.  Flaticon, 2022. Disponível em: https://freepngimg.com/thumb/xbox/55639-3-gaming-hq-image-free-png.png. Acesso em 29 mar. 2022.

DIGITAL introspection. Soundimage, 2022. Disponível em: https://soundimage.org/introspective/. Acesso em: 3 mar. 2022.

8-BIT perplexion. Soundimage, 2022. Disponível em: https://soundimage.org/wp-content/uploads/2017/10/8-Bit-Perplexion.mp3. Acesso em: 1 mar. 2022.
