import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.preferredDatePickerStyle = .wheels
    }

    @IBAction func calculatePrimeNumber(_ sender: Any) {
        enableButton(isEnable: false)
        DispatchQueue.global(qos: .userInitiated).async {
          for number in 0...1_000_000 {
            let isPrimeNumber = self.isPrime(number: number)
              if isPrimeNumber == true {
                  print(number)
              }
          }
          DispatchQueue.main.async {
            self.enableButton(isEnable: true)
          }
        }
    }
    func isPrime(number: Int) -> Bool {
      if number <= 1 {
        return false
      }
      if number <= 3 {
        return true
      }
      var i = 2
      while i * i <= number {
        if number % i == 0 {
          return false
        }
        i = i + 1
      }
      return true
    }

    func enableButton(isEnable: Bool) {
        button.isEnabled = isEnable
        if isEnable {
            button.setTitle("Calculate Prime Numbers", for: .normal)
        }
        else {
            button.setTitle("Calculating...", for: .normal)
        }
    }
}

