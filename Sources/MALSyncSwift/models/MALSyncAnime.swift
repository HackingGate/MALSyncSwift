//
//  MALSyncAnime.swift
//  
//
//  Created by HG on 2020/12/05.
//

import Foundation

public struct MALSyncMALSites: Codable {
    public let nineAnime: MALSyncMALSite<MALSyncMALSiteType1>?
    public let aniwatch: MALSyncMALSite<MALSyncMALSiteType1>?
    public let gogoanime: MALSyncMALSite<MALSyncMALSiteType1>?
    public let twistmoe: MALSyncMALSite<MALSyncMALSiteType1>?
    public let anime4you: MALSyncMALSite<MALSyncMALSiteType1>?
    public let crunchyroll: MALSyncMALSite<MALSyncMALSiteType1>?
    public let animeSimple: MALSyncMALSite<MALSyncMALSiteType2>?

    enum CodingKeys: String, CodingKey {
        // Anime
        case nineAnime = "9anime"
        case aniwatch = "Aniwatch"
        case gogoanime = "Gogoanime"
        case twistmoe = "Twistmoe"
        case anime4you = "Anime4you"
        case crunchyroll = "Crunchyroll"
        case animeSimple = "AnimeSimple"
    }
}

// Decode Dynamic Keys
// https://swiftsenpai.com/swift/decode-dynamic-keys-json/
public struct MALSyncMALSite<T: Codable>: Codable {

    public var array: [T]

    private struct DynamicCodingKeys: CodingKey {

        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempArray = [T]()

        for key in container.allKeys {
            let decodedObject = try container.decode(T.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        array = tempArray
    }
}

public struct MALSyncMALSiteType1: Codable, Identifiable {
    public let id: String // identifier
    public let type: String
    public let page: String
    public let title: String
    public let url: String
    public let image: String?
    public let malId: Int
    
    enum CodingKeys: String, CodingKey {
        // Anime
        case id = "identifier"
        case type = "type"
        case page = "page"
        case title = "title"
        case url = "url"
        case image = "image"
        case malId = "malId"
    }
}

public struct MALSyncMALSiteType2: Codable {
    public let mal: [String: String]
    public let image: String?
    public let title: String
    public let url: String
    public let malUrl: String

    enum CodingKeys: String, CodingKey {
        // Anime
        case mal = "Mal"
        case image = "image"
        case title = "title"
        case url = "url"
        case malUrl = "malUrl"
    }
}
