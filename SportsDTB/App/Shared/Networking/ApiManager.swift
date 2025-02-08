//
//  ApiManager.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 17/06/22.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response {
            response in completion(response.result)
        }
    }
    
}
