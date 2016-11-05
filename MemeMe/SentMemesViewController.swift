//
//  SentMemesViewController.swift
//  MemeMe
//
//  Created by David  on 05/11/2016.
//
//

import UIKit

class SentMemesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "MemeCell"
    
    let dummyData = [
        "test",
        "test",
        "test"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = dummyData[indexPath.row]
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
