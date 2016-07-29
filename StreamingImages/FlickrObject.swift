//
//  FlickrObject.swift
//  StreamingImages
//
//  Created by Raja Ayyan on 29/07/16.
//  Copyright © 2016 personal. All rights reserved.
//

import Foundation

class FlickrObject: NSObject{
    
    var title: String
    var url: NSURL
    
    init(phototitle: String, imageurl: String) {
        self.title = phototitle
        self.url = NSURL(string: imageurl)!
    }
}