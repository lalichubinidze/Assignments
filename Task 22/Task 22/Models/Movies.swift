import Foundation


struct Movie: Codable {
    let results: [MovieData]
}
struct MovieData: Codable {
    let poster_path: String?
    let id: Int
    let vote_average: Double
    let overview: String
    let vote_count: Int
    let name: String
}
