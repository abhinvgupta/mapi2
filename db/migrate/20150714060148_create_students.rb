class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students , {:id => false} do |t|
      t.integer :roll_no, null: false 
      t.string :s_name
      t.integer :marks
      t.references :Teacher
      t.timestamps null: false
    end
  end
  def down
  	drop_table :students
  end
end
