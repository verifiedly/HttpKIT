//
//  ViewController.swift
//  Http-Kit
//
//  Created by Samuel Ailemen on 12/5/21.
//

import UIKit
import HttpKIT

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        HttpKIT.request.get(url: "https://jsonplaceholder.typicode.com/todos/1", completionHandler: { status, data, error in
            guard let error = error else {return}
            if error.isEmpty {
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(result)
                }
                catch {
                    print("error decoding request")
                }
            } else {
                print(error)
            }
        })
    }


}

