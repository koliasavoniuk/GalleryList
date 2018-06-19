//
//  GalleryViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController/*, UICollectionViewDataSource, UICollectionViewDelegate*/ {

    @IBOutlet var rootView: GalleryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }

    // MARK: - UICollectionViewDataSource
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: "String", for: indexPath)
//    }
    
    // MARK: - Private
    
    private func configureView() {
        self.navigationItem.title = VCTitles.gallery.rawValue
    }
    
//    private func configureCollectionView() {
//        self.rootView.collectionView.register
//    }
}
