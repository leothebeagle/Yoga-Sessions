class LibraryItemsController < ApplicationController
    def create 
        
        program = Program.find_by(id: params[:library_item][:program_id])
        current_student.programs << program
        current_student.save
        redirect_to student_path @current_student
    end 
end


