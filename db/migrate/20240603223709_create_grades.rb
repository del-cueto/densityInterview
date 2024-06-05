class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.integer :first_quarter
      t.integer :second_quarter
      t.integer :third_quarter
      t.integer :fourth_quarter

      t.timestamps
    end
  end
end
