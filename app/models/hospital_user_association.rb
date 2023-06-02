class HospitalUserAssociation < ApplicationRecord
  belongs_to :hospital
  belongs_to :user
end
