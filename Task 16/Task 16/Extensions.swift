import UIKit

extension ViewController {
    func configureCollectionView() {
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.registerNib(class: GenreCell.self)
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 50
        customFlowLayout.scrollDirection = .horizontal
        genreCollectionView.collectionViewLayout = customFlowLayout
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 50)
    }
}

extension UICollectionViewCell {

    static var identifier: String { String(describing: self) }
    static var nibFile: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.nibFile, forCellWithReuseIdentifier: T.identifier)
    }
}

extension Detail {
    func configureCollectionView() {
        sameMovieCollectionView.delegate = self
        sameMovieCollectionView.dataSource = self
        sameMovieCollectionView.registerNib(class: SameGenreCell.self)
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 50
        customFlowLayout.scrollDirection = .horizontal
        sameMovieCollectionView.collectionViewLayout = customFlowLayout
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 50)
    }
}
