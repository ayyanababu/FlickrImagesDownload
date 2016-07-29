//
//  ImagesViewController.swift
//  StreamingImages
//
//  Created by Raja Ayyan on 29/07/16.
//  Copyright © 2016 personal. All rights reserved.
//

import UIKit

class ImagesViewController: UITableViewController {
    
    var flickrResults:[FlickrObject]! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPhotos()
    }
    
    
    func loadPhotos(){
        let flickr:FlickrHelper = FlickrHelper()
        flickr.searchFlickrForString("nature") { (searchString, flickrPhotos, error) in
            if error == nil{
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.flickrResults = flickrPhotos
                    //self.collectionView.reloadData()
                    print("photos printed by ayyan \(self.flickrResults)")
                    self.tableView.reloadData()
                    
                })
            }
            
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flickrResults.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("imagecell", forIndexPath: indexPath) as! ImageCell
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue) {
            let photoObject: FlickrObject = self.flickrResults[indexPath.row]
            let imagedata: NSData = NSData(contentsOfURL: photoObject.url)!
            let image:UIImage = UIImage(data: imagedata)!
            
            dispatch_async(dispatch_get_main_queue(), {
                cell.configureCell(image)
            })
            
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
}
