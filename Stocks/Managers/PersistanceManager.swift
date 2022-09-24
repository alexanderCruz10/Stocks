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
        static let onboardedKey = "hasOnboarded"
        static let watchListKey = "watchlist"
    }
    
    private init(){
        
    }
    
    //MARK: - Public
    
    public var watchList: [String]{
        
        if !hasOnBoarded{
            userDefaults.set(true, forKey: Constants.onboardedKey)
            setUpDefaults()
        }
        return userDefaults.stringArray(forKey: Constants.watchListKey) ?? []
    }
    
    public func watchlistContains(symbol: String) -> Bool {
        return watchList.contains(symbol)
    }
    
    public func addToWatchList(symbol: String, companyName: String){
        var current = watchList
        current.append(symbol)
        userDefaults.set(current, forKey: Constants.watchListKey)
        userDefaults.set(companyName, forKey: symbol)

        NotificationCenter.default.post(name: .didAddToWatchList, object: nil)
    }
    
    public func removeFromWatchList(symbol: String){
       var newList = [String]()

        userDefaults.set(nil, forKey: symbol)
        
        for item in watchList where item != symbol {
            newList.append(item)
        }

        userDefaults.set(newList, forKey: Constants.watchListKey)
    }
    
    //MARK: - Private
    
    private var hasOnBoarded: Bool{
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setUpDefaults(){
        let map: [String: String] = [
            "AAPL": "Apple Inc",
            "MSFT": "Microsoft Corporation",
            "SNAP": "Snap Inc.",
            "GOOGL": "Alphabet",
            "AMZN": "Amazon.com, Inc.",
            "WORK": "Slack Technologies",
            "META": "Meta Platforms Inc.",
            "NVDA": "Nvidia Inc.",
            "NKE": "Nike",
            "PINS": "Pinterest Inc."
        ]

        let symbols = map.keys.map { $0 }
        userDefaults.set(symbols, forKey: Constants.watchListKey)

        for (symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}
