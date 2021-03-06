class TeachersController < ApplicationController
    
    def index 
        if params.include?(:student_id)
            current_student
            @teachers = current_student.teachers.uniq
        else 
            @teachers = Teacher.all
        end
    end

    def show
        if params[:id]
            @teacher = Teacher.find(params[:id])
        else
            @teacher = current_teacher
        end
    end
    
    # new and create actions below can probably be ommitted
    # we are using devise for user registration.
    def new
       @teacher = Teacher.new
    #    (first_name: "test", last_name: "test", email: "test", bio: "test", password_digest: "jkjk")
    end

    def create
        @teacher = Teacher.new(teacher_params)
        
        if @teacher.save
            session[:teacher_id] = @teacher.id 
            redirect_to teacher_path(@teacher)
        else
            render new_teacher_path
        end
    end

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
    end

end
