//
//  GridCollectionCell.swift
//  GameGrid
//
//  Created by Kartik Sharma on 18/12/2023.
//

import UIKit

class GridCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpTitle( with title: String ) {
        if title == "Ghost" {
            imgView.image = UIImage(named: "ghost")
        } else if title == "Police" {
            imgView.image = UIImage(named: "police")
        } else {
            imgView.image = UIImage(named: "white")

        }
    }

}
