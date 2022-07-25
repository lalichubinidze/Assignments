import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        present(vc, animated: true)
    }



}

