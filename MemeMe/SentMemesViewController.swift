//
//  SentMemesViewController.swift
//  MemeMe
//
//  Created by David  on 05/11/2016.
//
//

import UIKit

class SentMemesViewController: UIViewController, MemeEditorDelegate {
    
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var collectionContainerView: UIView!
    
    let cellIdentifier = "MemeCell"
    
//    var sentMemes = [Meme]()
    var sentMemes = [
        Meme(textTop: "testTOP", textBottom: "testBOTTOM", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d2")!)
    ]
    
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
        memeDetailVC.image = sentMemes[indexPath.row].memeImage
        
        // navigate to memeDetailVC
        navigationController!.pushViewController(memeDetailVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier else { return }
        
        switch segueId {
        case "MemeEditorSegue":
            let destVC = segue.destination as! MemeEditorViewController
            destVC.memeEditorDelegate = self
            break
        default:
            break
        }
    }
    
    func appendMeme(meme: Meme) {
        sentMemes.append(meme)
    }
    
}
