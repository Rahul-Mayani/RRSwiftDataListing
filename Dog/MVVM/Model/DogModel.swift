//
//  DogModel.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import UIKit

struct DogModel {
    var breeds: [Breeds]!
    var height: Int!
    var id: String!
    var url: String!
    var width: Int!
}

extension DogModel: Codable {
    static func decodeJsonData(_ data: Data) -> [DogModel] {
        let decoder = JSONDecoder()
        do {
            let dog = try decoder.decode([DogModel].self, from: data)
            return dog
        } catch {
            UIAlertController.showAlert(title: nil, message: error.localizedDescription)
        }
        return []
    }
}

// MARK: - Breeds -
struct Breeds {
    var bred_for : String!
    var breed_group : String!
    var height : ImperialMetric!
    var id : Int!
    var life_span : String!
    var name : String!
    var reference_image_id : String!
    var temperament : String!
    var weight : ImperialMetric!
}

extension Breeds: Codable {}

// MARK: - ImperialMetric for height & weight -
struct ImperialMetric {
    var imperial : String!
    var metric : String!
}

extension ImperialMetric: Codable {}

