class SharedVideosController < ApplicationController

  def index
    @shared_videos = user_signed_in? ? current_user.shared_videos : SharedVideo.all.includes(:user)

    render :index
  end

  def create
    render_result(SharedVideos::Create, create_params, shared_videos_path)
  end

  private

  def create_params
    params.require(:shared_video).permit(:url)
  end
end
