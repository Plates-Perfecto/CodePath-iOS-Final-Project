# Plates Perfecto

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

Plates Perfecto is your very own recipe book that will guide you step by step on how to create the perfect dish depending on how you're feeling. Are you in the mood for some lunch or dessert? No problem, we have all of these covered. Plates Perfecto has everything you need to stop ordering takeouts and make these delicious dishes at your very own house. You can become the next Gordon Ramsey!!! Just use Plates Perfecto! 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Food
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Analyzes the time and provides food recommendations based on the time. The user has the option to view it or look at all the other recipes for breakfast, lunch, dinner and dessert.
- **Market:** Any individual can used this app and there will be no age restriction.
- **Habit:** This app could be used often because many people make food at home and might use this to create new dishes.
- **Scope:** We would recommend different recipes based on the time of the day, but overall it's up to the user's preference on what they want to create. Large potential for use with Tasty.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Recipe Recommendation
* Recipe Catalog 
* Recipe Details
* Settings

**Optional Nice-to-have Stories**

* User log in 
* User register
* Melody align with recipe
* Snap-shot of your food 

### 2. Screen Archetypes

* Home Page
   * Time and Day
   * Recipe Recommendation
* Setting Screen
   * Let people change app notifications, time and day
* Breakfast Screen
   * Lists all the breakfast recipes
* Lunch Screen
   * Lists all the lunch recipes
* Dinner Screen
   * Lists all the dinner recipes
* Desert Screen
  * Lists all the dessert recipes
* Detail View
  * Details of each recipe when click
  
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Settings
* Breakfast 
* Lunch
* Dinner
* Dessert
* Detail

**Flow Navigation** (Screen to Screen)

* Home -> Can select suggested recommendations and check their details
* Breakfast -> Lists all the breakfast recipies -> Choose a breakfast to see more details about it
* Lunch -> Lists all the lunch recipes -> Choose a lunch to see more details about it  
* Dinner -> Lists all the dinner recipes -> Choose a dinner to see more details about it  
* Desert -> Lists all the desert recipes -> Choose a desert to see more details about it  
* Settings -> Toggle settings
* Detail -> Detail of the recipe

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/QJG09ZZ.jpg" width="750" alt="Wire Frame"/>

### [BONUS] Digital Wireframes & Mockups
<div style="flex-direction: row">
<img src="https://i.imgur.com/rLiyM7R.png" width="250" alt="Home"/>
<img src="https://i.imgur.com/kaflo70.png" width="250" alt="Breakfast"/>
<img src="https://i.imgur.com/J3u8V6y.png" width="250" alt="Lunch"/>
<img src="https://i.imgur.com/O78jsUI.png" width="250" alt="Dinner"/>
<img src="https://i.imgur.com/ibkwfKA.png)" width="250" alt="Dessert"/>
<img src="https://i.imgur.com/zqMgEVG.png" width="250" alt="Setting"/>
<img src="https://i.imgur.com/s14krR9.png" width="250" alt="Detail"/>
</div>

### [BONUS] Interactive Prototype
<img src="https://i.imgur.com/vp5WIXL.gif" width="250" alt="Prototype Walkthrough" />

## Schema 

### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for each recipe |
   | cuisine | String | The cuisine(s) of the recipes. One or more, comma separated |
   | intolerances | String | A comma-separated list of intolerances |
   | dishTypes | String | Meal Type |
   | addRecipeInformation | Boolean | If set to true, you get more information about the recipes returned |
   | addRecipeNutrition | Boolean | If set to true, you get nutritional information about each recipes returned |
   | author | String | The username of the recipe author.
   | maxReadyTime | Int | The maximum time in minutes it should take to prepare and cook the recipe.
   | image | file | Image of the recipe |
   | extendedIngredients | String | list of name of the ingredients |
   | summary | String | Summary of the food 
   
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read) Showcases all recommended recipes 
         ```swift
         let url = URL(string: "https://api.spoonacular.com/recipes/random")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
           // TODO: Do something with posts...
            }
         }

      
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Spoonacular Recipe
- Base URL - [https://api.spoonacular.com](https://api.spoonacular.com)

    
   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /recipes/{id}/information | get the information of a {id} recipe
    `GET`    | /recipeImages/{ID}-{SIZE}.{TYPE} | get the image of the recipe

### Sprint 1 (April 29, 2021) 

### User Stories

- [x] User can see an app icon on the home screen.
- [x] User can view and switch tap on the tab views (home, breakfast, main, dessert).

### App Walkthrough GIF 
App Walkthrough <br/>
<img src="https://i.imgur.com/en7jz6A.gif" width="250" alt="video walkthrough" />

Postman API Tester <br/>
<img src="https://i.imgur.com/zyrIDD9.gif" alt="video walkthrough" />

### Sprint 2 (May 06, 2021) 

### User Stories 

- [x] User can see the custom launch screen 
- [ ] User can see the image and the title of the receipe in each tab (breakfast, main, dessert)
- [ ] User can see the suggested receipe depending on the time in home tab 

### App Walkthrough GIF 
Custom Launch Screen <br />
<img src="https://i.imgur.com/xVwbBmE.gif" width="250" alt="Video Walkthrough" />
