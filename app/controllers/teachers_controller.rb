class TeachersController < ApplicationController
  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    raise params.inspect
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end
