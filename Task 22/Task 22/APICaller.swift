import Foundation
public enum APICollerError: Error {
    case failure
}

final class APICaller {
    static let shared = APICaller()


    func getMovieData<T: Codable>(with url: String, completion: @escaping (T?, APICollerError?) -> Void) {
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, respons, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
            }
            catch{
                print(error.localizedDescription)
                completion(nil, .failure)
            }
        }
        task.resume()
    }

}
