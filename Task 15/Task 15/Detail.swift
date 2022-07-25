import UIKit

class Detail: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var mainActorLbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!

    override func viewDidLoad() {
    }

    @IBAction func backBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        guard let vc = vc else {return}
        dismiss(animated: true)
    }

    @IBAction func favouriteBtn(_ sender: Any) {
        btn.backgroundColor = .green
        let alertController = UIAlertController(title: "Favourite  ⭐", message: "The movie has been added to the list of favorites ", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)

    }
}
