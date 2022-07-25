import UIKit

class ViewController: UIViewController, MovieCellDelegate {
    func changeSection(cell: MovieCell) {

        if let indexPath = moviesTableView.indexPath(for: cell) {
            if indexPath.section == 0 {
                let movie = seenMovie[indexPath.row]
                seenMovie.remove(at: indexPath.row)
                notSeenMovie.append(movie)
                moviesTableView.reloadData()
            }else {
                let movie = notSeenMovie[indexPath.row]
                notSeenMovie.remove(at: indexPath.row)
                seenMovie.append(movie)
                moviesTableView.reloadData()
            }
        }
    }


    @IBOutlet weak var moviesTableView: UITableView!

    var seenMovie = Movie.movies.filter{$0.seen == true}
    var notSeenMovie = Movie.movies.filter {$0.seen == false}

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.titleLbl.text = seenMovie[indexPath.row].title
            cell.imbdLbl.text = "\(seenMovie[indexPath.row].imdb)"
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.titleLbl.text = notSeenMovie[indexPath.row].title
            cell.imbdLbl.text = "\(notSeenMovie[indexPath.row].imdb)"
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return seenMovie.count
        } else {
            return notSeenMovie.count
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeader = UILabel()
        if section == 0 {
            viewForHeader.text = "Watched movies list"
            viewForHeader.backgroundColor = .green

        }else{
            viewForHeader.text = "Unseen movies list"
            viewForHeader.backgroundColor = .systemPink
        }
        return viewForHeader
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as? Detail
        guard let vc = vc else {return}
        self.navigationController?.present(vc, animated: true)

        if indexPath.section == 0 {
            vc.titleLabel.text = seenMovie[indexPath.row].title
            vc.releaseDateLbl.text = seenMovie[indexPath.row].releaseDate
            vc.imdbLbl.text = "\(seenMovie[indexPath.row].imdb)"
            vc.mainActorLbl.text = seenMovie[indexPath.row].mainActor
            vc.descriptionLbl.text = seenMovie[indexPath.row].description
        } else {
            vc.titleLabel.text = notSeenMovie[indexPath.row].title
            vc.releaseDateLbl.text = notSeenMovie[indexPath.row].releaseDate
            vc.imdbLbl.text = "\(notSeenMovie[indexPath.row].imdb)"
            vc.mainActorLbl.text = notSeenMovie[indexPath.row].mainActor
            vc.descriptionLbl.text = notSeenMovie[indexPath.row].description

        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }



}

