class FavoritesController < ApplicationController

    def create 
        program = Program.find(params[:program_id])
        #refactor point
        if current_student.programs.include?(program)
            student_program = current_student.library_items.find_by(program_id: program.id)
            student_program.update(favorited: true)
            flash[:notice] = "You have favorited this program!"
            redirect_to program_path(program) 
        else
            curent_student.programs << program 
            student_program = current_student.library_items.find_by(program_id: params[:library_item][:program_id])
            student_program.favorited = true
            redirect_to program_path(program)
        end
    end
end