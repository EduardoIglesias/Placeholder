//
//  Utils.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 09/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

import Foundation

func getUrl(for path: String) -> URL {
    var urlComponents = URLComponents()
    urlComponents.scheme = Constants.URL.Scheme
    urlComponents.host = Constants.URL.Host
    urlComponents.path = path

    guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
    print("*** Request URL: \(url)")
    return url
}
