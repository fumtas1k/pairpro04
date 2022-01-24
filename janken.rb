class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    while true
      if ["0", "1", "2"].include?(input_hand)
        return input_hand.to_i
      else
        puts "0~2を入力してください"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp
      end
    end
  end
end

class Enemy
  def hand
    rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"

    # judge = 自分が勝った時2, 引き分け0, 負けた時1
    judge = (player_hand - enemy_hand + 3) % 3
    if judge == 0
      puts "あいこ"
      true
    elsif judge == 2
       puts"あなたの勝ちです"
      false
    else
      puts "あなたの負けです"
      false
    end
  end
end

class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end

GameStart.jankenpon