class ProgramsController < ApplicationController

    def show
        @program = Program.find_by(id: params[:id])
    end

    def new
        @program = Program.new 
        @videos = Teacher.first.videos
    end

    def create
        @program = Program.new(program_params)

        if program.save
            redirect_to program_path(@program)
        else
            render new_program_path
        end
    end

    private 

    def program_params
        params.require(:program).permit(:name, :description, :teacher_id, :video_ids => [])
    end
end
