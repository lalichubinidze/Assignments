import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releasedateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!

    var movie: Movie.MovieData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

    }
    func setup() {
        let imageBaseUrl = "https://image.tmdb.org/t/p/w500/"
        let url = imageBaseUrl + (movie?.poster_path ?? "")
        posterImg.loadImage(by: url)
        titleLbl.text = movie?.name
        releasedateLbl.text = "(\(String(describing: movie?.first_air_date ?? "")))"
        countryLbl.text = movie?.origin_country[0]
        overviewLbl.text = movie?.overview

    }



}
