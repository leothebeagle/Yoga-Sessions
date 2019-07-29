class SessionsController < ApplicationController

    def new 
        
    end

    def create 
        if params[:teacher][:login] == "0"
            puts "logging in as student"
            @student = Student.find_by(email: params[:email])
            if @student.authenticate(params[:password])
                session[:student_id] = @student.id
                redirect_to student_path @student
            else
                render login_path
            end
        elsif params[:teacher][:login] == "1"
            puts "logging in as teacher"
            @teacher = Teacher.find_by(email: params[:email])
            if @teacher.authenticate(params[:password])
                redirect_to teacher_path @teacher 
            else 
                render login_path @teacher 
            end
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end

    private 


end
