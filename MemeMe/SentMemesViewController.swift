//
//  SentMemesViewController.swift
//  MemeMe
//
//  Created by David  on 05/11/2016.
//
//

import UIKit

class SentMemesViewController: UIViewController {
    
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var collectionContainerView: UIView!
    
    let cellIdentifier = "MemeCell"
    
    var sentMemes: Meme?
    
    let dummyData = [
        "d1",
        "d2",
        "d3"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func showTableView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5, animations: {
            self.tableContainerView.alpha = 1
            self.collectionContainerView.alpha = 0
        })
    }
    
    @IBAction func showGridView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5, animations: {
            self.tableContainerView.alpha = 0
            self.collectionContainerView.alpha = 1
        })
    }
    
    func openDetailView(indexPath: IndexPath) {
        // instantiate view controller from storyboard
        let memeDetailVC = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        // set label text
        memeDetailVC.imageName = dummyData[indexPath.row]
        
        // navigate to memeDetailVC
        navigationController!.pushViewController(memeDetailVC, animated: true)
    }
    
}
