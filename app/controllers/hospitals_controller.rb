class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[show edit update destroy]

  def index
    @hospitals = current_user.hospitals
  end

  def show
    @exams = current_user.doctor_at_hospital?(@hospital) ?
      @hospital.exams : current_user.pacient_exams_at_hospital(@hospital)
  end

  def new
    @hospital = Hospital.new
  end

  def edit
  end

  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save

      @hospital.hospital_user_associations.create(user: current_user, role: "doctor")
      redirect_to hospital_url(@hospital), notice: "Hospital was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @hospital.update(hospital_params)
      redirect_to hospital_url(@hospital), notice: "Hospital was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hospital.destroy

    redirect_to hospitals_url, notice: "Hospital was successfully destroyed."
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:name)
  end
end
