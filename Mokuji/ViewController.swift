//
//  ViewController.swift
//  Mokuji
//
//  Created by katata on 2015/06/09.
//  Copyright (c) 2015年 FullSail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    struct Item {
        var name:String = ""
        var kana:String = ""
        var id:String = ""
    }
    var mItems:[[String:Any]] = [];
    var mInitials:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mItems.append([
            "initials":"あ",
            "value":[
                Item(name:"相原",kana:"あいはら",id:""),
                Item(name:"秋山",kana:"あきやま",id:""),
                Item(name:"足立",kana:"あだち",id:""),
                Item(name:"穴沢",kana:"あなざわ",id:""),
                Item(name:"伊藤",kana:"いとう",id:""),
                Item(name:"今井",kana:"いまい",id:""),
                Item(name:"牛山",kana:"うしやま",id:""),
                Item(name:"内山",kana:"うちやま",id:""),
                Item(name:"うんち",kana:"うんち",id:"")
            ]
            ])
        mItems.append([
            "initials":"か",
            "value":[
                Item(name:"柿崎",kana:"かきざき",id:""),
                Item(name:"堅田",kana:"かたた",id:""),
                Item(name:"片山",kana:"かたやま",id:"")
            ]
            ])
        mItems.append([
            "initials":"さ",
            "value":[
                Item(name:"佐藤",kana:"さとう",id:""),
                Item(name:"篠原",kana:"しのはら",id:""),
                Item(name:"清水",kana:"しみず",id:""),
                Item(name:"菅原",kana:"すがわら",id:""),
                Item(name:"須藤",kana:"すどう",id:"")
            ]
            ])
        mItems.append([
            "initials":"な",
            "value":[
                Item(name:"長井",kana:"ながい",id:"")
            ]
            ])
        mItems.append([
            "initials":"は",
            "value":[
                Item(name:"比留間",kana:"ひるま",id:""),
                Item(name:"福島",kana:"ふくしま",id:""),
                Item(name:"福田",kana:"ふくだ",id:""),
                Item(name:"別所",kana:"べっしょ",id:""),
                Item(name:"保谷",kana:"ほうや",id:""),
                Item(name:"本名",kana:"ほんな",id:"")
            ]
            ])
        mItems.append([
            "initials":"ま",
            "value":[
                Item(name:"松本",kana:"まつもと",id:""),
                Item(name:"馬渕",kana:"まぶち",id:""),
                Item(name:"三宅",kana:"みやけ",id:""),
                Item(name:"森",kana:"もり",id:"")
            ]
            ])
        mItems.append([
            "initials":"a",
            "value":[
                Item(name:"adam",kana:"adam",id:"")
            ]
            ])
        
        
        for item in mItems{
            if let initials = item["initials"] as? String{
                mInitials.append(initials)
            }
        }
        
        var screenFrame = UIScreen.mainScreen().bounds
        
        var tv = UITableView(frame: CGRectMake(0, 50, screenFrame.width, screenFrame.height - 50))
        tv.delegate = self
        tv.dataSource = self
        tv.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tv)
        
        var segment = UISegmentedControl(items: ["芸人別", "番組別"])
        segment.center = CGPointMake(self.view.center.x, 90)
        ///self.view.addSubview(segment)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mInitials.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(mItems.count <= section){
            return 0
        }
        if let items = mItems[section]["value"] as? [Item]{
            return items.count
        }
        return 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        if(mItems.count <= indexPath.section){
            return cell
        }
        if let items = mItems[indexPath.section]["value"] as? [Item]{
            if(indexPath.row < items.count){
                cell.textLabel?.text = items[indexPath.row].name
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if(mItems.count <= section){
            return ""
        }
        return mItems[section]["initials"] as? String
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]!{
        return mInitials
    }
}

