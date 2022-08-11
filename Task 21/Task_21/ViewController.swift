import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    

    var states = [States]()

    var filterState: [States]!

    override func viewDidLoad() {
        super.viewDidLoad()
        filterState = states
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        getStates()

    }

    func getStates() {
        let urlSession = URLSession.shared
        let urlsString = "https://restcountries.com/v2/all"
        let url = URL(string: "https://restcountries.com/v2/all")!

        urlSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            let data = data
            let decoder = JSONDecoder()
            let object = try! decoder.decode([States].self, from: data!)
            self.states = object

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterState.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let currentState = filterState[indexPath.row]
        cell.textLabel?.text = "\(currentState.name)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.present(vc, animated: true)
        let currentState = filterState[indexPath.row]
        vc.stateLbl.text = "\(currentState.name)"
        vc.capitalLabel.text = "Capital:  \(currentState.capital!)"
        vc.population.text = "Population:  \(currentState.population)"
        vc.regionLbl.text = "Region:  \(currentState.region)"
        let url = currentState.flags.png
        vc.flagImage.load(url: URL(string: url)!)
    }


}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterState = []
        if searchText == "" {
            filterState = states
        }
        for country in states {
            if country.name.uppercased().starts(with: searchText.uppercased()){
                filterState.append(country)
            }
        }
        self.tableView.reloadData()
    }
}

