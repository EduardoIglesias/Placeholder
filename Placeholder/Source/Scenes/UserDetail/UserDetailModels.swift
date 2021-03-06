//
//  UserDetailModels.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 09/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum UserDetail
{
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

    // MARK: - set View Fields
    
    enum SetViewFields {
        struct Request {}
        
        struct Response {
            let viewFields: UserFields
        }
        
        struct ViewModel {
            let viewFields: UserFields
        }
    }
    
    // MARK: - set User Info
    
    enum SetUserInfo {
        struct Request {}
        
        struct Response {
            let userInfo: User
        }
        
        struct ViewModel {
            let userInfo: UserFormatted
        }
    }
}
