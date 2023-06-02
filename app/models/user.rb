class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :trackable

  has_many :hospital_user_associations
  has_many :hospitals, through: :hospital_user_associations

  def associated_at_hospital?(hospital)
    hospital.users.find_by(id: id)
  end

  def role_at_hospital(hospital)
    hospital_user_associations.find_by(hospital: hospital).role
  end
end
