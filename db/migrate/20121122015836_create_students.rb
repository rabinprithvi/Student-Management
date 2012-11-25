class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :classroom
      t.datetime :dob
      t.string :gender
      t.string :religion
      t.string :address

      t.timestamps
    end
  end
end
