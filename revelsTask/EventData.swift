//
//  EventData.swift
//  revelsTask
//
//  Created by Rohit Kuber on 29/12/19.
//  Copyright © 2019 Rohit Kuber. All rights reserved.
//

import Foundation


struct EventResponse: Decodable{
    var success :Bool
    var data : [EventData]?
}


struct EventData: Decodable{
   var name: String
      var shortDesc: String
      var maxTeamSize: Int
      var delCardType: Int
      var category: Int
      var id: Int
    var tags: [String]
}

