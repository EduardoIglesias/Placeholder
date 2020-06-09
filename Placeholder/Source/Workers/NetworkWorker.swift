//
//  NetworkWorker.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 08/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

protocol NetworkWorkingLogic {
    /// Main request to API
    func getInfo<T: Decodable>(for url : URL, completion: @escaping (Result<T>) -> Void)
}

final class NetworkWorker: NetworkWorkingLogic {
    
    // MARK: - Private Properties
    
    private let session = URLSession.shared
    
    
    // MARK: - NetworkWorkingLogic
    
    func getInfo<T: Decodable>(for url : URL, completion: @escaping (Result<T>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    let decoder = JSONDecoder()
                    do {
                        let dataDecoded = try decoder.decode(T.self, from: data!)
                        completion(.success(dataDecoded))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
}
