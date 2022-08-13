import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " Top Rated Movies"
        listTableView.delegate = self
        listTableView.dataSource = self
        fetchData()
    }
    private func fetchData(){
        APICaller.shared.getMovieData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.movie = model
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.listTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let currentMovie = movie?.results[indexPath.row]
        cell.nameLbl.text = currentMovie?.name
        cell.IMDB.text = ("IMDB: \(currentMovie?.vote_average)")
        let url = "\(currentMovie?.poster_path)"
        //cell.poster.load(url: URL(string: url)!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}

