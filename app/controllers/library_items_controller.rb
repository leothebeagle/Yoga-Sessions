class LibraryItemsController < ApplicationController
    def create 
        program = Program.find_by(id: params[:library_item][:program_id])
        if !current_student.programs.include?(program)
            current_student.programs << program
            current_student.save
            flash[:notice] = "You successfully added this program to your library!!!!"
            redirect_to student_programs_path @current_student
        else
            flash[:notice] = "You already have this program in your library"
            redirect_to student_programs_path @current_student 
        end
    end 
end


