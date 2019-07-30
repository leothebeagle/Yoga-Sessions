class ProgramsController < ApplicationController
    before_action :require_login, only: [:index, :show]

    before_action :require_teacher_login
    skip_before_action :require_teacher_login, only: [:index, :show]
    
    def index
        @programs = Program.all 
    end

    def show
        @program = Program.find_by(id: params[:id])
    end

    def new
        @program = Program.new 
        @videos = current_teacher.videos 
    end

    def create
    
        # @program = Program.new(program_params)
        @program = current_teacher.programs.new(program_params)
      
        if @program.save
            redirect_to program_path(@program) 
        else
            render new_program_path
        end
    end

    private 

    def program_params
        params.require(:program).permit(:name, :description, :teacher_id, video_ids: [])
    end

    def require_teacher_login
        return head(:forbidden) unless session.include? :teacher_id
    end

    def require_login 
        if session.include?(:teacher_id) || session.include?(:student_id) 
            true 
        else
            return head(:forbidden)
        end
    end

   

end
