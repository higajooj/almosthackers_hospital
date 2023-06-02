class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[show edit update destroy]

  def index
    @hospitals = Hospital.all
  end

  def show
  end

  def new
    @hospital = Hospital.new
  end

  def edit
  end

  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
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
