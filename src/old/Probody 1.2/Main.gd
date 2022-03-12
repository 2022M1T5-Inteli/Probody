# Este é o nó geral, associado com o painel principal. É formado pelo FemaleBody, cujos órgãos
# são clicáveis, 
extends Node

# Ao iniciar o jogo, começa o tutorial. Corresponde à parte da user story "Como Laura, quero jogar 
# algo gradativo para aprender conceitos novos aos poucos", pois ensina as mecânicas básicas do jogo
# apresentando os primeiros conhecimentos sobre câncer de pulmão. 
# Um problema desta implementação é que o tutorial recomeça toda vez que o jogador volta para a tela
# principal, mesmo após já ter acumulado pontos em algum órgão. A solução para isso depende da
# instrução da semana que vem, segundo o professor Victor.
func _ready():
	tutorial()

# Função do tutorial. Ainda não está completa, pois depende da aula da semana que vem para garantir
# a sincronização entre cenas.
func tutorial():
	# Define e mostra o texto na barra do âncora
	$Headline.set_news("NOME estava esperando o ônibus quando um colega\nlhe ofereceu um cigarro." +
	"Nome aceitou, e agora há\ncarcinógenos entrando em seu pulmão.\nClique no pulmão para combatê-los.")
	$Headline.display_news()
	# Espera o texto terminar de aparecer. Depende da instrução da semana que vem para terminar de
	# ser implementado. A ideia é que os órgãos só se tornem clicáveis após o texto terminar de 
	# aparecer na barra. 
	yield($Headline, "textReady")
	
# Troca a cena para a loja de hábitos no clique do botão de hábitos.
func _on_HabitsButton_pressed():
	get_tree().change_scene("res://HabitStore.tscn")
