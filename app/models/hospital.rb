class Hospital < ApplicationRecord
  has_many :hospital_user_associations
  has_many :users, through: :hospital_user_associations
end
