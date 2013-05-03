# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  content      :text
#  right_answer :integer
#  question_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :question
end
