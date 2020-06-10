//
//  Todo.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 10/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import Foundation

struct Todo: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
}

