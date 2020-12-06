//
//  MALSyncAPIServiceExtension.swift
//  
//
//  Created by HG on 2020/12/05.
//

import Foundation

extension MALSyncAPIService {
    // https://api.malsync.moe/mal/anime/1
    public func loadMALAnime<T: Codable>(id: Int,
                                         params: [String: String]?,
                                         completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["mal", "anime", String(id)])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
}
