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
    func getCreatePopUpText(_ request: TodosList.LaunchCreatePopup.Request)
    func getCreateTodo(_ request: TodosList.CreateTodo.Request)
    func getDeletePopUpText(_ request: TodosList.LaunchDeletePopup.Request)
    func getDeleteTodo(_ request: TodosList.DeleteTodo.Request)
    func getUpdatePopUpText(_ request: TodosList.LaunchUpdatePopup.Request)
    func getUpdateTodo(_ request: TodosList.UpdateTodo.Request)
    func getCheckPopUpText(_ request: TodosList.LaunchCheckPopup.Request)
    func getCheckTodo(_ request: TodosList.CheckTodo.Request)
    
}

protocol TodosListDataStore {
    var title: String { get set }
    var userId: String { get set }
    var todoList: [Todo] { get set }
    var popupMessage: String { get set }
    var selectedTodo: Todo? { get set }
}

class TodosListInteractor: TodosListBusinessLogic, TodosListDataStore {
    var presenter: TodosListPresentationLogic?
    lazy var worker: TodosListWorkingLogic = TodosListWorker()
    var title: String = ""
    var userId: String = ""
    var todoList: [Todo] = []
    var popupTitle = ""
    var popupMessage: String = ""
    var popupAction: String = ""
    var selectedTodo: Todo?
  
  // MARK: - TodosListBusinessLogic
  
    func getNavBarData(_ request: TodosList.UpdateNavBar.Request) {
        let response = TodosList.UpdateNavBar.Response(
            navData: NavigationBarData(
                title: "\(title) \("todos.list.scene.title".localized)",
                backTitle: "back.button".localized,
                iconImage: UIImage(named: Constants.ImageNames.TodoIcon),
                rightButtonImage: UIImage(named: Constants.ImageNames.CloseIcon)))
        
        self.presenter?.presentNavBarData(response)
    }
    
    func getNoDataText(_ request: TodosList.SetText.Request) {
        let response = TodosList.SetText.Response(
            noDataText: "todos.list.scene.nousers.label".localized)
        self.presenter?.presentNoDataText(response)
    }
    
