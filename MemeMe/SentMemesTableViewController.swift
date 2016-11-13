//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by David  on 13/11/2016.
//
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var sentMemes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).sentMemes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sentMemes.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath)
        cell.imageView?.image = sentMemes[indexPath.row].originalImage
        cell.textLabel?.text = sentMemes[indexPath.row].textTop + " " +  sentMemes[indexPath.row].textBottom
        return cell
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailView(indexPath: indexPath)
    }
    
    func openDetailView(indexPath: IndexPath) {
        // instantiate view controller from storyboard
        let memeDetailVC = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        // set image
        memeDetailVC.image = sentMemes[indexPath.row].originalImage
        
        // navigate to memeDetailVC
        navigationController!.pushViewController(memeDetailVC, animated: true)
    }

}
