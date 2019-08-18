class Student::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
    def instagram 
        @student = Student.from_omniauth(request.env["omniauth.auth"])

        if @student.persisted?
          
          sign_in_and_redirect @student, event: :authentication
          set_flash_message(:notice, :success, kind: "Instagram") if is_navigational_format?
        else
          session["devise.instagram_data"] = request.env["omniauth.auth"]
          flash[:notice] = "couldn't sign in with instagram"
          redirect_to new_student_registration_url
        end
    end
      
      def failure
        redirect_to root_path
      end
end