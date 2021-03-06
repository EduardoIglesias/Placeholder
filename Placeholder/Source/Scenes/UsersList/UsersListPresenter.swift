//
//  UsersListPresenter.swift
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

protocol UsersListPresentationLogic {
    func presentNavBarData(_ response: UsersList.UpdateNavBar.Response)
    func presentNoDataText(_ response: UsersList.SetText.Response)
    func presentFetchedUsers(_ response: UsersList.FetchUsers.Response)
}

class UsersListPresenter: UsersListPresentationLogic {
    weak var viewController: UsersListDisplayLogic?
    
    // MARK: - UsersListPresentationLogic
    
    func presentNavBarData(_ response: UsersList.UpdateNavBar.Response) {
        let viewModel = UsersList.UpdateNavBar.ViewModel(
            navData: response.navData)
        viewController?.displayNavBarData(viewModel)
    }
    
    func presentNoDataText(_ response: UsersList.SetText.Response) {
        let viewModel = UsersList.SetText.ViewModel(
            noDataText: response.noDataText)
        viewController?.displayNoDataText(viewModel)
    }
    
    func presentFetchedUsers(_ response: UsersList.FetchUsers.Response) {
        let sortedUsers = response.users.sorted { $0.id < $1.id }
        let viewModel = UsersList.FetchUsers.ViewModel(users: sortedUsers, error: response.error)

      viewController?.displayFetchedUsers(viewModel)
    }
}
