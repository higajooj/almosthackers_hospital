class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :trackable

  has_many :hospital_user_associations
  has_many :hospitals, through: :hospital_user_associations

  validates :name, presence: true
  validates :phone_number, presence: true, phone: {types: :mobile}

  def self.doctors_at_hospital(hospital)
    HospitalUserAssociation.where(hospital_id: hospital.id, role: "doctor").map { |a| a.user }
  end

  def self.pacients_at_hospital(hospital)
    HospitalUserAssociation.where(hospital_id: hospital.id, role: "pacient").map { |a| a.user }
  end

  def associated_at_hospital?(hospital)
    hospital.users.find_by(id: id)
  end

  def role_at_hospital(hospital)
    hospital_user_associations.find_by(hospital: hospital)&.role || "none"
  end

  def doctor_at_hospital?(hospital)
    role_at_hospital(hospital) == "doctor"
  end

  def pacient_exams
    Exam.where(pacient_id: id)
  end

  def pacient_exams_at_hospital(hospital)
    pacient_exams.where(hospital_id: hospital.id)
  end

  def doctor_exams
    Exam.where(doctor_id: id)
  end
end
