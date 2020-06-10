//
//  UsersListInteractor.swift
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

protocol UsersListBusinessLogic {
    func getNavBarData(_ request: UsersList.UpdateNavBar.Request)
    func getNoDataText(_ request: UsersList.SetText.Request)
    func fetchUsers(_ request: UsersList.FetchUsers.Request)
    func selectUser(_ request: UsersList.SelectUser.Request)
}

protocol UsersListDataStore {
    var userList: [User] { get }
    var error: String { get }
    var selectedUser: User? { get }
}

class UsersListInteractor: UsersListBusinessLogic, UsersListDataStore {
    var presenter: UsersListPresentationLogic?
    lazy var worker: UsersListWorkingLogic = UsersListWorker()
    var userList: [User] = []
    var error: String = ""
    var selectedUser: User?
  
  // MARK: - UsersListBusinessLogic
  
    func getNavBarData(_ request: UsersList.UpdateNavBar.Request) {
        let response = UsersList.UpdateNavBar.Response(
            navData: NavigationBarData(
                title: "users.list.scene.title".localized,
                backTitle: "",
                iconImage: UIImage(named: Constants.ImageNames.UserIcon),
                rightButtonImage: nil))
        
        self.presenter?.presentNavBarData(response)
    }
    
    func getNoDataText(_ request: UsersList.SetText.Request) {
        let response = UsersList.SetText.Response(
            noDataText: String("users.list.scene.nousers.label".localized))
        self.presenter?.presentNoDataText(response)
    }
    
    func fetchUsers(_ request: UsersList.FetchUsers.Request) {
        worker.fetchUsers  { result in
            switch result {
            case .success(let users) :
                for user in users {
                    self.userList.append(user)
                }
                self.error = "error.message.noerror".localized
            case .failure(let error) :
                self.error = "users.list.scene.error.error.message".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = UsersList.FetchUsers.Response(users: self.userList, error: self.error)
            self.presenter?.presentFetchedUsers(response)
        }
        
    }
    
    func selectUser(_ request: UsersList.SelectUser.Request) {
        guard !self.userList.isEmpty, request.index < self.userList.count else {
            return
        }
        
        selectedUser = self.userList[request.index]
    }
}
