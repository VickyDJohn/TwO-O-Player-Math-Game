class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players.sample
  end

  def start_game
    puts "Let's start the game!"
    loop do
      current_question = MathQuestion.new
      puts current_question.question

      player_answer = gets.chomp

      if current_question.check_answer(player_answer)
        puts "Correct!"
        @current_player.answer_question(true)
      else
        puts "Incorrect!"
        @current_player.answer_question(false)
      end

      display_scores

      if is_game_over
        announce_winner
        break
      end

      switch_turn
    end
  end

  def switch_turn
    @current_player = @players.find { |player| player != @current_player }
  end

  def announce_winner
    winner = @players.max_by { |player| player.score }
    runner_up = @players.min_by { |player| player.score }

    if winner.score > runner_up.score
      puts "#{winner.name} wins with a score of #{winner.score}!"
      puts "#{runner_up.name} had a score of #{runner_up.score}."
    else
      puts "Tie! Both players have a score of #{winner.score}."
    end
  end

  def display_scores
    @players.each do |player|
      puts "#{player.name}: Score - #{player.score}, Lives - #{player.lives}"
    end
  end

  def is_game_over
    @players.each { |player| !player.is_alive }
  end
end