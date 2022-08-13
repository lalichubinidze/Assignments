import Foundation
final class APICaller {
    static let shared = APICaller()


    func getMovieData(completion: @escaping(Result<Movie, Error>)-> Void){
        let urlString = "https://api.themoviedb.org/3/tv/top_rated?api_key=d38562c8b0c23c664db82d1feb8420ec&language=en-US&page=1"
        let url = URL(string: urlString)
        guard let apiURL = url else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: apiURL)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode(Movie.self, from: data)
                completion(.success(result))
            }
            catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }

}
