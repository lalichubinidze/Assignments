import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
        cell.genreText.text = genre[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            seenMovie = Movie.movies.filter{$0.seen == true}
            notSeenMovie = Movie.movies.filter{$0.seen == false}
            moviesTableView.reloadData()
        }
        if indexPath.row == 1 {
            seenMovie.removeAll()
            seenMovie.append(contentsOf: seencomedyMovie)
            notSeenMovie.removeAll()
            notSeenMovie.append(contentsOf: notSeencomedyMovie)
            moviesTableView.reloadData()
        }
        if indexPath.row == 2 {
            seenMovie.removeAll()
            seenMovie.append(contentsOf: seenactionMovie)
            notSeenMovie.removeAll()
            notSeenMovie.append(contentsOf: notSeenactionMovie)
            moviesTableView.reloadData()
        }
        if indexPath.row == 3 {
            seenMovie.removeAll()
            seenMovie.append(contentsOf: seendramaMovie)
            notSeenMovie.removeAll()
            notSeenMovie.append(contentsOf: notSeendramaMovie)
            moviesTableView.reloadData()
        }
    }
}
