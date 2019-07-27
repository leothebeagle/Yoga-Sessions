class VideosController < ApplicationController
   #everything here will require a login. create and show will only be available to 
   # the user that created them. 
    def show
    end

    def new
        @teacher = Teacher.first
        @video = Video.new 
        # will assigning @video this way mean that
        # there is a way to pass the teacher_id to the video create action automatically?
        #that doesnt make sense....you probably will have to pass it in as a hidden input. 
        # worth checking out tho. 
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

end
