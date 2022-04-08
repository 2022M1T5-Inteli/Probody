extends Control


var text = "  Olá, muito prazer! Eu sou a Celinha, um bom linfócito responsável pela defesa do organismo humano.\n" + "  Em Probody, você será responsável pela manutenção do metabolismo (reações químicas) de um corpo e, assim, me auxiliará no combate contra vários tipos de câncer."
var next = 1
var textSize = len(text)
var positionActual = 0
var time = 0
var sfx = false
signal buttonPressed
var lines = ["Olá, muito prazer! Eu sou a Celinha, um bom linfócito responsável pela defesa do organismo humano.\n" + "Em Probody, você será responsável pela manutenção do metabolismo (reações químicas) de um corpo e, assim, me auxiliará no combate contra vários tipos de câncer.",
"  A manchete te guiará informando a rotina do seu corpo. A cada ocorrência informada, associe qual órgão será afetado e se direcione para esse órgão clicando sobre ele no corpo que estará posicionado ao lado.",
"  Enquanto o tempo passa, o seu corpo envelhece e sua fase de vida é informada na tela inicial, sendo proporcional ao nível de dificuldade.\n" + "  Fique atento! Mais de uma ocorrência pode acontecer simultaneamente, logo, você terá duas ameaças para neutralizar.",
"  Nessa mesma barra, você tem acesso a pop-ups informativos sobre os tipos de câncer que serão tratados no jogo, basta posicionar seu mouse sobre o órgão desejado.\n" + "  Repare que há uma barra que indica o risco de câncer, comprar hábitos bons faz com que ela diminua.",
"  Na tela principal, haverá uma barra indicadora, você deve neutralizar a ameaça antes que ela esteja vazia.",
"  No órgão sob ataque, você encontrará dois tipos de agentes: carcinógenos e células cancerosas.\n" + "  Carcinógenos: substâncias que aumentam o risco de um câncer acontecer e são eliminadas pelo próprio metabolismo.\n" + "  Você os neutralizará clicando sobre eles com o seu mouse.",
"  Células cancerosas: células infectadas que iniciam a formação da doença e são eliminadas por linfócitos.\n" + "  Você os neutralizará movendo a Celinha até eles. Use as teclas A, W, S, D.\n" + "  Obs: o Shift aumenta sua velocidade.",
"  Os carcinógenos se transformam em células cancerosas ao baterem repetidamente nas paredes de um órgão, elas crescem e mudam de cor, seu objetivo é eliminá-las rapidamente.",
"  Para auxílio, o jogo te oferece a oportunidade de adquirir bons hábitos que diminuem a chance de um câncer ocorrer. Acesse a loja pela tela principal clicando no ícone representado abaixo.",
"  Tenha em mente que a experiência será um treinamento para te transformar em um bom linfócito da sua família.\n" + "  No final dessa jornada seja o vetor de conhecimento e conscientização, influenciando pessoas do seu círculo social a adotar hábitos saudáveis e combater o câncer.",
"  Boa sorte!"]

var moleculeColor = 1
var growTime = Timer.new()


#Função que ativa a música do jogo, faz com que o texto do tutorial apareça gradualmente
# e faz um sprite do tutorial crescer em determinada tela do próprio
func _process(delta):
	if $AudioStreamPlayer2D.playing == false and sfx == true:
		$AudioStreamPlayer2D.play()
	time += delta
	if time >= 0.05 and positionActual < textSize:
		sfx = true
		$Box/Label.text += text[positionActual] 
		positionActual += 1
		time = 0
		time += 0.01
	else:
		sfx = false
	if next == 8 and $Enemy.scale.x < 0.4:
		yield(get_tree().create_timer(1), "timeout")
		$Enemy.scale.x *= 1.002
		$Enemy.scale.y *= 1.002
		$Enemy.modulate = Color(moleculeColor, moleculeColor, 1, 1)
		moleculeColor *= 1.004
		
# Define a posição e tamanho da caixa de texto		
func _box_position(positionX, positionY, scaleX, scaleY):
	$Box.position.x = positionX
	$Box.position.y = positionY
	$Box.scale.x = scaleX
	$Box.scale.y = scaleY
	
