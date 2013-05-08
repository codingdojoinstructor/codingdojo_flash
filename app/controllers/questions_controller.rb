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

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
  end

  def new
    @question = Question.new
      4.times do |i|
        puts @question
        @question.answers.build
      end
  end

  def create
    topic = Topic.find(params[:question][:topic_id])
    level = Level.find(params[:question][:level_id])
    @question = Question.new(:content => params[:question][:content])
    @question.level = level 
    @question.topic = topic
    respond_to do |format|
      if @question.save
        question = Question.find(@question.id)
        params[:question][:answers_attributes].each do |a|
          @answer = Answer.new(a[1])
          @answer.question = question
          if @answer.save
            puts "answer #{a} created successfully"
          else
            puts @answer.errors.full_messages
          end
        end
        format.html { redirect_to @question, notice: 'New Question was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
