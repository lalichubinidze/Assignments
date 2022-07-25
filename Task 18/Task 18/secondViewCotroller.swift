import UIKit

class secondViewCotroller: UIViewController {


    @IBOutlet weak var viewForGesture: UIImageView!

    private var pressStartTime: TimeInterval = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.isUserInteractionEnabled = true
        longPress()
        addSwipe()
        addPinch() 
    }

    // MARK: - Functions

    func longPress() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(makeAction))
        viewForGesture.addGestureRecognizer(longPressGesture)
    }

    func addSwipe() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        rightSwipeGesture.direction = .right

        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        leftSwipeGesture.direction = .left

        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        upSwipeGesture.direction = .up

        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        downSwipeGesture.direction = .down

        viewForGesture.addGestureRecognizer(rightSwipeGesture)
        viewForGesture.addGestureRecognizer(leftSwipeGesture)
        viewForGesture.addGestureRecognizer(upSwipeGesture)
        viewForGesture.addGestureRecognizer(downSwipeGesture)
    }

    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        viewForGesture.addGestureRecognizer(pinchGesture)
    }

    // MARK: - @objc Functions

    @objc func makeAction(duration: UILongPressGestureRecognizer) {
        if self.navigationController == nil && duration.minimumPressDuration < 1 {
            self.dismiss(animated: true )
        } else {
            UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
                self.viewForGesture.alpha = 0
            }, completion: nil)
        }
    }


    @objc func longPressed (_ sender : UILongPressGestureRecognizer) {
     if sender.state == .began {
         pressStartTime = NSDate.timeIntervalSinceReferenceDate
     }
     else if sender.state == .ended {
         let duration = NSDate.timeIntervalSinceReferenceDate - pressStartTime
         if duration < 1 {
             navigationController?.popViewController(animated: true)
         }else {
             UIView.animate(withDuration: 0.25) {
                 self.viewForGesture.isHidden = true
                }
         }
     }
    }

    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        let guide = view.safeAreaLayoutGuide
        let width = guide.layoutFrame.width
        print(gesture.scale)
        gesture.scale = 1
        if viewForGesture.frame.width > width {
            self.viewForGesture.transform = CGAffineTransform.identity
        }
        NotificationCenter.default.post(name: Notification.Name("colorChange"), object: nil, userInfo: nil)
    }

    @objc func swipedOnView(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            viewForGesture.layer.position.x -= 50
        case .right:
            viewForGesture.layer.position.x += 50
        case .up:
            viewForGesture.layer.position.y -= 50
        case .down:
            viewForGesture.layer.position.y += 50
        default:
           print("other")
        }
    }
}
