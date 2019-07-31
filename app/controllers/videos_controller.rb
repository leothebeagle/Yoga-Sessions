class VideosController < ApplicationController
   #everything here will require a login. create action will depend on the teacher creating it.  
   before_action :require_teacher_login
   skip_before_action :require_teacher_login, only: [:show]

    def index
        @videos = current_teacher.videos 
    end

    def show
        @video = Video.find_by(id: params[:id])
        current_teacher
    end

    def new
        @teacher = current_teacher 
        @video = Video.new 
    end

    def create
        @video = Video.new(video_params)

        if @video.save
            redirect_to video_path(@video)
        else
            render new_video_path
        end
    end

    private

    def video_params
        params.require(:video).permit(:title, :description, :duration, :teacher_id)
    end

    def require_teacher_login
        return head(:forbidden) unless session.include? :teacher_id
    end 

end
