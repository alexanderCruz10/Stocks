//
//  StockChartView.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-22.
//

import UIKit

class StockChartView: UIView {
    
    struct ViewModel {
        let data: [Double]
        let showLegend: Bool
        let showAxis: Bool
        //let fillColor: UIColor
    }
    
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
        
    }
    
    func configure(with viewModel: ViewModel){
        
    }
}
