class VideosController < ApplicationController
    before_action :require_login, only: [:show]
    before_action :require_teacher_login
    skip_before_action :require_teacher_login, only: [:show]
   # the show action should require person to be logged in too.

    def index
        @videos = current_teacher.videos 
    end

    def show
        @video = Video.find_by(id: params[:id])
        current_teacher
    end

    def new
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

    private

    def video_params
        params.require(:video).permit(:title, :description, :duration)
    end

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

