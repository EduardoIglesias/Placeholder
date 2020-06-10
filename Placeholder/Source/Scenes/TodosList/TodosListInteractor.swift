//
//  TodosListInteractor.swift
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

protocol TodosListBusinessLogic {
    func getNavBarData(_ request: TodosList.UpdateNavBar.Request)
    func getNoDataText(_ request: TodosList.SetText.Request)
    func fetchTodos(_ request: TodosList.FetchTodos.Request)
    func selectTodo(_ request: TodosList.SelectTodo.Request)
}

protocol TodosListDataStore {
    var title: String { get set }
    var userId: String { get set }
    var todoList: [Todo] { get set }
    var error: String { get set }
    var selectedTodo: Todo? { get set }
}

class TodosListInteractor: TodosListBusinessLogic, TodosListDataStore {
    var presenter: TodosListPresentationLogic?
    lazy var worker: TodosListWorkingLogic = TodosListWorker()
    var title: String = ""
    var userId: String = ""
    var todoList: [Todo] = []
    var error: String = ""
    var selectedTodo: Todo?
  
  // MARK: - TodosListBusinessLogic
  
    func getNavBarData(_ request: TodosList.UpdateNavBar.Request) {
        let response = TodosList.UpdateNavBar.Response(
            navData: NavigationBarData(
                title: "\(title) \("todos.list.scene.title".localized)",
                backTitle: "back.button".localized,
                iconImage: UIImage(named: Constants.ImageNames.UserIcon),
                rightButtonImage: UIImage(named: Constants.ImageNames.CloseIcon)))
        
        self.presenter?.presentNavBarData(response)
    }
    
    func getNoDataText(_ request: TodosList.SetText.Request) {
        let response = TodosList.SetText.Response(
            noDataText: String("todos.list.scene.nousers.label".localized))
        self.presenter?.presentNoDataText(response)
    }
    
    func fetchTodos(_ request: TodosList.FetchTodos.Request) {
        worker.fetchTodos(for: userId)  { result in
            switch result {
            case .success(let todos) :
                for todo in todos {
                    self.todoList.append(todo)
                }
                self.error = "error.message.noerror".localized
            case .failure(let error) :
                self.error = "todos.list.scene.error.error.message".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.FetchTodos.Response(todos: self.todoList, error: self.error)
            self.presenter?.presentFetchedTodos(response)
        }
        
    }
    
    func selectTodo(_ request: TodosList.SelectTodo.Request) {
        guard !self.todoList.isEmpty, request.index < self.todoList.count else {
            return
        }
        
        selectedTodo = self.todoList[request.index]
    }
}