class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :choices

  def answer
    uncorrect
    choices.select(&:correct)[0]
  end

  def uncorrect
    choices.each { |c| c.correct = false }
  end

  def answer=(choice)
    answer.correct = false unless answer.nil?

    if choices.include? choice
      choice.correct = true
    else
      choices << choice
      choice.correct = true
    end
  end
end
