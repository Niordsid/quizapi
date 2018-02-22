class QuizController < ApplicationController
  def index
    @total = 20
  end

  def new
    total = 20
    all = Question.all.map(&:id)
    session[:questions] = all.sort_by { rand }[0..(total - 1)]

    session[:total]   = total
    session[:current] = 0
    session[:correct] = 0

    redirect_to action: 'question'
  end

  def question
    @current = session[:current]
    @total = session[:total]

    if @current >= @total
      redirect_to action: 'end'
      return
    end

    @question = Question.find(session[:questions][@current])
    @choices = @question.choices.sort_by { rand }

    session[:question] = @question
    session[:choices] = @choices
  end

  def answer
    @current = session[:current]
    @total   = session[:total]

    choiceid = params[:choice]

    @question = session[:question]
    puts @question
    @choices = session[:choices]

    @choice = choiceid ? Choice.find(choiceid) : nil
    if @choice && @choice.correct
      @correct = true
      session[:correct] += 1
    else
      @correct = false
    end

    session[:current] += 1
  end

  def end
    @correct = session[:correct]
    @total = session[:total]

    @score = @correct * 100 / @total
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end
end
