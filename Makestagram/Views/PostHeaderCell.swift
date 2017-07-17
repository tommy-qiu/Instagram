//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Tommy Qiu on 7/12/17.
//  Copyright © 2017 Tommy Co. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    static let height: CGFloat = 54
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("options button tapped")
    }
}
