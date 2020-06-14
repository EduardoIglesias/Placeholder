//
//  Seeds.swift
//  PlaceholderTests
//
//  Created by Eduardo Iglesias Fernández on 13/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

@testable import Placeholder
import XCTest

struct Seeds {
    
    struct Geos {
        
        static let geoVoid = Geo(
            lat: "latTest",
            lng: "lngTest")
    }
    
    struct Addresses {
        
        static let addressVoid = Address(
            street: "streetTest",
            suite: "suiteTest",
            city: "cityTest",
            zipcode: "zipcodeTest",
            geo: Seeds.Geos.geoVoid)
    }
    
    struct Companies {
        
        static let companyVoid = Company(
            name: "nameTest",
            catchPhrase: "catchPhraseTest",
            bs: "bsTest")
    }
    
    struct Users {
        
        static let userTest = User(
            id: 0,
            name: "nameTest",
            username: "usernameTest",
            email: "emailTest",
            address: Seeds.Addresses.addressVoid,
            phone: "phoneTest",
            website: "websiteTest",
            company: Seeds.Companies.companyVoid)
        
        static let userFormmatedTest = UserFormatted(
            username: "usernameTest",
            email: "emailTest",
            address: "addressTest",
            phone: "phoneTest",
            website: "websiteTest",
            companyName: "companyNameTest")
        
    }
    
    struct UserFierldsStructs {
        
        static let userFieldTest = UserFields(
            usernameTitle: "usernameTitleTest",
            emailTitle: "emailTitleTest",
            addressTitle: "addressTitleTest",
            phoneTitle: "phoneTitleTest",
            websiteTitle: "websiteTitleTest",
            companyTitle: "companyTitleTest",
            todosAccessButtonText: "todosAccessButtonTextTest")
        
    }
    
    struct Todos {
        static let todoTest = Todo(
            userId: 0,
            id: 0,
            title: "titleTest",
            completed: true)
        
        static let deletedTodo = DeletedTodo()
    }
    
    struct NavBarDatas {
        
        static let navBarDataTest = NavigationBarData(
            title: "TitleTest",
            backTitle: "backTest",
            iconImage: UIImage(named: Constants.ImageNames.UserIcon),
            rightButtonImage: UIImage(named: Constants.ImageNames.CloseIcon))
        
        static let navBarDataVoid = NavigationBarData(
            title: "titleTest",
            backTitle: "backTitleTest",
            iconImage: nil,
            rightButtonImage: nil)
    }
    
    struct Errors {
        struct ErrorTest: LocalizedError {
            var title: String?
            var code: Int
        }
    }
}
