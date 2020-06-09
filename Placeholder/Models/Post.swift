//
//  Post.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 08/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import Foundation

struct Post: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

