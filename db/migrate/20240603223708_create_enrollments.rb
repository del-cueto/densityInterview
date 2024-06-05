class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
