//
//  StockChartView.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-22.
//

import UIKit

class StockChartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func reset() {
       // chartView.data = nil
    }
}
