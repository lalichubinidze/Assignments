import UIKit

class ViewController: UIViewController {


    private lazy var imageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "Image"))
    imageView.layer.borderWidth = 3
    imageView.layer.masksToBounds = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.layer.cornerRadius = imageView.frame.height/2
    imageView.alpha = 0.75
    imageView.layer.shadowColor = UIColor.black.cgColor
    imageView.layer.shadowRadius = 30
    imageView.layer.shadowOpacity = 0.5
    imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
    imageView.clipsToBounds = true
    view.addSubview(imageView)
    return imageView
}()

    private lazy var textLbl: UILabel = {
    let textLbl = UILabel()
    textLbl.text = "IOS App Templates"
    textLbl.textColor = .white
    textLbl.font = .systemFont(ofSize: 30)
    textLbl.textAlignment = .center
    view.addSubview(textLbl)
    return textLbl
}()

    private lazy var EmailField: UITextField = {
        let EmailField = UITextField()
        EmailField.placeholder = "Email"
        EmailField.returnKeyType = .next
        EmailField.leftViewMode = .always
        EmailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        EmailField.layer.cornerRadius = 20.0
        EmailField.backgroundColor = .secondarySystemBackground
        EmailField.layer.shadowColor = UIColor.black.cgColor
        EmailField.layer.shadowRadius = 30
        EmailField.layer.shadowOpacity = 0.5
        EmailField.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.addSubview(EmailField)
        return EmailField

    }()

    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.returnKeyType = .next
        passwordField.isSecureTextEntry = true
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        passwordField.layer.cornerRadius = 20.0
        passwordField.backgroundColor = .secondarySystemBackground
        passwordField.layer.shadowColor = UIColor.black.cgColor
        passwordField.layer.shadowRadius = 30
        passwordField.layer.shadowOpacity = 0.5
        passwordField.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.addSubview(passwordField)
        return passwordField

    }()

    private lazy var loginButton: UIButton = {
        var loginButton = UIButton()
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemGreen
        loginButton.layer.cornerRadius = 20.0
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowRadius = 30
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.addSubview(loginButton)
        return loginButton
    }()

    private lazy var accountButton: UIButton = {
        var accountButton = UIButton()
        accountButton.setTitleColor(.label, for: .normal)
        accountButton.setTitle("Don't have an account? Sign Up", for: .normal)
        view.addSubview(accountButton)
        return accountButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientColor()
        addTextLbl()
        addImageView()
        addEmailField()
        addPasswordField()
        addloginButton()
        addAccountButton()
    }

    private func gradientColor() {
        let colorTop = UIColor(red: 0.80, green: 0.67, blue: 0.85, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.26, green: 0.55, blue: 0.83, alpha: 1.00).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        view.layer.addSublayer(gradientLayer)
    }

    private func addTextLbl() {
    textLbl.translatesAutoresizingMaskIntoConstraints = false
    let leftConstraint = NSLayoutConstraint(item: textLbl,
                                            attribute: .left,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .left,
                                            multiplier: 1,
                                            constant: 30)

    let rightConstraint = NSLayoutConstraint(item: textLbl,
                                            attribute: .right,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .right,
                                            multiplier: 1,
                                            constant: -30)
    let top = NSLayoutConstraint(item: textLbl,
                                    attribute: .top,
                                    relatedBy: .equal,
                                    toItem: view,
                                    attribute: .top,
                                    multiplier: 1,
                                    constant: 100)
    let height = NSLayoutConstraint(item: textLbl,
                                    attribute: .height,
                                    relatedBy: .equal,
                                    toItem: nil,
                                    attribute: .notAnAttribute,
                                    multiplier: 1,
                                    constant: 50)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, top, height ])
}

    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = view.frame.width
        imageView.layer.cornerRadius = screenWidth/4

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        let width = NSLayoutConstraint(item: imageView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: screenWidth/2)

        let aspectRatio = NSLayoutConstraint(item: imageView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: imageView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0)
        let top = NSLayoutConstraint(item: imageView,
                                        attribute: .top,
                                        relatedBy: .equal,
                                        toItem: textLbl,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: 120)
        NSLayoutConstraint.activate([width, aspectRatio, top ])
    }

    private func addEmailField() {
        EmailField.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: EmailField,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 30)

        let rightConstraint = NSLayoutConstraint(item: EmailField,
                                                attribute: .right,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .right,
                                                multiplier: 1,
                                                constant: -30)

        let height = NSLayoutConstraint(item: EmailField,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50)

        let bottom = NSLayoutConstraint(item: EmailField,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: passwordField,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: -20)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, height, bottom ])
    }

    private func addPasswordField() {
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: passwordField,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 30)

        let rightConstraint = NSLayoutConstraint(item: passwordField,
                                                attribute: .right,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .right,
                                                multiplier: 1,
                                                constant: -30)

        let height = NSLayoutConstraint(item: passwordField,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50)

        let bottom = NSLayoutConstraint(item: passwordField,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: loginButton,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: -50)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, height, bottom ])
    }

    private func addloginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: loginButton,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 70)

        let rightConstraint = NSLayoutConstraint(item: loginButton,
                                                attribute: .right,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .right,
                                                multiplier: 1,
                                                constant: -70)

        let height = NSLayoutConstraint(item: loginButton,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 50)

        let bottom = NSLayoutConstraint(item: loginButton,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: accountButton,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: -100)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, height, bottom ])
    }

    private func addAccountButton() {
        accountButton.translatesAutoresizingMaskIntoConstraints = false

        let leftConstraint = NSLayoutConstraint(item: accountButton,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 20)

        let rightConstraint = NSLayoutConstraint(item: accountButton,
                                                attribute: .right,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .right,
                                                multiplier: 1,
                                                constant: -20)

        let height = NSLayoutConstraint(item: accountButton,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                        constant: 30)

        let bottom = NSLayoutConstraint(item: accountButton,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -40)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, height, bottom ])
    }

}

