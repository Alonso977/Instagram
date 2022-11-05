//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Alonso Alas on 5/11/22.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    static let indentifier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        //configure the cell
        
    }
    
}
