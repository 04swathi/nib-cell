

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var DataArray = ["TableViewCell","SecondTableViewCell","TableViewCell"]
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var viewTable: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "TableViewCell")
        let secondnib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableview.register(secondnib, forCellReuseIdentifier: "SecondTableViewCell")
        
        tableview.isEditing = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let _ = DataArray[indexPath.row]
        if indexPath.row == 0 {
            let cell = tableview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.Label?.text = "hello"
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableview.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            cell.secondLabel?.text = "hey you"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        DataArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

        func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
        }
}
