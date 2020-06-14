//
//  TodosListInteractorTests.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 14/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Placeholder
import XCTest

class TodosListInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: TodosListInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupTodosListInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupTodosListInteractor()
    {
        sut = TodosListInteractor()
    }
    
    // MARK: Test doubles
    
    class TodosListPresentationLogicSpy: TodosListPresentationLogic {
        
        var presentNavBarDataCalled = false
        var presentNoDataTextCalled = false
        var presentFetchedTodosCalled = false
        var presentCreatePopUpTextCalled = false
        var presentCreateTodoCalled = false
        var presentDeletePopUpTextCalled = false
        var presentDeleteTodoCalled = false
        var presentUpdatePopUpTextCalled = false
        var presentUpdateTodoCalled = false
        var presentCheckPopUpTextCalled = false
        var presentCheckTodoCalled = false
        
        func presentNavBarData(_ response: TodosList.UpdateNavBar.Response) {
            presentNavBarDataCalled = true
        }
        func presentNoDataText(_ response: TodosList.SetText.Response) {
            presentNoDataTextCalled = true
        }
        func presentFetchedUsers(_ response: TodosList.FetchTodos.Response) {
            presentFetchedTodosCalled = true
        }
        
        func presentFetchedTodos(_ response: TodosList.FetchTodos.Response) {
            presentFetchedTodosCalled = true
        }
        
        func presentCreatePopUpText(_ response: TodosList.LaunchCreatePopup.Response) {
            presentCreatePopUpTextCalled = true
        }
        
        func presentCreateTodo(_ response: TodosList.CreateTodo.Response) {
            presentCreateTodoCalled = true
        }
        
        func presentDeletePopUpText(_ response: TodosList.LaunchDeletePopup.Response) {
            presentDeletePopUpTextCalled = true
        }
        
        func presentDeleteTodo(_ response: TodosList.DeleteTodo.Response) {
            presentDeleteTodoCalled = true
        }
        
        func presentUpdatePopUpText(_ response: TodosList.LaunchUpdatePopup.Response) {
            presentUpdatePopUpTextCalled = true
        }
        
        func presentUpdateTodo(_ response: TodosList.UpdateTodo.Response) {
            presentUpdateTodoCalled = true
        }
        
        func presentCheckPopUpText(_ response: TodosList.LaunchCheckPopup.Response) {
            presentCheckPopUpTextCalled = true
        }
        
        func presentCheckTodo(_ response: TodosList.CheckTodo.Response) {
            presentCheckTodoCalled = true
        }
        
    }
    
    class TodosListWorkingLogicSpy: TodosListWorkingLogic {
        var isFailure = false
        var error = Seeds.Errors.ErrorTest(
            title: "errorTest",
            code: 0)
        
        var presentFetchedUsersCalled = false
        
        
        func fetchTodos(for userId: String, completion: @escaping (Result<[Todo]>) -> Void) {
            presentFetchedUsersCalled = true
            if isFailure {
                completion(.failure(error))
            } else {
                var data: [Todo] = []
                data.append(Seeds.Todos.todoTest)
                completion(.success(data))
            }
        }
        
        func createTodo(newTodo: Todo, completion: @escaping (Result<Todo>) -> Void) {
            presentFetchedUsersCalled = true
            if isFailure {
                completion(.failure(error))
            } else {
                let data = Seeds.Todos.todoTest
                completion(.success(data))
            }
        }
        
        func deleteTodo(todoId: String, completion: @escaping (Result<DeletedTodo>) -> Void) {
            presentFetchedUsersCalled = true
            if isFailure {
                completion(.failure(error))
            } else {
                let data = Seeds.Todos.deletedTodo
                completion(.success(data))
            }
        }
        
        func updateTodo(updatedTodo: Todo, completion: @escaping (Result<Todo>) -> Void) {
            presentFetchedUsersCalled = true
            if isFailure {
                completion(.failure(error))
            } else {
                let data = Seeds.Todos.todoTest
                completion(.success(data))
            }
        }
        
        func checkTodo(todoId: String, checked: Bool, completion: @escaping (Result<Todo>) -> Void) {
            presentFetchedUsersCalled = true
            if isFailure {
                completion(.failure(error))
            } else {
                let data = Seeds.Todos.todoTest
                completion(.success(data))
            }
        }
    }
    
    // MARK: Tests
    
    func testGetNavBarData() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.UpdateNavBar.Request()
        
        // When
        sut.getNavBarData(request)
        
        // Then
        XCTAssertTrue(spy.presentNavBarDataCalled, "getNavBarData(request:) should ask the presenter to format the result")
    }
    
    func testGetNoDataText() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.SetText.Request()
        
        // When
        sut.getNoDataText(request)
        
        // Then
        XCTAssertTrue(spy.presentNoDataTextCalled, "getNoDataText(request:) should ask the presenter to format the result")
    }
    
    func testFetchTodos() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.FetchTodos.Request()
        let workerSpy = TodosListWorkingLogicSpy()
        workerSpy.isFailure = true
        sut.worker = workerSpy
        
        // When
        sut.fetchTodos(request)
        
        // Then
        XCTAssert(spy.presentFetchedTodosCalled, "fetchTodos(request:) should ask the presenter to format the result")
    }
    
    func testGetCreatePopUpText() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.LaunchCreatePopup.Request()
        
        // When
        sut.getCreatePopUpText(request)
        
        // Then
        XCTAssert(spy.presentCreatePopUpTextCalled, "getCreatePopUpText(request:) should ask the presenter to format the result")
    }
    
    func testGetCreateTodo() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.CreateTodo.Request(newTodoData: Seeds.Todos.todoTest)
        let workerSpy = TodosListWorkingLogicSpy()
        workerSpy.isFailure = true
        sut.worker = workerSpy
        
        // When
        sut.getCreateTodo(request)
        
        // Then
        XCTAssert(spy.presentCreateTodoCalled, "getCreateTodo(request:) should ask the presenter to format the result")
    }
    
    func testGetDeletePopUpText() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.LaunchDeletePopup.Request(todoIndex: 0)
        
        // When
        sut.getDeletePopUpText(request)
        
        // Then
        XCTAssert(spy.presentDeletePopUpTextCalled, "getDeletePopUpText(request:) should ask the presenter to format the result")
    }
    
    func testGetDeleteTodo() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.DeleteTodo.Request(todoId: 0, todoIndex: 0)
        let workerSpy = TodosListWorkingLogicSpy()
        workerSpy.isFailure = true
        sut.worker = workerSpy
        
        // When
        sut.getDeleteTodo(request)
        
        // Then
        XCTAssert(spy.presentDeleteTodoCalled, "getDeleteTodo(request:) should ask the presenter to format the result")
    }
    
    func testGetUpdatePopUpText() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.LaunchUpdatePopup.Request(todoIndex: 0)
        
        // When
        sut.getUpdatePopUpText(request)
        
        // Then
        XCTAssert(spy.presentUpdatePopUpTextCalled, "getUpdatePopUpText(request:) should ask the presenter to format the result")
    }
    
    func testGetUpdateTodo() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.UpdateTodo.Request( todoIndex: 0, UpdatedTodoData: Seeds.Todos.todoTest)
        let workerSpy = TodosListWorkingLogicSpy()
        workerSpy.isFailure = true
        sut.worker = workerSpy
        
        // When
        sut.getUpdateTodo(request)
        
        // Then
        XCTAssert(spy.presentUpdateTodoCalled, "getDeleteTodo(request:) should ask the presenter to format the result")
    }
    
    func testGetCheckPopUpText() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.LaunchCheckPopup.Request(todoIndex: 0, checked: true)
        
        // When
        sut.getCheckPopUpText(request)
        
        // Then
        XCTAssert(spy.presentCheckPopUpTextCalled, "getCheckPopUpText(request:) should ask the presenter to format the result")
    }
    
    func testGetCheckTodo() {
        // Given
        let spy = TodosListPresentationLogicSpy()
        sut.presenter = spy
        let request = TodosList.CheckTodo.Request(todoId: 0, todoChecked: true, todoIndex: 0)
        let workerSpy = TodosListWorkingLogicSpy()
        workerSpy.isFailure = true
        sut.worker = workerSpy
        
        // When
        sut.getCheckTodo(request)
        
        // Then
        XCTAssert(spy.presentCheckTodoCalled, "getCheckTodo(request:) should ask the presenter to format the result")
    }
}
