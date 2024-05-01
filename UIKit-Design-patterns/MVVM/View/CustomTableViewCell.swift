//
//  CustomTableViewCell.swift
//  UIKit-Design-patterns
//
//  Created by Kritchanaxt_. on 1/5/2567 BE.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel!
    
    static let cellIdentifier = "CustomTableviewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel) {
        myLabel.text = "\(viewModel.firstName) \(viewModel.lastName)"
    }
}
