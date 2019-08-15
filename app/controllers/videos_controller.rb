class VideosController < ApplicationController
    # before_action :require_login, only: [:show]
    # before_action :require_teacher_login
    # skip_before_action :require_teacher_login, only: [:show]
   # the show action should require person to be logged in too.

    def index
        @current_teacher = current_teacher
        @videos = @current_teacher.videos 
    end

    def show
        current_teacher
        current_student    
        @video = Video.find_by(id: params[:id])
    end

    def new
        @current_teacher = current_teacher
        @video = Video.new 
    end

    def create
        @video = current_teacher.videos.new(video_params)

        if @video.save
            redirect_to video_path(@video)
        else
            render new_video_path
        end
    end

    def edit
        @video = Video.find(params[:id])
    end

    def update
        @video = Video.find(params[:id])
        @video.update(video_params)
        redirect_to teacher_video_path(current_teacher, @video)
    end 

    def destroy
        Video.find(params[:id]).destroy 
        redirect_to teacher_videos_path(current_teacher)
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :duration)
    end

     # could possibly include these in the application controller so that
     # its available to multiple controllers.
    def require_teacher_login
        return head(:forbidden) unless session.include?(:teacher_id)
    end
     

    def require_login 
        if session.include?(:teacher_id) || session.include?(:student_id) 
            true 
        else
            return head(:forbidden)
        end
    end

end

