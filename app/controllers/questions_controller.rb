class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @level = Level.select(:id)
    level_array = []
    @level.each do |l|
      level_array.push(l.id)
    end
    level = level_array[0]
    if !params[:level].nil?
      level_index = params[:level].to_i
      level = level_array[level_index]
    end

    counter = Question.where(:level_id => level).select(:id).count
    questions = Question.where(:level_id => level).select(:id)
    num = 0
    if counter > 1
      num = rand(0..counter)
    end
    qid = questions[num][:id]
    new_question = Question.find(qid)
    answers = new_question.answers.all
    top = Topic.find(new_question.topic)
    belt = top.belt
    topic = top.name
    level_name = Level.select(:name).find(level).name
    data = { :questions => new_question, :answers => answers, :level_name => level_name, :level => level_index, :belt => belt, :topic => topic }
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
