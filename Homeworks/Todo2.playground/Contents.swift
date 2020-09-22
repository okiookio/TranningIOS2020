import UIKit

struct WeatherRespone: Codable {
    var cod: String?
    var message: Int?
    var city: City?
    var cnt: Int?
    var list: [ItemWeather]?
}

struct ItemWeather: Codable {
    var dt: Int?
    var temp: Temp?
    var pressure: Double?
    var humidity: Int?
    var weather: [Weather]?
    var speed: Double?
    var deg: Int?
    var clouds: Int?
    var snow: Double?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Temp: Codable {
    var day: Double?
    var min: Double?
    var max: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
}

struct City: Codable {
    var geonameId: Int?
    var name: String?
    var lat: Double?
    var lon: Double?
    var country: String?
    var iso2: String?
    var type: String?
    var population: Int?
}

extension JSONDecoder {
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

func request<T:Decodable>(url: URL, complete: ((T?, String?) -> Void)?) {
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        if let error = err {
            complete?(nil, error.localizedDescription)
        } else if let d = data {
            let decoder = JSONDecoder.iso8601
            do {
                let t = try decoder.decode(T.self, from: d)
                complete?(t, nil)
            } catch {
                print(error.localizedDescription)
                complete?(nil, error.localizedDescription)
                return
            }
        }
    }.resume()
}

var weatherRespone: WeatherRespone? = WeatherRespone() {
    didSet {
        let item = getItemWeatherAtId(weatherRespone)
        print(item)
    }
}

if let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1") {
    request(url: url) { (respone: WeatherRespone?, message: String?) in
//        print(respone)
        if let data = respone {
            // Lay data WeatherRespone
            weatherRespone = data
        } else if let error = message {
            // In ra loi neu co
            print(error)
        }
    }
}

func getItemWeatherAtId(_ data: WeatherRespone?) -> [ItemWeather?] {
    
    // lay danh sach Item weather
    let itemWeather: [ItemWeather] = data?.list ?? []
    
    // Lay item weather co id = 600
    let item = itemWeather.map { (item) -> ItemWeather? in
        
        // lay weather trong danh sách item weather
        let weather: [Weather]? = item.weather
        
        // lay weather co id = 600
        let weatherAtId: [Weather]? = weather?.filter({ (weather) -> Bool in
            return weather.id == 600
        })
        
        // kiem tra mang weatherAtId co bi nil hay khong
        guard let weatherItem = weatherAtId else { return nil }
        
        // Kiem tra mang weatherItem co bi empty hay khong
        return !weatherItem.isEmpty ? item : nil
        
        //Loai bo cac phan tu nil trong mang
    }.compactMap({ $0 })
    return item
}




