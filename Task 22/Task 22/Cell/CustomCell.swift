import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var IMDB: UILabel!
    @IBOutlet weak var poster: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func dataconfig(with model: Movie.MovieData) {
        self.nameLbl.text = model.name
        self.IMDB.text = "\(model.vote_average)"
        let url = Urls.imageBaseUrl.rawValue + (model.poster_path ?? "")
        self.poster.load(by: url)
    }

}
