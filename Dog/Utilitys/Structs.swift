//
//  Structs.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

public struct APIEndPoint {
    
    static let endPointURL = Environment.production.rawValue
    
    private enum Environment:String {
        case develop = "local host"
        case staging = "stage"
        case production = "https://api.thedogapi.com/"
    }
    
    private static let version = "v1/"
    
    struct Name {
        static let dogsSearch = endPointURL + version + "images/search?limit=50"
    }
}

enum RRSortEnum: Int {
    case asc
    case desc

    var title: String? {
        switch self {
        case .asc:
            return "Ascending"
        case .desc:
            return "Descending"
        }
    }
}
