//
//  Eventcell.swift
//  revelsTask
//
//  Created by Rohit Kuber on 29/12/19.
//  Copyright © 2019 Rohit Kuber. All rights reserved.
//

import UIKit


protocol tableviewcell{
    func clickme(index :Int)
}

class Eventcell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventId: UILabel!
    var cellDelegate: tableviewcell?
    var index: IndexPath?
    
//    @IBOutlet weak var eventTag: UILabel!
    
    func setDetails(eventInfo: EventData){
       eventName.text = eventInfo.name
//        var ttags: String = " "
//                for i in eventInfo.tags
//                {
//                    ttags = ttags + i + " "
//                }
        eventId.text = "\(eventInfo.id)"
//        eventTag.text = ttags
    }
    
    @IBAction func buttonP(_ sender: UIButton){
//        print("Hello")
        cellDelegate?.clickme(index: (index?.row)! )
        
    }
}
