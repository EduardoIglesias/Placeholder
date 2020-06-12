//
//  TodosListPresenter.swift
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

protocol TodosListPresentationLogic {
    func presentNavBarData(_ response: TodosList.UpdateNavBar.Response)
    func presentNoDataText(_ response: TodosList.SetText.Response)
    func presentFetchedTodos(_ response: TodosList.FetchTodos.Response)
    func presentCreatePopUpText(_ response: TodosList.LaunchCreatePopup.Response)
    func presentCreateTodo(_ response: TodosList.CreateTodo.Response)
    func presentDeletePopUpText(_ response: TodosList.LaunchDeletePopup.Response)
    func presentDeleteTodo(_ response: TodosList.DeleteTodo.Response)
    func presentCheckPopUpText(_ response: TodosList.LaunchCheckPopup.Response)
    func presentCheckTodo(_ response: TodosList.CheckTodo.Response)
    
}

class TodosListPresenter: TodosListPresentationLogic {
    weak var viewController: TodosListDisplayLogic?
    
    // MARK: - TodosListPresentationLogic
    
    func presentNavBarData(_ response: TodosList.UpdateNavBar.Response) {
        let viewModel = TodosList.UpdateNavBar.ViewModel(
            navData: response.navData)
        viewController?.displayNavBarData(viewModel)
    }
    
    func presentNoDataText(_ response: TodosList.SetText.Response) {
        let viewModel = TodosList.SetText.ViewModel(
            noDataText: response.noDataText)
        viewController?.displayNoDataText(viewModel)
    }
    
    func presentFetchedTodos(_ response: TodosList.FetchTodos.Response) {
        let viewModel = TodosList.FetchTodos.ViewModel(todos: response.todos, error: response.error)

      viewController?.displayFetchedTodos(viewModel)
    }
    
   func presentCreatePopUpText(_ response: TodosList.LaunchCreatePopup.Response) {
        let viewModel = TodosList.LaunchCreatePopup.ViewModel(
            popupTitle: response.popupTitle,
            popupCreateText: response.popupCreateText,
            popupCancelText: response.popupCancelText)
        viewController?.displayCreatePopup(viewModel)
    }
    
    func presentCreateTodo(_ response: TodosList.CreateTodo.Response) {
        let viewModel = TodosList.CreateTodo.ViewModel(todos: response.todos, error: response.error)
        viewController?.displayCreateTodo(viewModel)
    }
    
    func presentDeletePopUpText(_ response: TodosList.LaunchDeletePopup.Response) {
         let viewModel = TodosList.LaunchDeletePopup.ViewModel(
            todoIndex: response.todoIndex,
            popupTitle: response.popupTitle,
            popupYesText: response.popupYesText,
            popupNoText: response.popupNoText)
         viewController?.displayDeletePopup(viewModel)
     }
    
    func presentDeleteTodo(_ response: TodosList.DeleteTodo.Response) {
        let viewModel = TodosList.DeleteTodo.ViewModel(todos: response.todos, result: response.result)
        viewController?.displayDeleteTodo(viewModel)
    }
    
    func presentCheckPopUpText(_ response: TodosList.LaunchCheckPopup.Response) {
         let viewModel = TodosList.LaunchCheckPopup.ViewModel(
            todoIndex: response.todoIndex,
            popupTitle: response.popupTitle,
            popupYesText: response.popupYesText,
            popupNoText: response.popupNoText)
         viewController?.displayCheckPopup(viewModel)
     }
    
    func presentCheckTodo(_ response: TodosList.CheckTodo.Response) {
        let viewModel = TodosList.CheckTodo.ViewModel(todos: response.todos, result: response.result)
        viewController?.displayCheckTodo(viewModel)
    }
}
