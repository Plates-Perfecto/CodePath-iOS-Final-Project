//
//  HomeGridViewController.swift
//  Plates Perfecto
//
//  Created by Matthew Cheung on 5/13/21.
//

import UIKit
import AlamofireImage

class HomeGridViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var homes = [[String:Any]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let hour = NSCalendar.current.component(.hour,from: NSDate()as Date)
        var brand = ""
        switch hour
        {
        case 6...10: brand = "breakfast"
            break
        case 11...17: brand = "snack"
            break
        case 18...21: brand = "maincourse"
            break
        default: brand = "dessert"
        }
        
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=199d83626fa74e18a66f0ccb2eee9f6b&type=\(brand)&number=30&addRecipeInformation=true&addRecipeINformation=true")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
        // This will run when the network request returns
        if let error = error {
            print(error.localizedDescription)
        } else if let data = data {
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.homes = dataDictionary["results"] as! [[String:Any]]
            self.collectionView.reloadData()
                    }
                        }
                task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeGridCell", for: indexPath) as! HomeGridCell
        let home = homes[indexPath.row]
               let imagePath = home["image"] as! String
               let imageURL = URL(string: imagePath)
               
               cell.homeView?.af_setImage(withURL: imageURL!)
        
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let home = homes[indexPath.row]
        
        let detailsViewController = segue.destination as! HomeDetailsViewController; detailsViewController.home = home
    }
    

}
