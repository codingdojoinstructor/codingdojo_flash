class RemoveLevelFromTopics < ActiveRecord::Migration
  def change
    remove_reference :topics, :level, index: true
  end
end
