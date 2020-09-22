import UIKit


let json =
    """
{
  "plus_code": {
    "compound_code": "2Q4H+2P Từ Liêm, Hanoi, Vietnam",
    "global_code": "7PH72Q4H+2P"
  },
  "results": [
    {
      "address_components": [
        {
          "long_name": "Từ Liêm",
          "short_name": "Từ Liêm",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Khu Vườn Cam Phú Đô, 98, Phường Mễ Trì, Quận Nam Từ Liêm, Thành Phố Hà Nội, Mễ Trì, Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "location": {
          "lat": 21.0050203,
          "lng": 105.7792139
        },
        "location_type": "GEOMETRIC_CENTER",
        "viewport": {
          "northeast": {
            "lat": 21.0063692802915,
            "lng": 105.7805628802915
          },
          "southwest": {
            "lat": 21.0036713197085,
            "lng": 105.7778649197085
          }
        }
      },
      "place_id": "ChIJVW8Qq1NTNDER5uf0lGBku3Q",
      "plus_code": {
        "compound_code": "2Q4H+2M Từ Liêm, Hanoi, Vietnam",
        "global_code": "7PH72Q4H+2M"
      },
      "types": [
        "establishment",
        "food",
        "health",
        "point_of_interest",
        "store"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "36",
          "short_name": "36",
          "types": [
            "administrative_area_level_2",
            "street_number"
          ]
        },
        {
          "long_name": "Ngõ 68 Mễ Trì Thượng",
          "short_name": "Ngõ 68 Mễ Trì Thượng",
          "types": [
            "administrative_area_level_2",
            "route"
          ]
        },
        {
          "long_name": "Nam Từ Liêm",
          "short_name": "Nam Từ Liêm",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "36 Ngõ 68 Mễ Trì Thượng, Mễ Trì, Nam Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "location": {
          "lat": 21.005071,
          "lng": 105.7789424
        },
        "location_type": "ROOFTOP",
        "viewport": {
          "northeast": {
            "lat": 21.0064199802915,
            "lng": 105.7802913802915
          },
          "southwest": {
            "lat": 21.0037220197085,
            "lng": 105.7775934197085
          }
        }
      },
      "place_id": "ChIJQVrGUFJTNDERn9NPex4ePm4",
      "plus_code": {
        "compound_code": "2Q4H+2H Nam Từ Liêm, Hà Nội, Vietnam",
        "global_code": "7PH72Q4H+2H"
      },
      "types": [
        "street_address"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "52",
          "short_name": "52",
          "types": [
            "street_number"
          ]
        },
        {
          "long_name": "Mễ Trì Thượng",
          "short_name": "Mễ Trì Thượng",
          "types": [
            "route"
          ]
        },
        {
          "long_name": "Từ Liêm",
          "short_name": "Từ Liêm",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "52 Mễ Trì Thượng, Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.0048753,
            "lng": 105.7790045
          },
          "southwest": {
            "lat": 21.0046965,
            "lng": 105.7787987
          }
        },
        "location": {
          "lat": 21.004791,
          "lng": 105.778892
        },
        "location_type": "ROOFTOP",
        "viewport": {
          "northeast": {
            "lat": 21.0061348802915,
            "lng": 105.7802505802915
          },
          "southwest": {
            "lat": 21.0034369197085,
            "lng": 105.7775526197085
          }
        }
      },
      "place_id": "ChIJG__aWVJTNDER6Gihqmf-O-s",
      "types": [
        "premise"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "52",
          "short_name": "52",
          "types": [
            "street_number"
          ]
        },
        {
          "long_name": "Ngõ 50 Mễ Trì Thượng",
          "short_name": "Ng. 50 Mễ Trì Thượng",
          "types": [
            "route"
          ]
        },
        {
          "long_name": "Từ Liêm",
          "short_name": "Từ Liêm",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "52 Ng. 50 Mễ Trì Thượng, Mễ Trì, Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.0053459,
            "lng": 105.7798084
          },
          "southwest": {
            "lat": 21.0046832,
            "lng": 105.7787953
          }
        },
        "location": {
          "lat": 21.0050939,
          "lng": 105.7792436
        },
        "location_type": "GEOMETRIC_CENTER",
        "viewport": {
          "northeast": {
            "lat": 21.00636353029151,
            "lng": 105.7806508302915
          },
          "southwest": {
            "lat": 21.0036655697085,
            "lng": 105.7779528697085
          }
        }
      },
      "place_id": "ChIJxzz--FJTNDER6E73PiOjc7A",
      "types": [
        "route"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "Mễ Trì",
          "short_name": "Mễ Trì",
          "types": [
            "administrative_area_level_3",
            "political"
          ]
        },
        {
          "long_name": "Nam Từ Liêm",
          "short_name": "Nam Từ Liêm",
          "types": [
            "political",
            "administrative_area_level_2"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Mễ Trì, Nam Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.0204941,
            "lng": 105.79288
          },
          "southwest": {
            "lat": 20.9926281,
            "lng": 105.7721721
          }
        },
        "location": {
          "lat": 21.0049716,
          "lng": 105.7850022
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": 21.0204941,
            "lng": 105.79288
          },
          "southwest": {
            "lat": 20.9926281,
            "lng": 105.7721721
          }
        }
      },
      "place_id": "ChIJneK_yaysNTERA3hSneLWkCw",
      "types": [
        "administrative_area_level_3",
        "political"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "Mễ Trì",
          "short_name": "Mễ Trì",
          "types": [
            "political",
            "sublocality",
            "sublocality_level_1"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Mễ Trì, Hà Nội, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.0202862,
            "lng": 105.7932759
          },
          "southwest": {
            "lat": 20.9925899,
            "lng": 105.7678915
          }
        },
        "location": {
          "lat": 21.0055267,
          "lng": 105.7791327
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": 21.0202862,
            "lng": 105.7932759
          },
          "southwest": {
            "lat": 20.9925899,
            "lng": 105.7678915
          }
        }
      },
      "place_id": "ChIJjY3WA1FTNDERU3egvgkWQhI",
      "types": [
        "political",
        "sublocality",
        "sublocality_level_1"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "Nam Từ Liêm",
          "short_name": "Nam Từ Liêm",
          "types": [
            "political",
            "administrative_area_level_2"
          ]
        },
        {
          "long_name": "Hà Nội",
          "short_name": "Hà Nội",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Nam Từ Liêm, Hà Nội, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.0589091,
            "lng": 105.796817
          },
          "southwest": {
            "lat": 20.9801741,
            "lng": 105.726366
          }
        },
        "location": {
          "lat": 21.0034608,
          "lng": 105.7703287
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": 21.0589091,
            "lng": 105.796817
          },
          "southwest": {
            "lat": 20.9801741,
            "lng": 105.726366
          }
        }
      },
      "place_id": "ChIJ83IOCKFUNDERl-NDjTWui7A",
      "types": [
        "political",
        "administrative_area_level_2"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "Hanoi",
          "short_name": "Hanoi",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Hanoi, Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 21.3850271,
            "lng": 106.0198859
          },
          "southwest": {
            "lat": 20.5623231,
            "lng": 105.2854659
          }
        },
        "location": {
          "lat": 21.0031177,
          "lng": 105.8201408
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": 21.3850271,
            "lng": 106.0198859
          },
          "southwest": {
            "lat": 20.5623231,
            "lng": 105.2854659
          }
        }
      },
      "place_id": "ChIJKQqAE44ANTERDbkQYkF-mAI",
      "types": [
        "administrative_area_level_1",
        "political"
      ]
    },
    {
      "address_components": [
        {
          "long_name": "Vietnam",
          "short_name": "VN",
          "types": [
            "administrative_area_level_2",
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Vietnam",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": 23.3926504,
            "lng": 109.6765
          },
          "southwest": {
            "lat": 8.1952001,
            "lng": 102.1439156
          }
        },
        "location": {
          "lat": 14.058324,
          "lng": 108.277199
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": 23.3926504,
            "lng": 109.6765
          },
          "southwest": {
            "lat": 8.1952001,
            "lng": 102.1439156
          }
        }
      },
      "place_id": "ChIJXx5qc016FTERvmL-4smwO7A",
      "types": [
        "country",
        "political"
      ]
    }
  ],
  "status": "OK"
}
"""

