class Questions
  attr_reader :question, :correct_answer

  QUESTIONS = [
    "What is 3 + 5?",
    "What is 10 + 7?",
    "What is 4 + 9?",
    "What is 6 + 2?",
    "What is 15 + 6?",
    "What is 8 + 4?",
    "What is 12 + 3?",
    "What is 7 + 8?",
    "What is 9 + 6?",
    "What is 5 + 11?",
    "What is 13 + 9?",
    "What is 2 + 7?",
    "What is 14 + 5?",
    "What is 11 + 6?",
    "What is 3 + 10?"
  ]

  def initialize(question)
    @question = question
    @correct_answer = 0
    generate_question
  end

  def generate_question
    # Select a random question from the QUESTIONS array
    @question = QUESTIONS.sample

    # Extract the correct answer from the question string
    numbers = @question.scan(/\d+/).map(&:to_i)
    @correct_answer = numbers.sum
  end

  def check_answer(answer)
    answer.to_i == @correct_answer
  end
end