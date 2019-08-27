class ProgramsController < ApplicationController
  
    before_action :authenticate_teacher!, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_login #move this to app controller. and manually skip in relevant controllers.

    
    def index
        if params.include?(:teacher_id)
            @programs = Program.by_teacher(current_teacher)
        elsif params.include?(:student_id)
            @student = Student.find(params[:student_id])
            @programs = @student.programs
        else
            @programs = Program.all
        end 
    end

    def new
        @program = Program.new 
        @videos = current_teacher.videos 
    end
    
    def show
        @program = Program.find_by(id: params[:id]) 
    end

    def create
        @program = current_teacher.programs.new(program_params)
      
        if @program.save
            redirect_to program_path(@program) 
        else
            render new_teacher_program_path(current_teacher)
        end
    end

    def edit
        @program = Program.find_by(id: params[:id])
        @videos = current_teacher.videos 
    end

    def update
        @program = Program.find_by(id:params[:id])

        if current_teacher.programs.include?(@program)
            @program.update(program_params)
            redirect_to program_path(@program)
        else
            flash[:notice] = "You cannot edit this program"
            redirect_to teacher_programs_path(current_teacher)
        end
    end

    def destroy
        Program.find(params[:id]).destroy 
        redirect_to teacher_programs_path(current_teacher)
    end

    def most_popular
        @program = Program.most_popular_program
    end

    private 

    def program_params
        params.require(:program).permit(:name, :description, :teacher_id, video_ids: [])
    end


    def require_login
        if current_student || current_teacher
            true 
        else
            return head(:forbidden)
        end
    end

   # refactor finding a program. maybe set_program. DRYs up.
end