struct GoogleGeocodingResponse: Codable {
    var results: [GeoreponseModel]?
    var plusCode: PlusCode?
}

struct GeoreponseModel: Codable {
    var addressComponents: [AddressComponent]?
    var formattedAddress: String?
    var geometry: Geometry?
    var placeId: String?
    var plusCode: PlusCode?
    var types: [String]?
}

struct AddressComponent: Codable {
    var longName: String?
    var shortName: String?
    var types: [String]?
}

struct PlusCode: Codable {
    var compoundCode: String?
    var globalCode: String?
}

struct Geometry: Codable {
    var location: Location?
    var locationType: String?
    var viewport: Viewport?
}

struct Viewport: Codable {
    var northeast: Location?
    var southwest: Location?
}

struct Location: Codable {
    var lat: Double?
    var lng: Double?
}

extension JSONDecoder {
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

func requestAPI() -> GoogleGeocodingResponse? {
    let decoder = JSONDecoder.iso8601
    do {
        guard let data = json.data(using: .utf8) else { return nil }
        let googleGeocodingResponse = try decoder.decode(GoogleGeocodingResponse.self, from: data)
//        print("googleGeocodingResponse", googleGeocodingResponse)
        return googleGeocodingResponse
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

var dataGMSGeocodingModel = requestAPI()

// Lấy danh sách các Georepoonse
let input: [GeoreponseModel]? = dataGMSGeocodingModel?.results

// Lấy danh sách các addressComponent có trong Georeponse
let addressComponents = input?.map({ (item) -> [AddressComponent]? in
    return item.addressComponents
}).compactMap({ $0 }).flatMap({ $0 })

// Tìm các addressComponnents có types là administrative_area_level_2
let address = addressComponents?.filter({ (item) -> Bool in
    return item.types?.contains("administrative_area_level_2") ?? false
})

// Lấy longName
let longName = address?.map({ (item) -> String? in
    return item.longName ?? nil
}).compactMap({ $0 })

print(longName ?? "")

//list place id cua cac GeoreponseModel co chua it nhat 1 addressComponents co types administrative_area_level_2

let placeId = input?.map({ (item) -> String? in
    
    guard let itemAddress = item.addressComponents else { return nil }
    
    // get list addressComponent types is administrative_area_level_2
    let addressComponents: [AddressComponent] = itemAddress.filter { (addresss) -> Bool in
        return addresss.types?.contains("administrative_area_level_2") ?? false
    }
    // get place id of georeponseModel co it nhat 1 addressComponent 
    let placeId: String? = addressComponents.count != 0 ? item.placeId : nil
    
    return placeId
}).compactMap({ $0 })

print(placeId ?? "")
