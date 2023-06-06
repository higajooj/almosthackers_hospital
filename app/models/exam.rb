class Exam < ApplicationRecord
  belongs_to :pacient, foreign_key: :pacient_id, class_name: "User"
  belongs_to :doctor, foreign_key: :doctor_id, class_name: "User"
  belongs_to :hospital

  validates :name, presence: true
  validates :description, presence: true
end
