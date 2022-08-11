import Foundation

struct States: Codable {
    let name: String
    let capital: String?
    let region: String
    let population: Int
    let flags: Flags
    let flag: String
}

struct Flags: Codable {
    let svg: String
    let png: String
}
