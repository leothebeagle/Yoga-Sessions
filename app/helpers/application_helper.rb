module ApplicationHelper
    def navbar
        if current_page?("/") && !current_student
            render partial: "layouts/nav_student_logged_out"
        elsif current_page?("/teachers/homepage") && !current_teacher
            render partial: "layouts/nav_teacher_logged_out"
        elsif current_student 
            render partial: "layouts/nav_student_logged_in"
        elsif current_teacher 
            render partial: "layouts/nav_teacher_logged_in"
        end
    end
end
