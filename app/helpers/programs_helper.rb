module ProgramsHelper

    def programs_index_links
        if current_teacher
            teacher_links 
        elsif current_student
            student_links 
        end
    end

    def teacher_links
        if @programs == current_teacher.programs 
            link_to("Create a New Program", new_teacher_program_path(current_teacher))       
        else
            link_to("View your programs", teacher_programs_path(current_teacher))        
        end
    end

    def student_links
        if @programs == current_student.programs
		    link_to("View all programs", programs_path)
        else
            link_to("View your programs", student_programs_path(current_student))
        end
    end

    # def display_programs_index_links(program)
    #     if current_student.has_program?(program)
    #         "render partial: 'favoriting_links', locals: {program: #{program}"
    #         "render partial: 'update_library_links, locals: {program: #{program}"
    #     elsif !current_student.has_program?(program)
    #         render partial: 'update_library_links'
    #     end
    # end
end
