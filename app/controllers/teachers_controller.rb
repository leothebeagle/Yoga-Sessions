class TeachersController < ApplicationController
    
    def show
        @teacher = Teacher.find(params[:id])
    end
    
    def new
       @teacher = Teacher.new
    end

    def create
        teacher = Teacher.new(teacher_params)
        
        if teacher.save
            redirect_to teacher_path(teacher)
        else
            render 'new'
        end
    end

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
    end

end
