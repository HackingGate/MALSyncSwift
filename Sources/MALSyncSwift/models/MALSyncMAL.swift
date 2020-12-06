//
//  MALSyncMAL.swift
//  
//
//  Created by HG on 2020/12/05.
//

import Foundation

public struct MALSyncMAL: Codable {
    public let id: Int
    public let type: String
    public let title: String
    public let url: String
    public let image: String
    public let sites: MALSyncMALSites
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case url = "url"
        case image = "image"
        case sites = "Sites"
    }
}

public enum MALSyncMALType: String {
    case anime = "anime"
}
