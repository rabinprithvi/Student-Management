class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.integer :student_id
      t.integer :sub1
      t.integer :sub2
      t.integer :sub3
      t.integer :sub4
      t.integer :sub5
      t.integer :total
      t.integer :rank
      t.string :term

      t.timestamps
    end
  end
end
