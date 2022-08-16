import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var releasedateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!

    var movie: Movie.MovieData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()

    }
    func config() {
        let url = Urls.imageBaseUrl.rawValue + (movie?.poster_path ?? "")
        self.posterImg.load(by: url)
        titleLbl.text = movie?.name
        releasedateLbl.text = "(Release date: \(String(describing: movie?.first_air_date ?? "")))"
        overviewLbl.text = movie?.overview
    }
}
