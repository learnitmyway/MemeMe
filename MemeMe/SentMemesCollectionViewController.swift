//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by David  on 06/11/2016.
//
//

import UIKit

class SentMemesCollectionViewController: SentMemesViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
}
