class YoutubeService
  def self.conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |f|
      f.params["key"] = ENV["YOUTUBE_API_KEY"]
    end
  end

  def self.get_video_by_country(country)
    response = conn.get("search",{
      q: "A Super Quick History of #{country} Mr. History",
      part: "snippet",
      type: "video",
      maxResults: 1
    })

    JSON.parse(response.body, symbolize_names: true)[:items][0]
  end
end
