module ApplicationHelper
    def navbar
        if current_page?("/")
            render partial: "layouts/nav_student_logged_out"
        elsif current_page?("/teachers/homepage")
            render partial: "layouts/nav_teacher_logged_out"
        end
    end
end
