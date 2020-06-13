//
//  UserDetailInteractorTests.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 13/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Placeholder
import XCTest

class UserDetailInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: UserDetailInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupUserDetailInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupUserDetailInteractor()
  {
    sut = UserDetailInteractor()
  }
  
  // MARK: Test doubles
  
  class UserDetailPresentationLogicSpy: UserDetailPresentationLogic {
    var presentNavBarDataCalled = false
    var presentViewFieldsCalled = false
    var presentUserInfoCalled = false
    
    func presentNavBarData(_ response: UserDetail.UpdateNavBar.Response) {
        presentNavBarDataCalled = true
      }
    func presentViewFields(_ response: UserDetail.SetViewFields.Response) {
        presentViewFieldsCalled = true
      }
    func presentUserInfo(_ response: UserDetail.SetUserInfo.Response) {
        presentUserInfoCalled = true
      }
 
  }
  
  // MARK: Tests
  
  func testGetNavBarData() {
    // Given
    let spy = UserDetailPresentationLogicSpy()
    sut.presenter = spy
    let request = UserDetail.UpdateNavBar.Request()
    
    // When
    sut.getNavBarData(request)
    
    // Then
    XCTAssertTrue(spy.presentNavBarDataCalled, "getNavBarData(request:) should ask the presenter to format the result")
  }
    
    func testGetViewFields() {
      // Given
      let spy = UserDetailPresentationLogicSpy()
      sut.presenter = spy
      let request = UserDetail.SetViewFields.Request()
      
      // When
      sut.getViewFields(request)
      
      // Then
      XCTAssertTrue(spy.presentViewFieldsCalled, "getViewFields(request:) should ask the presenter to format the result")
    }
    
    func testGetUserInfo() {
      // Given
      let spy = UserDetailPresentationLogicSpy()
      sut.presenter = spy
      let request = UserDetail.SetUserInfo.Request()
      
      // When
      sut.getUserInfo(request)
      
      // Then
      XCTAssertTrue(spy.presentUserInfoCalled, "getUserInfo(request:) should ask the presenter to format the result")
    }
}
