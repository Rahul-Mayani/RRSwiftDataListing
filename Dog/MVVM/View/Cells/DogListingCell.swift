//
//  DogListingCell.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import UIKit

class DogListingCell: UITableViewCell {

    // MARK: - IBOutlet -
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bredForLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var lifeSpanLabel: UILabel!
    
    // MARK: - Variable -
    public var data: DogModel? = nil {
        didSet {
            dogImageView.setKingfisherImageView(image: data?.url ?? "")
            nameLabel.text = data?.breeds.first?.name ?? ""
            bredForLabel.text = data?.breeds.first?.bred_for ?? ""
            temperamentLabel.text = data?.breeds.first?.temperament ?? ""
            lifeSpanLabel.text = "Life Span:- " + (data?.breeds.first?.life_span ?? "")
        }
    }
    
    // MARK: - Cell Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
