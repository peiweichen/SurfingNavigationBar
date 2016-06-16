//
//  DemoViewController2.swift
//  SurfingNavigationBarDemo
//
//  Created by chenpeiwei on 6/15/16.
//  Copyright © 2016 chenpeiwei. All rights reserved.
//

import UIKit

import UIKit


class DemoViewController2: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        titleLabel.contentMode = .Center
        titleLabel.text = "AlphaDemo"
        let titleFont : UIFont = UIFont(name: "American Typewriter", size: 18.0)!
        titleLabel.font = titleFont
        titleLabel.textColor = UIColor.whiteColor()
        
        self.navigationItem.titleView = titleLabel
        
        self.tableView.backgroundColor = UIColor.blackColor()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .None
        
        self.navigationController?.navigationBar.surfing_setBackgroundColor(UIColor(red: 208/255.0, green: 47/255.0, blue: 17/255.0, alpha: 1.0))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "RightButton", style: .Plain, target: self, action: nil)
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetY = fabs(scrollView.contentOffset.y)
        let offsetAlpha = offsetY%255/255.0
        self.navigationController?.navigationBar.surfing_setElementsAlpha(offsetAlpha)
        
    }
    
    
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")
        cell?.selectionStyle = .None
        cell?.backgroundColor = UIColor.clearColor()
        
        let imageView = UIImageView(image: UIImage(named: "surfing_sunset.jpg"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        cell?.contentView.addSubview(imageView)
        
        cell?.contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: cell?.contentView, attribute: .Top, multiplier: 1, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: cell?.contentView, attribute: .Leading, multiplier: 1, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: cell?.contentView, attribute: .Trailing, multiplier: 1, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: cell?.contentView, attribute: .Bottom, multiplier: 1, constant: 0))
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
}
