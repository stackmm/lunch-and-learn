class LearningResourceFacade
  def self.get_resources(country)
    video = YoutubeService.get_video_by_country(country)
    images = UnsplashService.get_images_by_country(country)

    LearningResource.new({
      country: country,
      video: video,
      images: images
    })
  end
end