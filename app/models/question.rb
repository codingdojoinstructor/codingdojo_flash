# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  level_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :level
end
