//
//  TodosListWorker.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 10/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol TodosListWorkingLogic {
    /// Request to API for loading list of users
    func fetchTodos(for userId: String, completion: @escaping (Result<[Todo]>) -> Void)
}

final class TodosListWorker: TodosListWorkingLogic {
    
    // MARK: - Private Properties
    private let networkWorker: NetworkWorkingLogic = NetworkWorker()
    private func todosURL(for userId : String) -> URL { return getUrl(for: "\(Constants.URL.Users)\(Constants.URL.ExtraSlash)\(userId)\(Constants.URL.Todos)")
    }
        
    
    // MARK: - UsersListWorkingLogic
    
    func fetchTodos(for userId: String, completion: @escaping (Result<[Todo]>) -> Void) {
        let url = todosURL(for: userId)
        let requestUrl = url
        var request = URLRequest(url: requestUrl)
        request.httpMethod = Constants.HTTPMethod.GET
        networkWorker.request(for: request, completion: completion)
    }
}
