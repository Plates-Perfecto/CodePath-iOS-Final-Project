//
//  DessertDetailsViewController.swift
//  Plates Perfecto
//
//  Created by Tufayel Ahmed on 5/13/21.
//

import UIKit
import AlamofireImage

class DessertDetailsViewController: UIViewController {

    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var dessert: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var instructions = ""
        var ingredientsDup = [String]()
        // Do any additional setup after loading the view.
        titleLabel.text = dessert["title"] as? String
        titleLabel.sizeToFit()
                
        let imagePath = dessert["image"] as! String
                
        let imageURL = URL(string: imagePath)
                
        posterView?.af_setImage(withURL: imageURL!)
        if let step = dessert["analyzedInstructions"] as? [[String:Any]],
            let steps = step.first
            {
            if let insideStep = steps["steps"] as? [[String:Any]]
            {
                for insideinsideStep in insideStep
                {
                    if let finalSteps = insideinsideStep["step"] as? String
                    {
                        instructions = instructions + finalSteps
                    }
                    if let ingredientsOutter = insideinsideStep["ingredients"] as? [[String:Any]]
                    {
                        for ingredients in ingredientsOutter
                        {
                            let temp = ingredients["name"]
                            ingredientsDup.append(temp as! String)
                        }
                    }
                }
            }
        }
        var uniqueIngredients = Array(Set(ingredientsDup))
        uniqueIngredients = uniqueIngredients.sorted()
        var listIngredients = ""
        for items in uniqueIngredients
        {
            listIngredients = listIngredients + items  + "\n"
        }
        ingredientsLabel.text = listIngredients as? String
        instructionLabel.text = instructions as? String
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
