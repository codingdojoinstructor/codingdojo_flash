class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :belt
      t.references :level, index: true

      t.timestamps
    end
  end
end
