//
//  PersistanceManager.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import Foundation

final class PersitanceManager{
    
    //MARK: - Properties
    static let shared = PersitanceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants{
        
    }
    
    private init(){
        
    }
    
    //MARK: - Public
    
    public var watchList: [String]{
        return []
    }
    
    public func addToWatchList(){
        
    }
    
    public func removeToWatchList(){
        
    }
    
    //MARK: - Private
    
    private var hasOnBoarded: Bool{
        return false
    }
}
