class ExamsController < ApplicationController
  before_action :set_exam, only: %i[show edit update]
  before_action :set_hospital

  def show
  end

  def new
    @exam = Exam.new
  end

  def edit
  end

  def create
    @exam = @hospital.exams.new(exam_params)

    if @exam.save
      redirect_to hospital_exam_url(@hospital, @exam), notice: "Exam was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @exam.update(exam_params)
      redirect_to hospital_exam_url(@hospital, @exam), notice: "Exam was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def set_hospital
    @hospital = Hospital.find(params[:hospital_id])
  end

  def exam_params
    params.require(:exam).permit(:name, :description, :doctor_id, :pacient_id)
  end
end
