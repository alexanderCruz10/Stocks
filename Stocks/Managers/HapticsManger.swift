//
//  HapticsManger.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import Foundation
import UIKit

final class HapticsManager{
    
    //MARK: Properties
    static let shared = HapticsManager()
    
    private init(){
        
    }
    
    //MARK: Public
    
    /// Vibrate slightly for selection
    public func vibarateForSelection(){
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
    //vibarate for type
    
    /// Play haptic for given type interaction
    /// - Parameter type: Type to vibrate for
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
