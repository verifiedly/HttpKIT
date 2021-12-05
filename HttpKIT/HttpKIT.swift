//
//  HttpKIT.swift
//  HttpKIT
//
//  Created by Samuel Ailemen on 12/5/21.
//

import Foundation


public class HttpKIT {
    
    public static let request = HttpKIT()
    
    private init() {}
    
    public func get(url: String?, completionHandler: ((Int?, Data?, String?) -> ())?){
        
        guard let url = url else {
            fatalError("You need to provide a valid url")
        }
        if !url.isEmpty {
            let URL = URL(string: url)
            let task = URLSession.shared.dataTask(with: URL!) { data , response, error in
                let httpResponse = response as? HTTPURLResponse
                guard let data = data, error == nil else {
                    completionHandler!(nil, nil, "HttpKIT ERROR: \(error!)")
                    return
                }
                completionHandler!(httpResponse!.statusCode, data, nil)
            }
            task.resume()
        }
    }
    
    
    public func post(url: String?, completionHandler: ((Int, Data?) -> ())?){
        
    }
}
