class StudentsController < ApplicationController
    
    def show
        @student = current_student
        
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        
        if @student.save
            session[:student_id] = @student.id
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
