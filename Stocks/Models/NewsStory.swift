//
//  NewsStory.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-21.
//

import Foundation

/// Represent news story
struct NewsStory: Codable {
    let category: String
    let datetime: TimeInterval
    let headline: String
    let image: String
    let related: String
    let source: String
    let summary: String
    let url: String
}
