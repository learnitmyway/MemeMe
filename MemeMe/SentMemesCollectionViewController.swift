//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by David  on 13/11/2016.
//
//

import UIKit

private let reuseIdentifier = "Cell"

class SentMemesCollectionViewController: UICollectionViewController, MemeEditorDelegate {
    
    // MARK: Properties
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var sentMemes = [
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        Meme(textTop: "textTop", textBottom: "textBottom", originalImage: UIImage(named: "d1")!, memeImage: UIImage(named: "d1")!),
        ]

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // set up flow layout
        let space: CGFloat = 1.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 6.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
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

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sentMemes.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundView = UIImageView(image: sentMemes[indexPath.row].memeImage)
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     // instantiate view controller from storyboard
     let memeDetailVC = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
     
     // set label text
     memeDetailVC.image = sentMemes[indexPath.row].memeImage
     
     // navigate to memeDetailVC
     navigationController!.pushViewController(memeDetailVC, animated: true)

        return true
    }

    // MARK: MemeEditorDelegate
    
    func appendMeme(meme: Meme) {
        sentMemes.append(meme)
    }

}
