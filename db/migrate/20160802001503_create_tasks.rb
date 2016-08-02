class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :title
      t.text :content
      t.datetime :deadline
      t.string :charge
      t.boolean :done, default: false
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
