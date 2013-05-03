# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  belt       :string(255)
#  level_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  belongs_to :level
end
