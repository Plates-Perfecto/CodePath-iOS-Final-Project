//
//  BreakfastDetailsViewController.swift
//  Plates Perfecto
//
//  Created by Tufayel Ahmed on 5/12/21.
//

import UIKit
import AlamofireImage

class BreakfastDetailsViewController: UIViewController {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var breakfast: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = breakfast["title"] as? String
        titleLabel.sizeToFit()
        
        let imagePath = breakfast["image"] as! String
        
        let imageURL = URL(string: imagePath)
        
        posterView?.af_setImage(withURL: imageURL!)
        
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
