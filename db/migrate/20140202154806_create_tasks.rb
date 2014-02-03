class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :tasks
      t.string :category
      t.date :due_date

      t.timestamps
    end
  end
end
