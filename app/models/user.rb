class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :hospital_user_associations
  has_many :hospitals, through: :hospital_user_associations
end
