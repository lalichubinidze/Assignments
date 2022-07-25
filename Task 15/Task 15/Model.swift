import Foundation

struct Movie {

    static let movies = [
        Movie(title: "title1", releaseDate: "2000", imdb: 6.7, mainActor: "actor1", seen: false, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title2", releaseDate: "2002", imdb: 8.7, mainActor: "actor2", seen: false, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title3", releaseDate: "2003", imdb: 4.2, mainActor: "actor3", seen: false, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title4", releaseDate: "2004", imdb: 6.5, mainActor: "actor4", seen: false, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title5", releaseDate: "2005", imdb: 5.1, mainActor: "actor5", seen: true, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title6", releaseDate: "2006", imdb: 4.7, mainActor: "actor6", seen: true, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title7", releaseDate: "2007", imdb: 6.4, mainActor: "actor7", seen: true, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title8", releaseDate: "2008", imdb: 7.9, mainActor: "actor8", seen: true, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title9", releaseDate: "2009", imdb: 6.8, mainActor: "actor9", seen: true, isFavourite: false, description: "\(descriptionString)"),
        Movie(title: "title10", releaseDate: "2010", imdb: 6.7, mainActor: "actor10", seen: true, isFavourite: false, description: "\(descriptionString)")
        
    ]

    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    let seen: Bool
    let isFavourite: Bool
    let description: String
}
public var descriptionString = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"

