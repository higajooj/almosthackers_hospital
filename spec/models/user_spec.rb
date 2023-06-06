require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do
  describe "abilities" do
    before do
      @user1 = User.create!(email: "joao@example.com", name: "Joao", phone_number: "+5511912345678", password: "123123", password_confirmation: "123123")
      @user2 = User.create!(email: "pedro@example.com", name: "Pedro", phone_number: "+5511912348888", password: "123123", password_confirmation: "123123")
      @user3 = User.create!(email: "marcio@example.com", name: "Marcio", phone_number: "+5511912348888", password: "123123", password_confirmation: "123123")
      @hospital1 = Hospital.create!(name: "Los Angeles General Medical Center")
      @hospital2 = Hospital.create!(name: "HCA Healthcare")
      @hospital3 = Hospital.create!(name: "Veterans Health Administration")
      @association1 = HospitalUserAssociation.create!(hospital_id: @hospital2.id, user_id: @user1.id, role: "pacient")
      @association2 = HospitalUserAssociation.create!(hospital: @hospital2, user: @user1, role: "pacient")
      @association3 = HospitalUserAssociation.create!(hospital: @hospital1, user: @user2, role: "pacient")
      @association4 = HospitalUserAssociation.create!(hospital: @hospital2, user: @user2, role: "doctor")
      @association5 = HospitalUserAssociation.create!(hospital: @hospital1, user: @user3, role: "doctor")
      @association6 = HospitalUserAssociation.create!(hospital: @hospital2, user: @user3, role: "doctor")
      @association7 = HospitalUserAssociation.create!(hospital: @hospital3, user: @user1, role: "doctor")
      @association8 = HospitalUserAssociation.create!(hospital: @hospital3, user: @user3, role: "pacient")
      @exam1 = @hospital1.exams.create!({name: "exam test", description: "procedure X", doctor_id: @user3.id, pacient_id: @user1.id})
      @exam2 = @hospital1.exams.create!({name: "exam test", description: "procedure X", doctor_id: @user3.id, pacient_id: @user2.id})
      @exam3 = @hospital2.exams.create!({name: "exam test", description: "procedure X", doctor_id: @user2.id, pacient_id: @user1.id})
      @exam4 = @hospital3.exams.create!({name: "exam test", description: "procedure X", doctor_id: @user1.id, pacient_id: @user3.id})
    end
    subject(:ability) { Ability.new(@user2) }

    context "pacient at hospital" do
      it "can read their own exams at associated hospital" do
        is_expected.to be_able_to(:read, @exam2)
      end

      it "cannot read others' exams at associated hospital" do
        is_expected.not_to be_able_to(:read, @exam1)
      end

      it "cannot manage exams at associated hospital" do
        is_expected.not_to be_able_to(:manage, @exam2)
      end

      it "cannot read exams at non-associated hospital" do
        is_expected.not_to be_able_to(:read, @exam4)
      end
    end

    context "doctor at hospital" do
      it "can manage any exams at associated hospital" do
        is_expected.to be_able_to(:manage, @exam3)
      end

      it "cannot manage exams at hospital where they're pacient" do
        is_expected.not_to be_able_to(:manage, @exam2)
      end

      it "cannot read exams at non associated hospital" do
        is_expected.not_to be_able_to(:read, @exam4)
      end
    end
  end
end
