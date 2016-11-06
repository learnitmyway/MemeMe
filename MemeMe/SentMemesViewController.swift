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
    
}
