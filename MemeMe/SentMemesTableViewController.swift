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
        return sentMemes.count;
    }
    
    // fill table with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.imageView?.image = sentMemes[indexPath.row].memeImage
        cell.textLabel?.text = sentMemes[indexPath.row].textTop + " " +  sentMemes[indexPath.row].textBottom
        return cell
    }
    
    // navigate to detail view upon row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailView(indexPath: indexPath)
    }
    
}
