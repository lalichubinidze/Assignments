import UIKit

class StartView: UIViewController {
    @IBOutlet weak var startBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController

        guard let vc = vc else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
