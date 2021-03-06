//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by David on 13/11/2016.
//
//

import UIKit

private let reuseIdentifier = "MemeCell"

class SentMemesCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var sentMemes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).sentMemes
    }
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
//        self.collectionView!.register(SentMemesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // set up flow layout
        let space: CGFloat = 0.0
        let width = (view.frame.size.width - (2 * space)) / 2.0
        let height = (view.frame.size.height - (2 * space)) / 5.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sentMemes.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SentMemesCollectionViewCell
        cell.backgroundView = UIImageView(image: sentMemes[indexPath.row].originalImage)
        let topLabel = cell.topLabel
        let bottomLabel = cell.bottomLabel
        
        topLabel?.text = sentMemes[indexPath.row].textTop.uppercased()
        topLabel?.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 10)!
        topLabel?.textColor = UIColor.white
        topLabel?.adjustsFontSizeToFitWidth = true
        topLabel?.textAlignment = NSTextAlignment.center
        
        bottomLabel?.text = sentMemes[indexPath.row].textBottom.uppercased()
        bottomLabel?.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 10)!
        bottomLabel?.textColor = UIColor.white
        bottomLabel?.adjustsFontSizeToFitWidth = true
        bottomLabel?.textAlignment = NSTextAlignment.center

        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
