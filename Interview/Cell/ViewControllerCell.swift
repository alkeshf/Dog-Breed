//
//  viewControllerCell.swift
//  Interview
//
//  Created by Alkesh Fudani on 12/10/20.
//

import UIKit

class ViewControllerCell: UITableViewCell {

     // MARK: IBOutlets/Variables
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lifeSpan: UILabel!
    @IBOutlet weak var dogImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Assigning values from the model
    func setupData(shareobj:Model){
        name.text = "Name: \(shareobj.name ?? "")"
        lifeSpan.text = "Lifespan: \(shareobj.lifeSpan ?? "")"
        guard let imageUrl = shareobj.image else {
            return
        }
        dogImage.LoadImage(url: imageUrl)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
