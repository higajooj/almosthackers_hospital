class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Exam, pacient_id: user.id

    can :manage, Exam do |exam|
      user.doctor_at_hospital?(exam.hospital)
    end
  end
end
