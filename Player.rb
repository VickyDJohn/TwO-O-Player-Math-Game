class Player
  attr_reader :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def answer_question(correct)
    if correct
      @score += 1
    else
      @lives -= 1
    end
  end

  def is_alive
    @lives > 0
  end
end