//
//  ViewController.swift
//  UniDemo
//
//  Created by Sadiq on 23/12/15.
//  Copyright © 2015 Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var toolBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!
    
    var arr : [String] = ["1","2","3","4"]
    var txtField : UITextField!
    
    // MARK :- Toolbar buttons
    @IBAction func doneTapped(sender: UIBarButtonItem) {
        self.txtField.resignFirstResponder()
    }
    
    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        self.txtField.resignFirstResponder()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK:- Textfield delegates
    
    func textFieldDidBeginEditing(textField: UITextField) {
        txtField  = textField
        var view = textField.superview
        while(view != nil && !view!.isKindOfClass(UITableViewCell)) {
            view = view?.superview
        }
        let index = tableView.indexPathForCell(view as! UITableViewCell)
        print(index!.row)
        
        switch(index!.row) {
        case 0 :
            arr = ["Developer", "Designer","Tester"]
        case 1 :
            arr = ["1", "2","3","4","5","6","7"]
        case 2 :
            arr = ["Google","Yahoo"]
        default :
            print("")
        }
        
        pickerView.reloadAllComponents()
    }
    
    // MARK:- tableview delegates
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell") as? TableViewCell
        cell?.txtField.inputView = pickerView
        cell?.txtField.inputAccessoryView = toolBar
        
        switch(indexPath.row) {
        case 0 :
            cell?.txtField.placeholder = "Type"
        case 1 :
            cell?.txtField.placeholder = "Experience"
        case 2 :
            cell?.txtField.placeholder = "Company"
        default :
            print("")
        }

        return cell!
        
    }
    // MARK:- pickerview delegates
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

