class CreateTeachers < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
      t.string :subject
      t.decimal :phone
      t.string :name

      t.timestamps null: false
    end
  end
  def down
  	drop_table :teachers
  end
end
