//
//  Constants.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 07/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//


import UIKit

/// App constants structure.
struct Constants {
    
    struct URL {
        static let Scheme: String = "https"
        static let Host: String = "jsonplaceholder.typicode.com"
        static let Users: String = "/users"
        static let ExtraSlash: String = "/"
        static let Todos: String = "/todos"
    }

    struct HTTPMethod {
        static let GET: String = "GET"
        static let POST: String = "POST"
    }
    
    struct TodoHeaderFields {
        static let typeField: String = "Content-Type"
        static let typeValue: String = "application/json; charset=UTF-8"

    }
    
    struct TodoBodyFields {
        static let UserId: String = "userId="
        static let Title: String = "&title="
        static let Completed: String = "&completed="
    }
    
    struct Storyboards {
        static let UsersList: String = "UsersList"
        static let UserDetail: String = "UserDetail"
        static let TodosList: String = "TodosList"
    }
    
    struct ViewControllers {
        static let UsersList: String = "UsersListViewController"
        static let UserDetail: String = "UserDetailViewController"
        static let TodosList: String = "TodosListViewController"
    }
    
    struct CellIdentifiers {
        static let UsersList: String = "UsersListCell"
        static let TodosList: String = "TodosListCell"
    }
    
    struct CellIHeights {
        static let UsersList: CGFloat = 60.0
        static let TodosList: CGFloat = 80.0

    }
    
    struct ImageNames {
        static let CloseIcon: String = "closeIcon"
        static let UserIcon: String = "UserIcon"
        static let DetailIcon: String = "DetailIcon"
        static let TodoIcon: String = "TodoIcon"
    }
}
