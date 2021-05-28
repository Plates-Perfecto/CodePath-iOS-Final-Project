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
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var instructions = ""
        var ingredientsDup = [String]()
        titleLabel.text = home["title"] as? String
        let posterUrl = URL(string: home["image"] as! String)
        recipeView.af_setImage(withURL: posterUrl!)
        if let step = home["analyzedInstructions"] as? [[String:Any]],
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
