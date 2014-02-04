class Player
	constructor: (@name, @atk, @guard, @speed) ->
		@hp = 200

	attack: (player) ->
		damage = @atk + Math.floor(Math.random()*5) - player.guard
		if(damage < 0)
			damage = 0
		player.hp -= damage

		if player.hp < 0
			player.hp = 0

		return player.hp

class Game
	constructor: (player1, player2) ->
		@turn = 0
		@players = [player1, player2]
		@turnCount = 0
		@playerAttackOrder = []

	start: ->
		while 1
			@turn += 1

			# 先行を決定する
			if @players[0].speed > @players[1].speed
				@playerAttackOrder = [@players[0],@players[1]]
			else if @players[0].speed == @players[1].speed
				if Math.random()-0.5 < 0
					@playerAttackOrder = [@players[0],@players[1]]
				else
					@playerAttackOrder = [@players[1],@players[0]]
			else
				@playerAttackOrder = [@players[1],@players[0]]

			console.log "first:#{@playerAttackOrder[0].name}"
			console.log "#{@turn}:#{@players[0].name}=#{@players[0].hp},
			#{@players[1].name}=#{@players[1].hp}"

			# 攻撃のフェース
			if (@playerAttackOrder[0].attack @playerAttackOrder[1]) <= 0
				console.log "#{@turn}:#{@playerAttackOrder[0].name} won"
				break

			if (@playerAttackOrder[1].attack @playerAttackOrder[0]) <= 0
				console.log "#{@turn}:#{@playerAttackOrder[1].name} won"
				break


player1 = new Player "トミー", 1, 11, 3
player2 = new Player "イワーク", 11, 1, 3

game = new Game player1, player2

game.start()
