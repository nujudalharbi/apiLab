//
//  ViewController.swift
//  apiLab
//
//  Created by نجود  on 09/04/1443 AH.
//

import UIKit
class CatsResponse : Codable {
    var data : [Anime] = []
    
    
}
struct Anime  : Codable {
    var anime_id : Int
    var anime_name : String
    var anime_img : String
    
    
    
}



class ViewController: UIViewController {
    
//    var
    
    func getCharacters(){
        
        
        
      var urlComponents = URLComponents()
      urlComponents.scheme = "https"
      urlComponents.host = "anime-facts-rest-api.herokuapp.com"
      urlComponents.path = "/api/v1"
        
        
        var urlRequest = URLRequest(url : urlComponents.url!)
//      let urlQueryItem = URLQueryItem(name: "status", value: "Alive")
//        urlComponents.queryItems = [urlQueryItem]
      let urlSession = URLSession.shared
//      let urlRequest = URLRequest(url:urlComponents.url!)
      let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
       do {
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(CatsResponse.self, from: data!)
           print(response.data[0].anime_name)
//          print(String(data: data!, encoding:.utf8))
       } catch {
           print("err: \(error)")
       }
        }
      task.resume()
//    }

  }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
        // Do any additional setup after loading the view.
    }


}

