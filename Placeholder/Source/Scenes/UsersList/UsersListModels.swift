//
//  UsersListModels.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 07/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum UsersList {
    // MARK: Use cases
    
    // MARK: - Fetch list of user and display in table

    enum FetchUsers {
        struct Request {}

        struct Response {
            let users: [User]
            let error: String
        }

        struct ViewModel {
            let users: [User]
            let error: String
        }
    }

    // MARK: - set no data text

    enum SetText {
        struct Request {}

        struct Response {
            let noDataText: String
        }

        struct ViewModel {
            let noDataText: String
        }
    }
    
    // MARK: - Select user by index

    enum SelectUser {
        struct Request {
            let index: Int
        }
    }
    
    // MARK: - Update Nav Bar
    
    enum UpdateNavBar {
        struct Request {}
        
        struct Response {
            let navData: NavigationBarData
        }
        
        struct ViewModel {
            let navData: NavigationBarData
        }
    }
    
}
