//
//  SearchResultsTableViewCell.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell{
    
    static let indentifier = "SearchResultsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
