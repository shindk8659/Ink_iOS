//
//  NewspeedCell.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class NewspeedCell: UICollectionViewCell {

    @IBOutlet weak var headerlabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var withconstraint: NSLayoutConstraint!
    @IBOutlet weak var comment: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
       withconstraint.constant = screenWidth - ( 2 * 12)
    }

}
