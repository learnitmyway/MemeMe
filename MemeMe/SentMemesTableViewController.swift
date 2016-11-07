//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by David  on 06/11/2016.
//
//

import UIKit

class SentMemesTableViewController: SentMemesViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count;
    }
    
    // fill table with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.imageView?.image = UIImage(named: dummyData[indexPath.row])
        cell.textLabel?.text = dummyData[indexPath.row]
        return cell
    }
    
    // navigate to detail view upon row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailView(indexPath: indexPath)
    }
    
}
