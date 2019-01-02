//
//SHSelections.swift
//

import UIKit

public enum SHSelectionType {
    case checkBox
    case radio
}

@objc protocol SHSelectionProtocol:class {
    //CheckBox
    @objc optional func getCheckboxIndex(indexes:[Int])
    @objc optional func getCheckboxItems(items:[String])
    //RadioButton
    @objc optional func getRadioIndex(index:Int)
    @objc optional func getRadioItem(item:String)
}

class SHSelections: UITableView,UITableViewDataSource,UITableViewDelegate{
    
    var items = [String]()
    
    var checkedIcon: UIImage = #imageLiteral(resourceName: "checked.png")
    var unCheckedIcon: UIImage = #imageLiteral(resourceName: "unchecked.png")
    var radioSelectedIcon: UIImage = #imageLiteral(resourceName: "radio_selected.png")
    var radioEmptyIcon: UIImage = #imageLiteral(resourceName: "radio_empty.png")
    
    var selectionDelegate:SHSelectionProtocol?
    var selectionType: SHSelectionType = .checkBox //default type
    
    private var indexArray = [IndexPath]()
    private var indexes = [Int]()
    private var selectedItems = [String]()
    private var selectedIndex = IndexPath()
    private var selectedItem = String()
    
    override func awakeFromNib() {
        self.register(UINib(nibName: "SHSelectionCell", bundle: nil), forCellReuseIdentifier: "SHSelectionCell")
        self.delegate = self
        self.dataSource = self
        self.tableFooterView = UIView()
        self.separatorStyle = .none
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectionType {
        case .checkBox:
            let cell = self.dequeueReusableCell(withIdentifier: "SHSelectionCell", for: indexPath) as! SHSelectionCell
            if indexArray.contains(indexPath){
                cell.icon.image = checkedIcon
            }else{
                cell.icon.image = unCheckedIcon
            }
            cell.itemLabel.text = items[indexPath.row]
            return cell
        case .radio:
            let cell = self.dequeueReusableCell(withIdentifier: "SHSelectionCell", for: indexPath) as! SHSelectionCell
            if selectedIndex ==  indexPath{
                cell.icon.image = radioSelectedIcon
            }else{
                cell.icon.image = radioEmptyIcon
            }
            cell.itemLabel.text = items[indexPath.row]
            return cell
            
        }
        
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectionType {
        case .checkBox:
            if indexArray.contains(indexPath){
                indexArray.remove(at: indexArray.index(of: indexPath)!)
            }else{
                indexArray.append(indexPath)
            }
            indexes = [Int]()
            selectedItems = [String]()
            indexArray.forEach { index in
                indexes.append(index.row)
                selectedItems.append(items[index.row])
            }
            selectionDelegate?.getCheckboxItems?(items: selectedItems)
            selectionDelegate?.getCheckboxIndex?(indexes: indexes)
            self.reloadData()
        case .radio:
            selectedIndex = indexPath
            selectionDelegate?.getRadioItem?(item: items[indexPath.row])
            selectionDelegate?.getRadioIndex?(index: selectedIndex.row)
            self.reloadData()
        }
       
    }
   
}
