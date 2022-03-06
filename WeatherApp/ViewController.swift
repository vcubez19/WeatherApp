//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vincent Cubit on 3/6/22.
//

import UIKit


class ViewController: UIViewController {
    

    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentConditions: UILabel!
    @IBOutlet weak var dewPoint: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [ String: AnyObject ]
                    
                    
                    let newDict = parsed
                    
                    
                    self.currentTemp.text = "\(String(describing: newDict["currently"]!["temperature"]!!))"
                    self.currentConditions.text = "\(String(describing: newDict["currently"]!["summary"]!!))"
                    self.dewPoint.text = "\(String(describing: newDict["currently"]!["dewPoint"]!!))"
                    
                    
                } catch _ as NSError {
                    print()
                }
            }
        }
    }


}

