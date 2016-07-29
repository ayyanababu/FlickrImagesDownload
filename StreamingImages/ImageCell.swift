//
//  ImageCell.swift
//  StreamingImages
//
//  Created by Raja Ayyan on 29/07/16.
//  Copyright © 2016 personal. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    
    @IBOutlet weak var flickrImageView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.blackColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(image: UIImage, title: String){
        self.flickrImageView.image = image
        self.photoTitle.text = title
    }

}
