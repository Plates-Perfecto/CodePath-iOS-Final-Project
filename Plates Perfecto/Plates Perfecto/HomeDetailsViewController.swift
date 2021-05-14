//
//  HomeDetailsViewController.swift
//  Plates Perfecto
//
//  Created by Matthew Cheung on 5/13/21.
//

import UIKit
import Alamofire

class HomeDetailsViewController: UIViewController {
    var home: [String:Any]!

    @IBOutlet weak var recipeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var servingLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = home["title"] as? String
        servingLabel.text = home["servings"] as? String
        authorLabel.text = home["author"] as? String
        let posterUrl = URL(string: home["image"] as! String)
        recipeView.af_setImage(withURL: posterUrl!)
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
