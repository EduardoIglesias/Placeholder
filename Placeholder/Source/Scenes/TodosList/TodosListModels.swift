//
//  TodosListModels.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 10/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum TodosList {
    // MARK: Use cases
    
    // MARK: - Fetch list of todos and display in table

    enum FetchTodos {
        struct Request {}

        struct Response {
            let todos: [Todo]
            let error: String
        }

        struct ViewModel {
           let todos: [Todo]
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
    
    // MARK: - Select todo by index

    enum SelectTodo {
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
    
    // MARK: - Launch Create Popup
    
    enum LaunchCreatePopup {
        struct Request {}
        
        struct Response {
            let popupTitle: String
            let popupCreateText: String
            let popupCancelText: String
        }
        
        struct ViewModel {
            let popupTitle: String
            let popupCreateText: String
            let popupCancelText: String
        }
    }
    
    // MARK: - Create Todo
    
    enum CreateTodo {
        struct Request {
            let newTodoData: Todo
        }
        
        struct Response {
            let todos: [Todo]
            let error: String
        }
        
        struct ViewModel {
            let todos: [Todo]
            let error: String
        }
    }
    
    // MARK: - Launch Delete Popup
    
    enum LaunchDeletePopup {
        struct Request {
            let todoIndex: Int
        }
        
        struct Response {
            let todoIndex: Int
            let popupTitle: String
            let popupYesText: String
            let popupNoText: String
        }
        
        struct ViewModel {
            let todoIndex: Int
            let popupTitle: String
            let popupYesText: String
            let popupNoText: String
        }
    }
    
    // MARK: - Delete Todo
    
    enum DeleteTodo {
        struct Request {
            let todoId: Int
            let todoIndex: Int
        }
        
        struct Response {
            let todos: [Todo]
            let result: String
        }
        
        struct ViewModel {
            let todos: [Todo]
            let result: String
        }
    }
}
