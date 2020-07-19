class VideoDetails
  attr_accessor :video_url, :details

  def initialize(url)
    @video_url = VideoInfo.new(url)
    
    set_video_details
  end

  def set_video_details
    @details = {
      url: @video_url.url,
      video_id: @video_url.video_id,
      title: @video_url.title, 
      thumbnail: @video_url.thumbnail_medium,
      duration: @video_url.duration,
      # author: @video_url.author,
      provider: @video_url.provider,
      description: @video_url.description
    }
  end
end