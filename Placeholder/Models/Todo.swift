//
//  Todo.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 10/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import Foundation

struct Todo: Codable {
  let userId: Int
  let id: Int
  var title: String
  var completed: Bool
}

struct NewTodo: Codable {
  let userId: Int
  let title: String
  let completed: Bool
}

struct DeletedTodo: Codable {

}

struct CheckedTodo: Codable {
  let completed: Bool
}

