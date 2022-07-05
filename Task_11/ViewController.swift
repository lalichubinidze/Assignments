import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var thirdNumber: UILabel!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumber.text = "\(Int.random(in: 0...100))"
        secondNumber.text! = "\(Int.random(in: 0...100))"
        thirdNumber.text! = "\(Int.random(in: 0...100))"
    }

    //MARK: - Actions

    @IBAction func randomNumber(_ sender: UISlider) {
        let x = Int(rangeSlider.minimumValue)
        let y = Int(rangeSlider.value)
        firstNumber.text! = "\(Int.random(in: x...y))"
        secondNumber.text! = "\(Int.random(in: x...y))"
        thirdNumber.text! = "\(Int.random(in: x...y))"
    }

    @IBAction func count(_ sender: UIButton) {
        let x = Int(firstNumber.text!)
        let y = Int(secondNumber.text!)
        let z = Int(thirdNumber.text!)
        let array = [x!, y!, z!]
        let text = textField.text?.lowercased()
        switch text {
        case "maximum" :
            result.text = "Maximum number is   \(array.max(by: <)!)"
        case "average" :
            let average = Double(array.reduce(0) { partialResult, num in
                partialResult + num
            } / array.count)
            result.text = "Average is \(average)"
        case "sum" :
            let sum = array.reduce(0) { partialResult, num in
                partialResult + num
            }
            result.text = " Sum is \(sum)"
        default:
            result.text = """
                ☝️ Enter the text correctly!
                Please enter:  'maximum' ,
                'average' or 'sum'
                """
        }
    }
}
