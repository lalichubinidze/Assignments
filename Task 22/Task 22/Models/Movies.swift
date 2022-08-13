import Foundation


struct Movie: Codable {
    let results: [MovieData]
    
    struct MovieData: Codable {
        let poster_path: String?
        let id: Int
        let vote_average: Double
        let overview: String
        let origin_country: [String]
        let first_air_date: String
        let vote_count: Int
        let name: String
        let original_name: String
    }
}

