class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :right_answer
      t.references :question, index: true

      t.timestamps
    end
  end
end