    func fetchTodos(_ request: TodosList.FetchTodos.Request) {
        worker.fetchTodos(for: userId)  { result in
            switch result {
            case .success(let todos) :
                for todo in todos {
                    self.todoList.append(todo)
                }
                self.popupTitle = "popup.success.title".localized
                self.popupMessage = "error.message.noerror".localized
            case .failure(let error) :
                self.popupTitle = "popup.error.title".localized
                self.popupMessage = "\("todos.list.scene.error.get.message".localized):\n\(error.localizedDescription)"
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.FetchTodos.Response(todos: self.todoList, popupTitle: self.popupTitle, popupMessage: self.popupMessage, popupCancelText: "error.button.cancel".localized)
            self.presenter?.presentFetchedTodos(response)
        }
        
    }
    
    func getCreatePopUpText(_ request: TodosList.LaunchCreatePopup.Request) {
        let response = TodosList.LaunchCreatePopup.Response(
            popupTitle: "todos.list.scene.popup.newtodo.title".localized,
            popupCreateText: "todos.list.scene.popup.newtodo.button.create".localized,
            popupCancelText: "todos.list.scene.popup.newtodo.button.cancel".localized)
        self.presenter?.presentCreatePopUpText(response)
    }
    
    func getCreateTodo(_ request: TodosList.CreateTodo.Request) {
        let newTodo: Todo = Todo(userId: Int(self.userId) ?? 0, id: request.newTodoData.id, title: request.newTodoData.title, completed: request.newTodoData.completed)
        
        worker.createTodo(newTodo: newTodo)  { result in
            switch result {
            case .success(let todo) :
                self.todoList.append(todo)
                print("*** Success: \(todo)")
                self.popupTitle = "popup.success.title".localized
                self.popupMessage = "todos.list.scene.popup.button.createsuccess.message".localized
                self.popupAction = ""
            case .failure(let error) :
                self.popupTitle = "popup.error.title".localized
                self.popupMessage = "\("todos.list.scene.error.post.message".localized):\n\(error.localizedDescription)"
                self.popupAction = "error.button.tryagain".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.CreateTodo.Response(todos: self.todoList, popupTitle: self.popupTitle, popupMessage: self.popupMessage, popupCancelText: "error.button.cancel".localized, popupActionText: self.popupAction)
            self.presenter?.presentCreateTodo(response)
        }
        
    }
    
    func getDeletePopUpText(_ request: TodosList.LaunchDeletePopup.Request) {
        let response = TodosList.LaunchDeletePopup.Response(
            todoIndex: request.todoIndex,
            popupTitle: "todos.list.scene.popup.deletetodo.title".localized,
            popupYesText: "popup.button.yes".localized,
            popupNoText: "popup.button.no".localized)
        self.presenter?.presentDeletePopUpText(response)
    }
    
    func getDeleteTodo(_ request: TodosList.DeleteTodo.Request) {
        
        worker.deleteTodo(todoId: "\(request.todoId)")  {  result in
            switch result {
            case .success(let deletedTodo) :
                self.todoList.remove(at: request.todoIndex)
                print("*** Success: \(deletedTodo)")
                self.popupTitle = "popup.success.title".localized
                self.popupMessage = "todos.list.scene.popup.button.deletesuccess.message".localized
                self.popupAction = ""
            case .failure(let error) :
                self.popupTitle = "popup.error.title".localized
                self.popupMessage = "\("todos.list.scene.error.delete.message".localized):\n\(error.localizedDescription)"
                self.popupAction = "error.button.tryagain".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.DeleteTodo.Response(todos: self.todoList, popupTitle: self.popupTitle, popupMessage: self.popupMessage, popupCancelText: "error.button.cancel".localized, popupActionText: self.popupAction)
            self.presenter?.presentDeleteTodo(response)
        }
        
    }
       
    func getUpdatePopUpText(_ request: TodosList.LaunchUpdatePopup.Request) {
        let response = TodosList.LaunchUpdatePopup.Response(
            todoIndex: request.todoIndex,
            popupTitle: "todos.list.scene.popup.updatetodo.title".localized,
            popupUpdateText: "todos.list.scene.popup.updatetodo.button.update".localized,
            popupCancelText: "todos.list.scene.popup.updatetodo.button.cancel".localized)
        self.presenter?.presentUpdatePopUpText(response)
    }
    
    func getUpdateTodo(_ request: TodosList.UpdateTodo.Request) {
        
        worker.updateTodo(updatedTodo: request.UpdatedTodoData)  { result in
            switch result {
            case .success(let todo) :
                self.todoList[request.todoIndex].title = todo.title
                print("*** Success: \(todo)")
                self.popupTitle = "popup.success.title".localized
                self.popupMessage = "todos.list.scene.popup.button.updatesuccess.message".localized
                self.popupAction = ""
            case .failure(let error) :
                self.popupTitle = "popup.error.title".localized
                self.popupMessage = "\("todos.list.scene.error.put.message".localized):\n\(error.localizedDescription)"
                self.popupAction = "error.button.tryagain".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.UpdateTodo.Response(todos: self.todoList, popupTitle: self.popupTitle, popupMessage: self.popupMessage, popupCancelText: "error.button.cancel".localized, popupActionText: self.popupAction)
            self.presenter?.presentUpdateTodo(response)
        }
        
    }
    
    func getCheckPopUpText(_ request: TodosList.LaunchCheckPopup.Request) {
        let popupTitle = request.checked ? "todos.list.scene.popup.unchecktodo.title".localized : "todos.list.scene.popup.checktodo.title".localized
        let response = TodosList.LaunchCheckPopup.Response(
            todoIndex: request.todoIndex,
            popupTitle: popupTitle,
            popupYesText: "popup.button.yes".localized,
            popupNoText: "popup.button.no".localized)
        self.presenter?.presentCheckPopUpText(response)
    }
    
    func getCheckTodo(_ request: TodosList.CheckTodo.Request) {
        
        worker.checkTodo(todoId: "\(request.todoId)", checked: request.todoChecked)  {  result in
            switch result {
            case .success(let checkedTodo) :
                self.todoList[request.todoIndex].completed = checkedTodo.completed
                print("*** Success: \(checkedTodo)")
                self.popupTitle = "popup.success.title".localized
                self.popupMessage = checkedTodo.completed ? "todos.list.scene.popup.button.checkedsuccess.message".localized : "todos.list.scene.popup.button.uncheckedsuccess.message".localized
                self.popupAction = ""
            case .failure(let error) :
                self.popupTitle = "popup.error.title".localized
                self.popupMessage = "\("todos.list.scene.error.check.message".localized):\n\(error.localizedDescription)"
                self.popupAction = "error.button.tryagain".localized
                print("*** Error: \(error.localizedDescription)")
            }
            
            let response = TodosList.CheckTodo.Response(todos: self.todoList, popupTitle: self.popupTitle, popupMessage: self.popupMessage, popupCancelText: "error.button.cancel".localized, popupActionText: self.popupAction)
            self.presenter?.presentCheckTodo(response)
        }
        
    }

}
