//
//  ViewController.swift
//  Movie_APP
//
//  Created by Donia Elshenawy on 09/05/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    

    @IBOutlet weak var movieCollectionView: UICollectionView!
    var movieArray : [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { [self] data, response, error in
//            print(data)
//            print ("saved data!")
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>{
           // print(json[0])
                for mov in json{
                    var objectArrayMovie = Movie()
                    objectArrayMovie.title = mov["title"] as? String
                    objectArrayMovie.image = mov["image"] as? String
                    objectArrayMovie.rating = mov["rating"] as? Double
                    objectArrayMovie.releaseYear = mov["releaseYear"] as? Int
                    self.movieArray.append(objectArrayMovie)
                }
//                for i in movieArray{
//                    print(i.title)
//                }
            }
            DispatchQueue.main.sync {
                self.movieCollectionView.reloadData()
            }
        }
        task.resume()
    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = movieArray[indexPath.row].title
        let urlImage = URL(string: movieArray[indexPath.row].image!)
        cell.image.sd_setImage(with: urlImage, completed: nil)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsMovieViewController") as! DetailsMovieViewController
        vc.comingMsg = movieArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

