import Foundation


struct TvShow: Decodable {
    let results: [TvShowData]

    struct TvShowData: Decodable {
        let id: Int
        let vote_average: Double
        let origin_country: [String]
        let first_air_date: String
        let name: String
        let original_name: String
    }
}


struct ShowDetails: Decodable {
    let id: Int
    let name: String
    let number_of_episodes: Int
}
