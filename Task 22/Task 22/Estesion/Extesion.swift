import Foundation
import UIKit

extension UIImageView {
    func loadImage(by urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self.image = image
            }
        }.resume()
    }
}
