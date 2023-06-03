class Hospital < ApplicationRecord
  has_many :hospital_user_associations, dependent: :destroy
  has_many :users, through: :hospital_user_associations
  has_many :exams, dependent: :destroy

  validates :name, presence: true
end
