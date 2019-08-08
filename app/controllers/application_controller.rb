class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # def teacher? 
    #     !!session[:teacher_id]
    # end

    # def student? 
    #     !!student[:student_id]
    # end

    # def current_teacher
    #     @current_teacher ||= @current_teacher = Teacher.find_by(id: session[:teacher_id])
    # end

    # def current_student
    #     @current_student ||= @current_student = Student.find_by(id: session[:student_id])
    # end

    protected 

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

end
