//
//  TodosListPresenterTests.swift
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

class TodosListPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: TodosListPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupTodosListPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupTodosListPresenter()
  {
    sut = TodosListPresenter()
  }
  
  // MARK: Test doubles
  
  class TodosListDisplayLogicSpy: TodosListDisplayLogic
  {
    
    var displayNavBarDataCalled = false
    var displayNoDataTextCalled = false
    var displayFetchedTodosCalled = false
    var displayCreatePopupCalled = false
    var displayCreateTodoCalled = false
    var displayDeletePopupCalled = false
    var displayDeleteTodoCalled = false
    var displayUpdatePopupCalled = false
    var displayUpdateTodoCalled = false
    var displayCheckPopupCalled = false
    var displayCheckTodoCalled = false
    
    func displayNavBarData(_ viewModel: TodosList.UpdateNavBar.ViewModel) {
      displayNavBarDataCalled = true
    }
    func displayNoDataText(_ viewModel: TodosList.SetText.ViewModel) {
      displayNoDataTextCalled = true
    }
    func displayFetchedTodos(_ viewModel: TodosList.FetchTodos.ViewModel) {
      displayFetchedTodosCalled = true
    }
    
    func displayCreatePopup(_ viewModel: TodosList.LaunchCreatePopup.ViewModel) {
        displayCreatePopupCalled = true
    }
    
    func displayCreateTodo(_ viewModel: TodosList.CreateTodo.ViewModel) {
        displayCreateTodoCalled = true
    }
    
    func displayDeletePopup(_ viewModel: TodosList.LaunchDeletePopup.ViewModel) {
        displayDeletePopupCalled = true
    }
    
    func displayDeleteTodo(_ viewModel: TodosList.DeleteTodo.ViewModel) {
        displayDeleteTodoCalled = true
    }
    
    func displayUpdatePopup(_ viewModel: TodosList.LaunchUpdatePopup.ViewModel) {
        displayUpdatePopupCalled = true
    }
    
    func displayUpdateTodo(_ viewModel: TodosList.UpdateTodo.ViewModel) {
        displayUpdateTodoCalled = true
    }
    
    func displayCheckPopup(_ viewModel: TodosList.LaunchCheckPopup.ViewModel) {
        displayCheckPopupCalled = true
    }
    
    func displayCheckTodo(_ viewModel: TodosList.CheckTodo.ViewModel) {
        displayCheckTodoCalled = true
    }

    
  }
  
  // MARK: Tests
  
    func testPresentNavBarData() {
        // Given
        let spy = TodosListDisplayLogicSpy()
        sut.viewController = spy
        let response = TodosList.UpdateNavBar.Response(navData: Seeds.NavBarDatas.navBarDataVoid)
        
        // When
        sut.presentNavBarData(response)
        
        // Then
        XCTAssertTrue(spy.displayNavBarDataCalled, "presentNavBarData(response:) should ask the view controller to display the result")
    }
    
    func testPresentNoDataText() {
        // Given
        let spy = TodosListDisplayLogicSpy()
        sut.viewController = spy
        let response = TodosList.SetText.Response(noDataText: "NodataTextTest")
        
        // When
        sut.presentNoDataText(response)
        
        // Then
        XCTAssertTrue(spy.displayNoDataTextCalled, "presentNavBarData(response:) should ask the view controller to display the result")

    }
    
    func testPresentFetchedUsers() {
         // Given
         let spy = TodosListDisplayLogicSpy()
         sut.viewController = spy
        var todoListTest: [Todo] = []
        todoListTest.append(Seeds.Todos.todoTest)
        
        let response = TodosList.FetchTodos.Response(todos: todoListTest, popupTitle: "popupTitleTest", popupMessage: "popupMessageTest", popupCancelText: "popupCancelTextTest")
         
         // When
         sut.presentFetchedTodos(response)
         
         // Then
         XCTAssertTrue(spy.displayFetchedTodosCalled, "presentFetchedTodos(response:) should ask the view controller to display the result")
     }
    
    func testPresentCreatePopUpText() {
         // Given
         let spy = TodosListDisplayLogicSpy()
         sut.viewController = spy
        
        let response = TodosList.LaunchCreatePopup.Response(popupTitle: "popupTitleTest", popupCreateText: "popupCreateTest", popupCancelText: "popupCancelTextTest")
         
         // When
         sut.presentCreatePopUpText(response)
         
         // Then
         XCTAssertTrue(spy.displayCreatePopupCalled, "presentCreatePopUpText(response:) should ask the view controller to display the result")
     }
    
    func testPresentCreateTodo() {
         // Given
         let spy = TodosListDisplayLogicSpy()
         sut.viewController = spy
        var todoListTest: [Todo] = []
        todoListTest.append(Seeds.Todos.todoTest)
        
        let response = TodosList.CreateTodo.Response(todos: todoListTest, popupTitle: "popupTitleTest", popupMessage: "popupMessageTest", popupCancelText: "popupCancelTextTest", popupActionText: "popupActionTextTest")
         
         // When
         sut.presentCreateTodo(response)
         
         // Then
         XCTAssertTrue(spy.displayCreateTodoCalled, "presentCreateTodo(response:) should ask the view controller to display the result")
     }
    
    func testPresentDeletePopUpText() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          
        let response = TodosList.LaunchDeletePopup.Response(todoIndex: 0, popupTitle: "popupTitleTest", popupYesText: "popupYesTest", popupNoText: "popupNoTest")
           
           // When
           sut.presentDeletePopUpText(response)
           
           // Then
           XCTAssertTrue(spy.displayDeletePopupCalled, "presentDeletePopUpText(response:) should ask the view controller to display the result")
       }
      
      func testPresentDeleteTodo() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          var todoListTest: [Todo] = []
          todoListTest.append(Seeds.Todos.todoTest)
          
          let response = TodosList.DeleteTodo.Response(todos: todoListTest, popupTitle: "popupTitleTest", popupMessage: "popupMessageTest", popupCancelText: "popupCancelTextTest", popupActionText: "popupActionTextTest")
           
           // When
           sut.presentDeleteTodo(response)
           
           // Then
           XCTAssertTrue(spy.displayDeleteTodoCalled, "presentDeleteTodo(response:) should ask the view controller to display the result")
       }
    
    func testPresentUpdatePopUpText() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          
        let response = TodosList.LaunchUpdatePopup.Response(todoIndex: 0, popupTitle: "popupTitleTest", popupUpdateText: "popupCreateTest", popupCancelText: "popupCancelTextTest")
           
           // When
           sut.presentUpdatePopUpText(response)
           
           // Then
           XCTAssertTrue(spy.displayUpdatePopupCalled, "presentUpdatePopUpText(response:) should ask the view controller to display the result")
       }
      
      func testPresentUpdateTodo() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          var todoListTest: [Todo] = []
          todoListTest.append(Seeds.Todos.todoTest)
          
          let response = TodosList.UpdateTodo.Response(todos: todoListTest, popupTitle: "popupTitleTest", popupMessage: "popupMessageTest", popupCancelText: "popupCancelTextTest", popupActionText: "popupActionTextTest")
           
           // When
           sut.presentUpdateTodo(response)
           
           // Then
           XCTAssertTrue(spy.displayUpdateTodoCalled, "presentUpdateTodo(response:) should ask the view controller to display the result")
       }
    
    func testPresentCheckPopUpText() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          
        let response = TodosList.LaunchCheckPopup.Response(todoIndex: 0, popupTitle: "popupTitleTest", popupYesText: "popupYesTest", popupNoText: "popupNoTextTest")
           
           // When
           sut.presentCheckPopUpText(response)
           
           // Then
           XCTAssertTrue(spy.displayCheckPopupCalled, "presentCheckPopUpText(response:) should ask the view controller to display the result")
       }
      
      func testPresentCheckTodo() {
           // Given
           let spy = TodosListDisplayLogicSpy()
           sut.viewController = spy
          var todoListTest: [Todo] = []
          todoListTest.append(Seeds.Todos.todoTest)
          
          let response = TodosList.CheckTodo.Response(todos: todoListTest, popupTitle: "popupTitleTest", popupMessage: "popupMessageTest", popupCancelText: "popupCancelTextTest", popupActionText: "popupActionTextTest")
           
           // When
           sut.presentCheckTodo(response)
           
           // Then
           XCTAssertTrue(spy.displayCheckTodoCalled, "presentCreateTodo(response:) should ask the view controller to display the result")
       }
}
