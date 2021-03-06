//
//  UsersListViewControllerTests.swift
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

class UsersListViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: UsersListViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupUsersListViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupUsersListViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: Constants.Storyboards.UsersList , bundle: bundle)
    sut = storyboard.instantiateInitialViewController() as? UsersListViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class UsersListBusinessLogicSpy: UsersListBusinessLogic {
    var getNavBarDataCalled = false
    var getNoDataTextCalled = false
    var fetchUsersCalled = false
    var selectUserCalled = false
    
    func getNavBarData(_ request: UsersList.UpdateNavBar.Request)  {
        getNavBarDataCalled = true
    }
    func getNoDataText(_ request: UsersList.SetText.Request)  {
        getNoDataTextCalled = true
    }
    func fetchUsers(_ request: UsersList.FetchUsers.Request)  {
        fetchUsersCalled = true
    }
    func selectUser(_ request: UsersList.SelectUser.Request)  {
        selectUserCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldSetBackgroundColorWhenViewIsLoaded()
  {
    // Given
    let spy = UsersListBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertEqual(sut.view.backgroundColor, UIColor.lightgrey, "backgroundColor textColor should be lightgrey")
    
  }
  
  func testDisplayNavBarData() {
    // Given
    let spy = UsersListBusinessLogicSpy()
    sut.interactor = spy
    let viewModel = UsersList.UpdateNavBar.ViewModel(navData: Seeds.NavBarDatas.navBarDataTest)
    
    // When
    loadView()
    sut.displayNavBarData(viewModel)
    
    // Then
    XCTAssertEqual(sut.customNV.titleLabel.text, "TitleTest", "displayNavBarData(viewModel:) should update the titleLabel text in nav bar")
    XCTAssertEqual(sut.customNV.backTitleLabel.text, "backTest", "displayNavBarData(viewModel:) should update the name text in nav bar")
    XCTAssertEqual(sut.customNV.iconImage.image, UIImage(named: Constants.ImageNames.UserIcon), "displayNavBarData(viewModel:) should update the iconImage image in nav bar")
    XCTAssertEqual(sut.customNV.rightButton.imageView?.image, UIImage(named: Constants.ImageNames.CloseIcon), "displayNavBarData(viewModel:) should update the rightButton image in nav bar")
  }
    
    func testDisplayNoDataText() {
      // Given
        let spy = UsersListBusinessLogicSpy()
        sut.interactor = spy
        let viewModel = UsersList.SetText.ViewModel(noDataText: "noDataTextTest")
      
      // When
      loadView()
      sut.displayNoDataText(viewModel)
      
      // Then
        XCTAssertEqual(sut.noUsersLabel.text, "noDataTextTest", "displayNoDataText(viewModel:) should update the noUsersLabel text in user list view")
    }
    
    func testDisplayFetchedUsers() {
      // Given
        let spy = UsersListBusinessLogicSpy()
        sut.interactor = spy
        var userListTest: [User] = []
        userListTest.append(Seeds.Users.userTest)
        
        let viewModel = UsersList.FetchUsers.ViewModel(users: userListTest, error: "errorTest")
      
      // When
      loadView()
      sut.displayFetchedUsers(viewModel)
      
      // Then
        XCTAssertEqual(sut.usersTableView.isHidden, false, "displayFetchedUsers(viewModel:) should set the usersTableView isHidden true in  user list view")

    }
    
    func testTableViewDidSelectRowAt() {
       // Given
         let spy = UsersListBusinessLogicSpy()
         sut.interactor = spy
         var userListTest: [User] = []
         userListTest.append(Seeds.Users.userTest)
       
       // When
       loadView()
        sut.tableView(sut.usersTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
       
       // Then
        XCTAssertTrue(spy.selectUserCalled, "tableView(didSelectRowAt:) should ask the interactor to set the selected user")

     }
}
