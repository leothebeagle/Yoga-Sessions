class SessionsController < ApplicationController

    def new 
        
    end

    def create 
        if params[:teacher][:login] == "0"
            @student = Student.find_by(email: params[:email])
            if @student.authenticate(params[:password])
                session[:student_id] = @student.id
                redirect_to student_path @student
            else
                render login_path
            end
        elsif params[:teacher][:login] == "1"
            @teacher = Teacher.find_by(email: params[:email])
            if @teacher.authenticate(params[:password])
                redirect_to teacher_path @teacher 
            else 
                render login_path @teacher 
            end
        end
    end

    private 


end