# Função que altera a informação da quantidade de vezes que o botão do tutorial foi pressionado
# e reseta o texto
func _on_Tutorial_nextPressed():
	positionActual = 0
	time = 0
	$Box/Label.text = ""
	text = ""
	next += 1
	emit_signal("buttonPressed")
	
	
# Função para fazer com que as setas para esquerda e para direita funcionem funcionem
# que nem as funções de precionar os botões
func _input(event):
	if Input.is_action_pressed("ui_right"):
		positionActual = 0
		time = 0
		$Box/Label.text = ""
		text = ""
		next += 1
		emit_signal("buttonPressed")
	
	if Input.is_action_pressed("ui_left"):
		positionActual = 0
		time = 0
		$Box/Label.text = ""
		text = ""
		next -= 1
		emit_signal("buttonPressed")

# Verifica a quantidade de vezes que o botão para prosseguir foi pressionado, e, 
# com base nessa quantidade, define o texto para um valor específico
func _on_Control_buttonPressed():
	match next:
		1:
			_box_position(518, 320, 1.742, 1.547)
			$Celinha.visible = true
			$HeadlineBackground.visible = false
			$FemaleBody.visible = false
			$MaleBody.visible = false
			text = lines[next - 1]
			textSize = len(text)
		

		2:
			_box_position(260, 388, 1, 1)
			$Celinha.visible = false
			$HeadlineBackground.visible = true
			$BottomBar.visible = false
			$Box/ButtonBack.visible = true
		
			if Global.gender == "female":
				$FemaleBody.visible = true
			elif Global.gender == "male":
				$MaleBody.visible = true
			text = lines[next - 1]
			textSize = len(text)
		
		3:
			_box_position(512, 232, 1.548, 1.328)
			$BottomBar.visible = true
			$BottomBar/Timer.start()
			$HeadlineBackground.visible = false
			$FemaleBody.visible = false
			$MaleBody.visible = false
			$DeathBar.visible = false
			$PopUp.visible = false
			text = lines[next - 1]
			textSize = len(text)
			
		4:
			_box_position(791, 307, 0.9, 0.9)
			$BottomBar.visible = false
			$PopUp.visible = true
			$DeathBar.visible = false
			$DeathBar.value = 100
			text = lines[next - 1]
			textSize = len(text)
		
		5:
			_box_position(518, 320, 1.742, 1.547)
			$PopUp.visible = false
			$DeathBar.visible = true
			$Mouse.visible = false
			$BadMolecule.visible = false
			text = lines[next - 1]
			textSize = len(text)
			
		6:
			_box_position(518, 320, 1.742, 1.547)
			$DeathBar.value = 100
			$DeathBar.visible = false
			$Mouse.visible = true
			$BadMolecule.visible = true
			$Enemy.visible = false
			$Keys.visible = false
			$Shift.visible = false
			text = lines[next - 1]
			textSize = len(text)
		7:
			_box_position(518, 320, 1.742, 1.547)
			$Mouse.visible = false
			$BadMolecule.visible = false
			$Enemy.visible = false
			$Keys.visible = true
			$Shift.visible = true
			text = lines[next - 1]
			textSize = len(text)
		8:
			_box_position(518, 320, 1.742, 1.547)
			moleculeColor = 1
			$Enemy.visible = true
			$Enemy.position.x = 527
			$Enemy.position.y = 403
			$Enemy.scale.x = 0.185
			$Enemy.scale.y = 0.179
			$Keys.visible = false
			$Shift.visible = false
			$HabitStore.visible = false
			text = lines[next - 1]
			textSize = len(text)
		9:
			_box_position(518, 320, 1.742, 1.547)
			$Enemy.visible = false
			$HabitStore.visible = true
			text = lines[next - 1]
			textSize = len(text)
		10:
			$HabitStore.visible = false
			text = lines[next - 1]
			textSize = len(text)
			
		11:
			text = lines[next - 1]
			textSize = len(text)
			
		12:
			text = ""
			textSize = len(text)
			visible = false
			get_tree().paused = false

# Reseta os valores de texto e subtrai um da quantidade de vezes que o botão "next" foi pressionado
func _on_Tutorial_backPressed():
	positionActual = 0
	time = 0
	$Box/Label.text = ""
	text = ""
	next -= 1
	emit_signal("buttonPressed")

