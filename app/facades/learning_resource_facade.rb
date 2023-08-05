class LearningResourceFacade
  def self.get_learning_resource(country)
    # return [] if country.nil?

    video = YoutubeService.get_video_by_country(country)
    images = UnsplashService.get_images_by_country(country)

    LearningResource.new({
      country: country,
      video: video,
      images: images
    })
  end
end