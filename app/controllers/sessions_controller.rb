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
                session[:teacher_id] = @teacher.id
                redirect_to teacher_path @teacher 
            else 
                render login_path @teacher 
            end
        end
    end

    def create_instagram
        @student = Student.find_or_create_by(uid: auth['uid']) do |u|
            u.first_name = auth['info']['name']
            u.email = auth['info']['email']
        end
        binding.pry
        
        session[:student_id] = @student.id 
        redirect_to student_path @student
    end

    def destroy
        session.clear
        redirect_to login_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end


end
