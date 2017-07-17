//
//  PostActionCellTableViewCell.swift
//  Makestagram
//
//  Created by Tommy Qiu on 7/12/17.
//  Copyright © 2017 Tommy Co. All rights reserved.
//

import UIKit
protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        delegate?.didTapLikeButton(sender, on: self)
    }
    
    // MARK: - Properties
    weak var delegate: PostActionCellDelegate?
    // MARK: - IBActions

    @IBOutlet weak var likeButton: UIButton!
    static let height: CGFloat = 46
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var timeAgoLabel: UILabel!

    @IBOutlet weak var likeCountLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
