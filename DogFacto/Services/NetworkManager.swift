//
//  NetworkManager.swift
//  DogFacto
//
//  Created by Laurynas Kapacinskas on 2021-09-23.
//

import Foundation
import Alamofire

class NetworkManager: ObservableObject {
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number=1")
    }
    
    static let shared = NetworkManager()
    
    private init() {}
    
    public func getBankList(completion: @escaping (Result<DogFact, AFError>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        AF.request(url, method: .get).responseData(completionHandler: { (response) in
            switch response.result {
            case .success(let res):
                if response.value != nil {
                    let jsonString = String(data: res, encoding: .utf8)!
                    let responseData = DogFact(JSONString: jsonString)
                    completion(.success(responseData ?? []))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
