class StudentsController < ApplicationController
    
    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        
        if @student.save
            redirect_to student_path(@student)
        else
            render new_student_path
        end
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end


end
