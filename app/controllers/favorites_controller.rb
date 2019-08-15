class FavoritesController < ApplicationController

    def create 

        program = Program.find(params[:program_id])
 
        if current_student.has_program?(program)
            LibraryItem.mark_as_favorite(current_student, program)
            flash[:notice] = "You have favorited this program!"
            redirect_to program_path(program) 
        else
            current_student.add_program_to_library(program)
            LibraryItem.mark_as_favorite(current_student, program)
            flash[:notice] = "You have favorited this program!"
            redirect_to program_path(program) 
        end
    end

    def destroy
        
    end
end