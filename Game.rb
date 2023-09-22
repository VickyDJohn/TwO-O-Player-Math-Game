class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players.sample
  end

  def start_game
    puts "Let's start the game!"

    questions_asked = 0
    questions_pool = Questions::QUESTIONS.dup

    loop do
      if questions_pool.empty?
        puts "All questions have been asked."
        break
      end

      current_question = select_random_question(questions_pool)
      puts "#{@current_player.name}:"
      puts current_question.question

      player_answer = gets.chomp

      if current_question.check_answer(player_answer.to_i)
        puts "Correct!"
        @current_player.answer_question(true)
      else
        puts "Incorrect!"
        @current_player.answer_question(false)
      end

      display_scores

      questions_asked += 1

      if questions_asked == 10
        announce_winner
        break
      end

      switch_turn
    end
  end

  def select_random_question(questions_pool)
    # Select a random question from the questions pool and remove it
    index = rand(questions_pool.length)
    question = questions_pool.delete_at(index)
    Questions.new(question)
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
    puts ""
  end

  def is_game_over
    @players.any? { |player| player.lives <= 0 }
  end
end