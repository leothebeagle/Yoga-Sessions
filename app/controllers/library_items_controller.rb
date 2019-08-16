class LibraryItemsController < ApplicationController
    def create 

        program = Program.find_by(id: params[:program_id])
        
        # refactor to a method that can be called like this: current_student.add_to_library(program)
         
        if !current_student.has_program?(program)
            current_student.add_program_to_library(program)
            flash[:notice] = "You successfully added this program to your library!!!!"
            redirect_to student_programs_path(current_student)
        else
            flash[:notice] = "You already have this program in your library"
            redirect_to student_programs_path(current_student) 
        end
    end 

    def destroy
        item_to_delete = LibraryItem.find_by(program_id: params[:program_id], student_id: current_student.id).destroy
        flash[:notice] = "You deleted a program from your library"
        redirect_to student_programs_path(current_student)
    end
end


