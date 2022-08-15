import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!

    var movie = Movie(results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " Top Rated Movies"
        listTableView.delegate = self
        listTableView.dataSource = self
        fetchData()
    }
    private func fetchData(){
        let url = "\(Urls.baseUrl.rawValue)\(Urls.apiKay.rawValue)\(Urls.endUrl.rawValue)"
        APICaller.shared.getMovieData(with: url) { (movie: Movie?, error )  in
            guard let movie = movie, error == nil  else {
                print(error?.localizedDescription)
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.movie = movie
                self?.listTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let currentMovie = movie.results[indexPath.row]
        cell.dataconfig(with: currentMovie)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectMovie = movie.results[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.movie = selectMovie
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

