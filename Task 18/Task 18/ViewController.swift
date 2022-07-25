import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redCircle: UIView!
    @IBOutlet weak var blueCircle: UIView!
    @IBOutlet weak var purpleTringle: UIView!
    @IBOutlet weak var blackTringle: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTriangle(name: purpleTringle)
        setUpTriangle(name: blackTringle)
        redCircle.layer.cornerRadius = 50
        blueCircle.layer.cornerRadius = 50
        redCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        redCircle.isUserInteractionEnabled = true

        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name("colorChange"), object: nil)
    }
    @objc func changeBackgroundColor() {
        view.backgroundColor = .orange
    }

    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            print("began")
        }else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            redCircle.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended{
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.redCircle.transform = .identity
            })
        }
    }
    // MARK: - Actions

    @IBAction func redCircleAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondViewCotroller") as? secondViewCotroller
        guard let vc = vc else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

    @IBAction func blueCircleAction(_ sender: Any) {
        nextPage()

    }

    @IBAction func purpleAction(_ sender: Any) {
        nextPage()
    }

    @IBAction func blackAction(_ sender: Any) {
        nextPage()
    }

    func nextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondViewCotroller") as? secondViewCotroller
        guard let vc = vc else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func purpleTringleTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
    }

    @objc func tapGesture(_ gesture: UITapGestureRecognizer){
        nextPage()
    }

    func setUpTriangle(name: UIView){
     let heightWidth = name.frame.size.width
        let path = CGMutablePath()

        path.move(to: CGPoint(x: 0, y: heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth, y:heightWidth))
        path.addLine(to: CGPoint(x:0, y:heightWidth))

        let shape = CAShapeLayer()
        shape.path = path

    if name.tag ==  1 {
     shape.fillColor = UIColor.purple.cgColor
    }
    else {
     shape.fillColor = UIColor.black.cgColor
    }
    name.isUserInteractionEnabled = true

        name.layer.insertSublayer(shape, at: 1)
    }
}








