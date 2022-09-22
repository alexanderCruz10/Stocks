//
//  Extension.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import UIKit



// NumberFormatter

extension NumberFormatter {
    /// Formatter for percent style
    static let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    /// Formatter for decimal style
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

extension String {
    /// Create string from time interval
    /// - Parameter timeInterval: Timeinterval sinec 1970
    /// - Returns: Formatted string
    static func string(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateFormatter.prettyDateFormatter.string(from: date)
    }
    
    // Percentage formatted string
    /// - Parameter double: Double to format
    /// - Returns: String in percent format
    static func percentage(from double: Double) -> String {
        let formatter = NumberFormatter.percentFormatter
        return formatter.string(from: NSNumber(value: double)) ?? "\(double)"
    }

    /// Format number to string
    /// - Parameter number: Number to format
    /// - Returns: Formatted string
    static func formatted(number: Double) -> String {
        let formatter = NumberFormatter.numberFormatter
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

// MARK: - DateFormatter

extension DateFormatter {
    static let newsDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()

    static let prettyDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

// ImageView

extension UIImageView {
    /// Sets image from remote url
    /// - Parameter url: URL to fetch from
    func setImage(with url: URL?) {
        guard let url = url else {
            return
        }

        DispatchQueue.global(qos: .userInteractive).async {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}


// MARK: - Add Subview
extension UIView {
    /// Adds multiple subviews
    /// - Parameter views: Collection of subviews
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

extension UIView{
    
    var width: CGFloat{
        frame.size.width
    }
    var height: CGFloat{
        frame.size.height
    }
    var left: CGFloat{
        frame.origin.x
    }
    var right: CGFloat{
        left + width
    }
    var top: CGFloat{
        frame.origin.y
    }
    var bottom: CGFloat{
       top + height
    }
    
}
