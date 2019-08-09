class ProgramsController < ApplicationController
    
    
    def index
        if params.include?(:teacher_id)
            @current_teacher = current_teacher 
            @programs = current_teacher.programs 
        elsif params.include?(:student_id)
            @programs = current_student.programs
        else
            @current_teacher = current_teacher
            @current_student = current_student
            @programs = Program.all
        end 
    end

    def show
        @current_student = current_student
        @current_teacher = current_teacher
        @program = Program.find_by(id: params[:id])
        @videos = @program.videos
    end

    def new
        @program = Program.new 
        @videos = current_teacher.videos 
    end

    def create
        @program = current_teacher.programs.new(program_params)
      
        if @program.save
            redirect_to program_path(@program) 
        else
            render new_program_path
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
