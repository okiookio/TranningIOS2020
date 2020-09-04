import UIKit

// https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/3/explicit.json
let json = """
{
  "feed": {
    "title":"Top Audio Podcasts",
    "country":"gb",
    "updated":"2017-11-16T02:02:55.000-08:00",
    "results":[
      {
      "artistName":"BBC Radio",
      "name":"Blue Planet II: The Podcast",
      "releaseDate":"2017-11-12",
      "url":"https://itunes.apple.com/gb/podcast/blue-planet-ii-the-podcast/id1296222557?mt=2"
    },
    {
      "artistName":"Audible",
      "name":"The Butterfly Effect with Jon Ronson",
      "releaseDate":"2017-11-03",
      "url":"https://itunes.apple.com/gb/podcast/the-butterfly-effect-with-jon-ronson/id1258779354?mt=2"
    },
    {
      "artistName":"TED",
      "name":"TED Talks Daily",
      "releaseDate":"2017-11-16",
      "url":"https://itunes.apple.com/gb/podcast/ted-talks-daily/id160904630?mt=2"
    }
    ]
  }
}
"""

struct RSSFeed: Codable {
    var feed: Feed?
}

// MARK: - Feed
struct Feed: Codable {
    var title, country, updated: String?
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var artistName, name, releaseDate: String?
    var url: String?
}


let data = Data(json.utf8)
let decoder = JSONDecoder()
let rssFeed = try! decoder.decode(RSSFeed.self, from: data)

