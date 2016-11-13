//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by David  on 13/11/2016.
//
//

import UIKit

class SentMemesTableViewController: UITableViewController, MemeEditorDelegate {
    
    // MARK: Properties

    var sentMemes = [
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        ]

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
        cell.imageView?.image = sentMemes[indexPath.row].memeImage
        cell.textLabel?.text = sentMemes[indexPath.row].textTop + " " +  sentMemes[indexPath.row].textBottom
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

    // MARK: MemeEditorDelegate
    
    func appendMeme(meme: Meme) {
        sentMemes.append(meme)
    }

}
