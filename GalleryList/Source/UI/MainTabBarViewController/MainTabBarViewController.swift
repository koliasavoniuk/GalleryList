//
//  MainTabBarViewController.swift
//  GalleryList
//
//  Created by Mykola Savoniuk on 6/18/18.
//  Copyright © 2018 Mykola Savoniuk. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTabBar()
    }
    
    // MARK: - Private
    
    private func configureTabBar() {
        let listIcon = UIImage(named: PictureName.list_icon.rawValue) ?? UIImage()
        let galleryIcon = UIImage(named: PictureName.gallery_icon.rawValue) ?? UIImage()
        
        let listVC = createNavController(viewController: ListViewController(), with: listIcon)
        let galleryVC = createNavController(viewController: GalleryViewController(), with: galleryIcon)
        
        viewControllers = [listVC, galleryVC]
    }
}
