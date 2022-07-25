import UIKit
protocol MovieCellDelegate {
    func changeSection(cell: MovieCell)
}

class MovieCell: UITableViewCell {

    @IBOutlet weak var imbdLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var markBtn: UIButton!

    var delegate: MovieCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func changeSectionBtn(_ sender: Any) {
        delegate.changeSection(cell: self)
    }

}
