//
//  ViewController.swift
//  SHSelectionsSample
//


import UIKit

class ViewController: UIViewController, SHSelectionProtocol {
    
    @IBOutlet weak var checkboxSelection: SHSelections!
    @IBOutlet weak var radioButtonSelection: SHSelections!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CheckBox
        checkboxSelection.selectionDelegate = self
        checkboxSelection.items = ["CheckBox item 1","CheckBox item 2","CheckBox item 3","CheckBox item 4"]
        
        radioButtonSelection.selectionType = .radio
        radioButtonSelection.selectionDelegate = self
        radioButtonSelection.items = ["radioButton item 1","radioButton item 2","radioButton item 3","radioButton item 4"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Delegate methods
    //Radio Button selected Index
    func getRadioIndex(index: Int) {
        print(index)
    }
    //Radio Button selected item
    func getRadioItem(item: String) {
        print(item)
    }
    
    //Checkbox all selected Indexes
    func getCheckboxIndex(indexes: [Int]) {
        print(indexes)
    }
    //Checkbox all selected Indexes
    func getCheckboxItems(items: [String]) {
        print(items)
    }
    
}

