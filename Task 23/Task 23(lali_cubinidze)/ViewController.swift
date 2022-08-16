import UIKit

class ViewController: UIViewController {

    var show = TvShow(results: [])
    let semaphore = DispatchSemaphore(value: 1)

    let queue = DispatchQueue(label: "firstQueue")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async {
            self.semaphore.wait()
            self.getShow { showArray in
                self.show = showArray
                self.semaphore.signal()
            }
        }

        queue.async {
            self.semaphore.wait()
            self.getsimilarFor(similar: self.show.results.randomElement()!.id) { similar in
                self.semaphore.signal()
            }
        }

        queue.async {
            self.semaphore.wait()
            self.getdetailFor(detail: self.show.results.randomElement()!.id) { detail in
                print("""
                      Name:  '\(detail.name)'
                      Episode Number:  \(detail.number_of_episodes)
                      """)
                self.semaphore.signal()
            }
        }
    }




    func getShow(completion: @escaping (TvShow)-> Void) {

        let url = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=793b50b3b4c6ef37ce18bda27b1cbf67")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let show = try JSONDecoder().decode(TvShow.self, from: data)
                completion(show)
            } catch {
                print(error)
            }
        }.resume()
    }

    
    func getsimilarFor(similar: Int, completion: @escaping (TvShow?)-> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(similar)/similar?api_key=793b50b3b4c6ef37ce18bda27b1cbf67")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let similar = try JSONDecoder().decode(TvShow.self, from: data)
                completion(similar)
            } catch {
                print(error)
            }
        }.resume()
    }

    func getdetailFor(detail: Int, completion: @escaping (ShowDetails)-> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(detail)?api_key=793b50b3b4c6ef37ce18bda27b1cbf67&language=en-US&append_to_response=all")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let detail = try JSONDecoder().decode(ShowDetails.self, from: data)
                completion(detail)
            } catch {
                print(error)
            }
        }.resume()
    }
}

