import UIKit

var str = "Hello, playground"


// https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/3/explicit.json
let json = """
[
{
"id": "1",
"createdAt": "2019-12-04T21:47:54.614Z",
"name": "Yoshiko",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/reideiredale/128.jpg"
},
{
"id": "2",
"createdAt": "2020-07-29T01:11:21.069Z",
"name": "Janet",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/txcx/128.jpg"
},
{
"id": "3",
"createdAt": "2020-01-21T06:23:30.457Z",
"name": "Abigayle",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/thaodang17/128.jpg"
},
{
"id": "4",
"createdAt": "2020-03-31T17:21:52.000Z",
"name": "Winnifred",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/edhenderson/128.jpg"
},
{
"id": "5",
"createdAt": "2020-08-04T22:53:16.126Z",
"name": "Ed",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/mr_subtle/128.jpg"
},
{
"id": "6",
"createdAt": "2020-06-04T06:17:53.793Z",
"name": "Frank",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/s4f1/128.jpg"
},
{
"id": "7",
"createdAt": "2020-07-05T09:39:17.761Z",
"name": "Nelle",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/runningskull/128.jpg"
},
{
"id": "8",
"createdAt": "2020-01-24T00:53:53.394Z",
"name": "Junior",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/martip07/128.jpg"
},
{
"id": "9",
"createdAt": "2020-08-25T15:42:15.168Z",
"name": "Stanton",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/mufaddal_mw/128.jpg"
},
{
"id": "10",
"createdAt": "2020-04-09T09:20:20.858Z",
"name": "Eddie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/arashmanteghi/128.jpg"
},
{
"id": "11",
"createdAt": "2019-10-15T00:56:12.323Z",
"name": "Adelle",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/michaelcomiskey/128.jpg"
},
{
"id": "12",
"createdAt": "2020-02-09T03:32:44.196Z",
"name": "Billie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/alessandroribe/128.jpg"
},
{
"id": "13",
"createdAt": "2020-03-27T06:39:57.751Z",
"name": "Jimmie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/knilob/128.jpg"
},
{
"id": "14",
"createdAt": "2020-04-19T20:44:44.216Z",
"name": "Kaelyn",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/tjrus/128.jpg"
},
{
"id": "15",
"createdAt": "2020-01-26T00:35:07.032Z",
"name": "Pierce",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/heykenneth/128.jpg"
},
{
"id": "16",
"createdAt": "2020-07-01T10:41:13.239Z",
"name": "Marlon",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/primozcigler/128.jpg"
},
{
"id": "17",
"createdAt": "2019-10-18T19:40:45.101Z",
"name": "Lionel",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/souuf/128.jpg"
},
{
"id": "18",
"createdAt": "2019-10-16T16:55:24.859Z",
"name": "Alexa",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/arashmanteghi/128.jpg"
},
{
"id": "19",
"createdAt": "2020-02-26T02:40:22.821Z",
"name": "Jacinthe",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/estebanuribe/128.jpg"
},
{
"id": "20",
"createdAt": "2020-03-10T22:58:35.109Z",
"name": "Isaias",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/michzen/128.jpg"
},
{
"id": "21",
"createdAt": "2020-05-16T10:05:17.026Z",
"name": "Nathaniel",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/kimcool/128.jpg"
},
{
"id": "22",
"createdAt": "2020-03-24T09:40:52.057Z",
"name": "Lia",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcomano_/128.jpg"
},
{
"id": "23",
"createdAt": "2020-03-21T11:58:15.653Z",
"name": "Linda",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/carlyson/128.jpg"
},
{
"id": "24",
"createdAt": "2019-09-07T21:25:44.474Z",
"name": "Luella",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/alxleroydeval/128.jpg"
},
{
"id": "25",
"createdAt": "2020-07-02T18:32:51.364Z",
"name": "Patricia",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/nicolai_larsen/128.jpg"
},
{
"id": "26",
"createdAt": "2020-03-13T15:11:31.991Z",
"name": "Sabina",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/carlosgavina/128.jpg"
},
{
"id": "27",
"createdAt": "2020-02-07T00:45:41.879Z",
"name": "Junior",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/dreizle/128.jpg"
},
{
"id": "28",
"createdAt": "2020-03-19T09:16:47.501Z",
"name": "Adrian",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/fluidbrush/128.jpg"
},
{
"id": "29",
"createdAt": "2019-12-26T19:06:45.333Z",
"name": "Ashly",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/carbontwelve/128.jpg"
},
{
"id": "30",
"createdAt": "2020-07-19T02:04:59.263Z",
"name": "Guy",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/imcoding/128.jpg"
},
{
"id": "31",
"createdAt": "2019-10-05T12:35:07.905Z",
"name": "Ila",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/danmartin70/128.jpg"
},
{
"id": "32",
"createdAt": "2020-03-08T02:21:16.762Z",
"name": "Jamaal",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/sethlouey/128.jpg"
},
{
"id": "33",
"createdAt": "2020-02-13T20:54:15.886Z",
"name": "Jamie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/ateneupopular/128.jpg"
},
{
"id": "34",
"createdAt": "2020-08-28T13:32:31.583Z",
"name": "Lisette",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/irae/128.jpg"
},
{
"id": "35",
"createdAt": "2020-06-13T07:41:22.899Z",
"name": "Salvatore",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/jacobbennett/128.jpg"
},
{
"id": "36",
"createdAt": "2020-08-09T17:55:22.495Z",
"name": "Jacquelyn",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/oscarowusu/128.jpg"
},
{
"id": "37",
"createdAt": "2020-04-28T00:46:20.282Z",
"name": "Danika",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/johnsmithagency/128.jpg"
},
{
"id": "38",
"createdAt": "2020-07-07T01:53:41.574Z",
"name": "Aidan",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcobarbosa/128.jpg"
},
{
"id": "39",
"createdAt": "2019-10-08T01:24:52.658Z",
"name": "Major",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/dahparra/128.jpg"
},
{
"id": "40",
"createdAt": "2020-08-25T20:36:31.190Z",
"name": "Abigale",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/wearesavas/128.jpg"
},
{
"id": "41",
"createdAt": "2020-06-24T01:28:21.203Z",
"name": "Donnell",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/ratbus/128.jpg"
},
{
"id": "42",
"createdAt": "2019-12-27T07:26:46.736Z",
"name": "Carlo",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/reabo101/128.jpg"
},
{
"id": "43",
"createdAt": "2020-02-26T08:08:21.773Z",
"name": "Maverick",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/jlsolerdeltoro/128.jpg"
},
{
"id": "44",
"createdAt": "2020-03-04T21:14:49.749Z",
"name": "Mathilde",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/_vojto/128.jpg"
},
{
"id": "45",
"createdAt": "2019-11-09T13:36:32.263Z",
"name": "Myrl",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/xamorep/128.jpg"
},
{
"id": "46",
"createdAt": "2020-02-29T09:42:44.029Z",
"name": "Chesley",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/felipeapiress/128.jpg"
},
{
"id": "47",
"createdAt": "2020-05-06T08:45:14.434Z",
"name": "Jennie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/r_garcia/128.jpg"
},
{
"id": "48",
"createdAt": "2020-06-07T12:03:52.636Z",
"name": "Cielo",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/christianoliff/128.jpg"
},
{
"id": "49",
"createdAt": "2020-06-21T18:35:43.913Z",
"name": "Pete",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/jonathansimmons/128.jpg"
},
{
"id": "50",
"createdAt": "2020-07-18T16:27:52.790Z",
"name": "Rosario",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/ariffsetiawan/128.jpg"
},
{
"id": "51",
"createdAt": "2019-09-25T01:47:59.657Z",
"name": "Vena",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/privetwagner/128.jpg"
},
{
"id": "52",
"createdAt": "2020-01-21T08:02:30.441Z",
"name": "Moises",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/akmur/128.jpg"
},
{
"id": "53",
"createdAt": "2020-02-15T09:17:42.770Z",
"name": "Geovany",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/johnriordan/128.jpg"
},
{
"id": "54",
"createdAt": "2019-11-28T11:40:27.049Z",
"name": "Alfonso",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/notbadart/128.jpg"
},
{
"id": "55",
"createdAt": "2019-11-09T14:26:13.933Z",
"name": "Dino",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/idiot/128.jpg"
},
{
"id": "56",
"createdAt": "2020-03-13T09:51:14.844Z",
"name": "Leif",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/thiagovernetti/128.jpg"
},
{
"id": "57",
"createdAt": "2019-09-26T00:47:12.584Z",
"name": "Tamia",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/creartinc/128.jpg"
},
{
"id": "58",
"createdAt": "2020-08-10T06:17:19.190Z",
"name": "Lonie",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/beshur/128.jpg"
},
{
"id": "59",
"createdAt": "2019-11-29T13:16:47.726Z",
"name": "Stanton",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/lawlbwoy/128.jpg"
},
{
"id": "60",
"createdAt": "2020-02-22T16:40:25.510Z",
"name": "Imogene",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/fjaguero/128.jpg"
},
{
"id": "61",
"createdAt": "2020-01-13T23:05:27.508Z",
"name": "Mireya",
"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/johndezember/128.jpg"
}
]
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

print(rssFeed)
