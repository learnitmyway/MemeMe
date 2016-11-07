//
//  SentMemesViewController.swift
//  MemeMe
//
//  Created by David  on 05/11/2016.
//
//

import UIKit

class SentMemesViewController: UIViewController, MemeEditorDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = "MemeCell"
    
    var sentMemes = [Meme]()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    @IBAction func showTableView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.alpha = 1
            self.collectionView.alpha = 0
        })
    }
    
    @IBAction func showGridView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.alpha = 0
            self.collectionView.alpha = 1
        })
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sentMemes.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MemeCollectionViewCell
        cell.imageView.image = sentMemes[indexPath.row].memeImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetailView(indexPath: indexPath)
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
