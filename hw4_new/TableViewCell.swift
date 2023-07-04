//
//  TableViewCell.swift
//  hw4
//
//  Created by Arina Goncharova on 30.06.2023.
//

import UIKit

struct Character {
    enum Status {
        case alive
        case dead
        case unknown
    }
    
    enum Gender {
        case female
        case male
        case genderless
        case unknown
    }
    
    let id: UUID
    var name: String
    let status: Status
    let species: String
    let gender: Gender
    var location: String
    let image: UIImage
}

final class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(_ data: Character){
        characterImageView.image = data.image
        characterNameLabel.text = data.name
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        characterNameLabel.text = nil
    }
    
    
    

}
