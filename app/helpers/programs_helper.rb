module ProgramsHelper

    def program_links(program)
        if current_student 
            student_program_links(program) 
        elsif current_teacher 
            teacher_program_links(program)
        end
    end

    def student_program_links(program)
         if current_student.has_program?(program) 
            render partial: 'programs/favoriting_links', locals: {program: program} 
            render partial: 'programs/update_library_links', locals: {program: program} 
         elsif !current_student.has_program?(program) 
            render partial: 'programs/update_library_links', locals: {program: program}
         end
    end

    def teacher_program_links(program)
        if current_teacher.has_program?(program)
            render partial: 'programs/edit_and_delete_links', locals: {program: program} 
        end
    end

end
