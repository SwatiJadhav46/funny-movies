module SharedVideos
  class Create
    attr_reader :params, :result, :current_user

    def initialize(params, current_user)
      @current_user = current_user
      @params       = params
    end

    def call
      fetch_video_details && create_shared_video && set_result
    end

    private

    def fetch_video_details
      @video = VideoDetails.new(@params[:url])
    end

    def create_shared_video
      @shared_video = current_user.shared_videos.create(@video.details)

      true
    end

    def set_result
      @result = @shared_video
    end
  end
end