class AddAssociationsToExam < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :doctor_id, :integer, null: false, foreign_key: true
    add_column :exams, :pacient_id, :integer, null: false, foreign_key: true
    add_reference :exams, :hospital, null: false, foreign_key: true
  end
end
