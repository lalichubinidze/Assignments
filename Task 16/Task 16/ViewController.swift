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
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    var seenMovie = Movie.movies.filter{$0.seen == true}
    var notSeenMovie = Movie.movies.filter {$0.seen == false}
    var seencomedyMovie = Movie.movies.filter {$0.genre == .comedy && $0.seen == true }
    var notSeencomedyMovie = Movie.movies.filter {$0.genre == .comedy && $0.seen == false }
    var seenactionMovie = Movie.movies.filter {$0.genre == .action && $0.seen == true }
    var notSeenactionMovie = Movie.movies.filter {$0.genre == .action && $0.seen == false }
    var seendramaMovie = Movie.movies.filter {$0.genre == .drama && $0.seen == true }
    var notSeendramaMovie = Movie.movies.filter {$0.genre == .drama && $0.seen == false }

    var genre = ["All", "Comedy", "Action", "Drama"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
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
            cell.imbdLbl.text = "IMDB: \(seenMovie[indexPath.row].imdb)"
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.titleLbl.text = notSeenMovie[indexPath.row].title
            cell.imbdLbl.text = "IMDB: \(notSeenMovie[indexPath.row].imdb)"
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
            viewForHeader.backgroundColor = .systemGreen

        }else{
            viewForHeader.text = "Unseen movies list"
            viewForHeader.backgroundColor = .systemCyan
        }
        return viewForHeader
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Detail") as? Detail
        guard let vc = vc else {return}
        self.navigationController?.present(vc, animated: true)
        if indexPath.section == 0 {
            vc.titleLabel.text = (seenMovie[indexPath.row].title)
            vc.genreLbl.text = "Genre: \(seenMovie[indexPath.row].genre)"
            vc.releaseDateLbl.text = "ReleaseDate: \(seenMovie[indexPath.row].releaseDate)"
            vc.imdbLbl.text = "IMDB: \(seenMovie[indexPath.row].imdb)"
            vc.mainActorLbl.text = "MainActor: \(seenMovie[indexPath.row].mainActor)"
            vc.descriptionLbl.text = "Description:  \(seenMovie[indexPath.row].description)"
            if seenMovie[indexPath.row].genre == .comedy  {
                vc.array.append(contentsOf: seencomedyMovie)
                vc.array.append(contentsOf: notSeencomedyMovie)
            } else if seenMovie[indexPath.row].genre == .action {
                vc.array.append(contentsOf: seenactionMovie)
                vc.array.append(contentsOf: notSeenactionMovie)
            }else {
                vc.array.append(contentsOf: seendramaMovie)
                vc.array.append(contentsOf: notSeendramaMovie)
            }
        } else {
            vc.titleLabel.text = (notSeenMovie[indexPath.row].title)
            vc.genreLbl.text = "Genre: \(seenMovie[indexPath.row].genre)"
            vc.releaseDateLbl.text = "ReleaseDate: \(notSeenMovie[indexPath.row].releaseDate)"
            vc.imdbLbl.text = "IMDB: \(notSeenMovie[indexPath.row].imdb)"
            vc.mainActorLbl.text = "MainActor: \(notSeenMovie[indexPath.row].mainActor)"
            vc.descriptionLbl.text = "Description:  \(notSeenMovie[indexPath.row].description)"
            if notSeenMovie[indexPath.row].genre == .comedy  {
                vc.array.append(contentsOf: seencomedyMovie)
                vc.array.append(contentsOf: notSeencomedyMovie)
            } else if notSeenMovie[indexPath.row].genre == .action {
                vc.array.append(contentsOf: seenactionMovie)
                vc.array.append(contentsOf: notSeenactionMovie)
            }else {
                vc.array.append(contentsOf: seendramaMovie)
                vc.array.append(contentsOf: notSeendramaMovie)
            }
        }
    }
}


