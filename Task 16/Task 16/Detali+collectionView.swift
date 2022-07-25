import UIKit

extension Detail: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SameGenreCell", for: indexPath) as! SameGenreCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        cell.sameMovieTitleLbl.text =  array[indexPath.row].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        titleLabel.text = array[indexPath.row].title
        genreLbl.text = "Genre: \(array[indexPath.row].genre)"
        releaseDateLbl.text = "ReleaseDate: \(array[indexPath.row].releaseDate)"
        imdbLbl.text = "IMDB: \(array[indexPath.row].imdb)"
        mainActorLbl.text = "Main Actor: \(array[indexPath.row].mainActor)"
        titleLabel.reloadInputViews()
    }
}
