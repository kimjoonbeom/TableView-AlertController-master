//
//  ViewController.swift
//  TableView2
//
//  Created by D7703_18 on 2018. 5. 2..
//  Copyright © 2018년 201550057. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //준범

    @IBOutlet weak var tableview: UITableView!
    
    var animals = ["고양이ONE", "고양이TWO", "고양이THREE", "고양이FOUR", "고양이FIVE"]
    var numbers = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.delegate=self
        tableview.dataSource=self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell = tableview.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let myImage = UIImage(named:"cats.jpg")
        cell.imageView?.image = myImage
        
        cell.textLabel?.text = animals[indexPath.row]
        //cell.detailTextLabel?.text="section= \(indexPath.section) row=\(indexPath.row)"
        
        // cell에 detailText 넣기
        cell.detailTextLabel?.text = numbers[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
          return "1st section"
        } else {
            return "2nd section"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mySection = indexPath.section
        let myRow = indexPath.row
        print("I selected \(mySection) Section \(myRow) Row")
        let output = String(mySection) + " Section" + String(myRow) + " Row" + " Seclected"
        
        // Closure
        let alert = UIAlertController(title: "AlertController", message: "Test", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: output, style: .default) { action in
            // perhaps use action.title here
            print("Default")
            
        })
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action) -> Void in
            print("취소 했습니다.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

