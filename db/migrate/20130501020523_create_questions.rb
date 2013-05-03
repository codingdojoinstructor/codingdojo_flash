class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.references :level, index: true

      t.timestamps
    end
  end
end
