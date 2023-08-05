class LearningResource
  attr_reader :id, :country, :video, :images

  def initialize(data)
    @id = nil
    @country = data[:country]
    @video = format_video(data[:video]) || {}
    @images = format_images(data[:images]) || []
  end

  def format_video(data)
    { title: data[:snippet][:title], youtube_video_id: data[:id][:videoId] }
  end

  def format_images(data)
    data.map do |image|
      { alt_tag: image[:alt_description], url: image[:urls][:raw] }
    end
  end
end