//
//  User.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 08/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String?
    let username: String?
    let email: String?
    let address: Address
    let phone: String?
    let website: String?
    let company: Company
}

struct Address: Decodable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo

}

struct Geo: Decodable {
    let lat: String?
    let lng: String?
}

struct Company: Decodable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}

struct UserFormatted: Decodable {
    let username: String?
    let email: String?
    let address: String?
    let phone: String?
    let website: String?
    let companyName: String?
}

struct UserFields: Decodable {
    let usernameTitle: String?
    let emailTitle: String?
    let addressTitle: String?
    let phoneTitle: String?
    let websiteTitle: String?
    let companyTitle: String?
    let todosAccessButtonText: String?
}

