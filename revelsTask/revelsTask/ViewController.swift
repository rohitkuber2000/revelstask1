//
//  ViewController.swift
//  revelsTask
//
//  Created by Rohit Kuber on 29/12/19.
//  Copyright © 2019 Rohit Kuber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
      var revEvents = [EventData]()
    var event = [Int]()
    
    let defaults = UserDefaults.standard
        override func viewDidLoad() {
            super.viewDidLoad()
            
           populateData()
            
                
            }
    
        
        func populateData(){
            EventDetails.shareInstance.getDetails{ [weak self] result in
                      switch result{
                      case  .failure(let error):
                            print(error)
                      case .success(let details):
                          self?.revEvents = details
                          self?.filt()
                      
                  }
}
            
}
    
    
    
    func filt(){
        self.filteredEvents = self.revEvents.filter{ (e) -> Bool in
            return e.tags.contains(self.tag)
                                        }
                              
    }
     var tag:String = "tag1"
    var filteredEvents = [EventData](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            
        }
        
    }
//    for filling the array
//    defaults.set(self.event, forKey)
}
    

extension ViewController : UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//     print(revEvents.count)
        print("Hello World")
        return filteredEvents.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tcell") as! Eventcell

        let eventInfo = filteredEvents[indexPath.row]
        cell.setDetails( eventInfo : eventInfo)
        cell.cellDelegate = self
        cell.index = indexPath
        
        return cell
        
    }
    
}

extension ViewController: tableviewcell{
    func clickme(index: Int) {
        event.append(filteredEvents[index].id)
        defaults.set(event,forKey:"eventBook")
    }
    

}
