class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    counter = Question.count
    qid = rand(1..counter)
    if qid == 0
      qid = 1
    end
    new_question = Question.find(qid)
    answers = new_question.answers.all
    data = { :questions => new_question, :answers => answers }
    respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
