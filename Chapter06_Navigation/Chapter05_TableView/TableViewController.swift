//
//  TableViewController.swift
//  Chapter05_TableView
//
//  Created by UCOM-02 on 2022/11/9.
//

import UIKit

class TableViewController: UITableViewController {
    
    // UI
    @IBOutlet weak var noDataView: UIView!
    // Data
    var filePath: String! = ""
    var doList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func initSubView(){
        noDataView.isHidden = !doList.isEmpty
    }
    
    func initData(){
        doList = [String]()
        
        filePath = "\(NSHomeDirectory())/Documents/data.plist"
        
        let fileMgr = FileManager.default
        if !fileMgr.fileExists(atPath: filePath){
            if let src = Bundle.main.path(forResource: "Tasks", ofType: "plist"){
                try? fileMgr.copyItem(atPath: src, toPath: filePath)
            }
        }else{
        }
        reloadPage()
    }
    
    func reloadPage(){
        if let array = NSArray(contentsOfFile: filePath) as? [String]{
            doList = array
        }
        noDataView.isHidden = !doList.isEmpty
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return doList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let data = doList[indexPath.row]
        
        if #available(iOS 14.0, *){
            var config = cell.defaultContentConfiguration()
            config.text = data
            cell.contentConfiguration = config
        }else{
            cell.textLabel?.text = data
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "清單 💎"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            doList.remove(at: indexPath.row)
            
            (doList as NSArray).write(toFile: filePath, atomically: true)
            tableView.deleteRows(at: [indexPath], with: .fade)
            reloadPage()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let okAction = UIContextualAction(style: .normal, title: "OK") { act, view, handler in
            print("OK")
            
            let app = UIApplication.shared
            app.open(URL(string: "https://www.google.com.tw")!)
            handler(true)
        }
        
        okAction.backgroundColor = UIColor.green
        
        return UISwipeActionsConfiguration(actions: [okAction])
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let nextView = segue.destination as? EditorViewController{
            nextView.filePath = filePath
            nextView.newOrEdit = segue.identifier
            if segue.identifier == "Edit"{
                nextView.idx = tableView.indexPathForSelectedRow?.row
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadPage()
    }
    
}
