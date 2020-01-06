//
//  EventDetails.swift
//  revelsTask
//
//  Created by Rohit Kuber on 29/12/19.
//  Copyright © 2019 Rohit Kuber. All rights reserved.
//

import Foundation
enum detailError: Error{
    case noDataAvailable
    case canNotProcessData
}
struct  EventDetails {
  static   let shareInstance = EventDetails()
    let resourceURL: URL
    init(){
    let eventURL = "https://api.myjson.com/bins/q1x5o"
    guard let rURL = URL(string: eventURL) else {
    fatalError()
    }
   
    self.resourceURL = rURL
    }
    
    func getDetails(completion: @escaping(Result<[EventData], detailError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data, _ , _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
        
        do{
            let decoder = JSONDecoder()
            let eventResponse = try decoder.decode(EventResponse.self, from: jsonData)
            let EventDatas = eventResponse.data
            completion(.success(EventDatas!))
        }catch{
            completion(.failure(.canNotProcessData))
        }

    }
    dataTask.resume()
              
}
}
