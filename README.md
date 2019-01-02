# SHSelections
A sample project demonstrates the usage of SHSelection Class to implement checkbox and radio buttons easily.

[![Swift 4.0](https://img.shields.io/badge/Swift-4-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)]()

<img src="/Screenshots/SHSelections.png" /> 

## Installation
Just drag and drop the SHSelections folder to your project.
#### Cocoapods - updating soon

## Usage

1. Just drag and drop an Table View in storyboard and set Table View class to SHSelections and set an outlet.

<img src="/Screenshots/SS1.png" /> 
 
2. How to configure:
#### Example Code
```swift 
    @IBOutlet weak var checkboxSelection: SHSelections!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkboxSelection.selectionType = .checkbox // by default .checkbox 
        checkboxSelection.items = ["CheckBox item 1","CheckBox item 2","CheckBox item 3","CheckBox item 4"]
        checkboxSelection.checkedIcon = UIImage(named: "some image name")!
        checkboxSelection.unCheckedIcon = UIImage(named: "some image name")!
    }
```
- for checkbox : 
```swift 
selectionType = .checkbox 
```
- for radio button : 
```swift  
selectionType = .radio 
```
- for items to display : 
```swift  
items = ["CheckBox item 1"] \\pass an array of string
```
- for icons(for custom icons) :
```swift
    \\by default it has icons, you can pass custom icons
    \\Check box  
     checkedIcon = UIImage(named: "some image name")!
     unCheckedIcon = UIImage(named: "some image name")!
     \\Radio button
     radioEmptyIcon = UIImage(named: "some image name")!
     radioSelectedIcon = UIImage(named: "some image name")!
                 
 ```
3. Setting delegate : 
#### Example Code
```swift 
    class ViewController: UIViewController,SHSelectionProtocol {

    @IBOutlet weak var checkboxSelection: SHSelections!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        checkboxSelection.selectionDelegate = self
        -
        -
        -
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
```
- to get checkbox selected index array : 
```swift  
func getCheckboxIndex(indexes: [Int]){ } 
```
- to get checkbox selected items array : 
```swift  
func getCheckboxItems(items: [String]){ } 
```
- to get radio button selected index :
```swift 
func getRadioIndex(index: Int){ } 
```
- to get radio button selected item : 
```swift 
func getRadioItem(item: String) 
```
  
## Requirements

* iOS 10.0+

## Example

Download the Sample project.

## Contact

Mail me @: shezadahamed95@gmail.com
