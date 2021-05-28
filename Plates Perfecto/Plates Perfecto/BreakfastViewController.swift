//
//  BreakfastViewController.swift
//  Plates Perfecto
//
//  Created by Tufayel Ahmed on 5/12/21.
//

import UIKit
import AlamofireImage

class BreakfastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var breakfasts = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=cb3af8527ed1481abc0d8c647770e397&type=breakfast&number=30&addRecipeInformation=true&addRecipeNutrition=true")!
                let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
                let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                let task = session.dataTask(with: request) { (data, response, error) in
                   // This will run when the network request returns
                   if let error = error {
                      print(error.localizedDescription)
                   } else if let data = data {
                      let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    self.breakfasts = dataDictionary["results"] as! [[String:Any]]
                    
                    
                    //print(dataDictionary)
                    self.tableView.reloadData()
                    
                    
                   }
                }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breakfasts.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreakfastCell") as! BreakfastCell
        
        let breakfast = breakfasts[indexPath.row]
        let title = breakfast["title"] as! String
        
        let imagePath = breakfast["image"] as! String
        
        let imageURL = URL(string: imagePath)
        
        cell.titleLabel.text = title
        cell.imageView?.af_setImage(withURL: imageURL!)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)!
                let breakfast = breakfasts[indexPath.row]
                
                // Pass the selected movie to the details view controller
                let detailsViewController = segue.destination as! BreakfastDetailsViewController
                detailsViewController.breakfast = breakfast
                
                tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
