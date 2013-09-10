# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name:  'Chicago' }, { name:  'Copenhagen' }])
#   Mayor.create(name:  'Emanuel', city: cities.first)
	
	# Default Topics
	Topic.delete_all
	topics = [{ name:  'HTML', belt:  'White'}, { name:  'CSS', belt:  'White'}, { name:  'jQuery', belt:  'White'}, { name:  'PHP', belt:  'Yellow'}, { name:  'Ajax', belt:  'Yellow'}, { name:  'MySQL', belt:  'Yellow'}, { name:  'Database Design', belt:  'Yellow'}, { name:  'OOP',belt: 'Green'}, { name:  'Git', belt:  'Green'}, { name:  'Ruby', belt:  'Green'}, { name:  'Cloud Server', belt:  'Green'}, { name:  'Ruby on Rails', belt:  'Red'}, { name:  'CodeIgniter', belt:  'Red'}, { name:  'CS Theory', belt:  'Black'}]
	
	topics.each do |topic|
		Topic.create(:name => topic[:name], :belt => topic[:belt])
	end
	
	# Default Levels
	Level.delete_all
	levels = [{ name:  'student'}, { name:  'master'}, { name:  'Grand Master'}, { name:  'Sage'}, { name:  'Sensei'}]
	
	levels.each do |level|
		Level.create(:name => level[:name])
	end

	if Rails.env == 'development' 
		Answer.delete_all
		Question.delete_all
	    50.times do |i|
	    	# get the topic id based on the array of topics
	    	tcount = topics.count 
	    	tcount -= 1
				tnum = rand(0..tcount)
				tname = topics[tnum][:name]
				t = Topic.select(:id).where(:name => tname)
				topic_id = t[0][:id]

				# get the level id based on the array of levels
				lcount = levels.count
				lcount -= 1
				lnum = rand(0..lcount)
				lname = levels[lnum][:name]
				t = Level.select(:id).where(:name => lname)
				level_id = t[0][:id]

				topic = Topic.find(topic_id)
		    level = Level.find(level_id)

		    question_content = "Question #{i} with topic #{topic[:name]} and level #{level[:name]}"
		    @question = Question.new(:content => question_content)
		    @question.level = level 
		    @question.topic = topic
	      if @question.save
	        question = Question.find(@question.id)
	        right_answer = rand(0..3)
	        4.times do |r|
	        	answer_content = "Possible answer #{r} for question #{i}. Incorrect"
	        	correct_answer = 0
	        	if r == right_answer
	        		answer_content = "Possible answer #{r} for question #{i}. Correct!"
	        		correct_answer = 1
	        	end
	        	a = { content: answer_content, right_answer: correct_answer}
	          @answer = Answer.new(:content => a[:content], :right_answer => a[:right_answer])
	          @answer.question = question
	          if @answer.save
	            puts "answer #{a} created successfully"
	          else
	            puts @answer.errors.full_messages
	          end
	        end
	        
	      else
	        puts "unable to save questions #{question.error.all}"
	      end
	    end
	end