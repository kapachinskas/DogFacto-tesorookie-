//
//  Response.swift
//  DogFacto
//
//  Created by Laurynas Kapacinskas on 2021-09-23.
//

import Foundation
import ObjectMapper

struct Response: Mappable {
   
    var fact: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        fact <- map["fact"]
    }
}

typealias DogFact = [Response]
