//
//  HomeViewController.swift
//  Numiparis Task
//
//  Created by devireddy k on 10/04/21.
//

import UIKit

class HomeViewController: BaseViewController {
    var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath)as! homeCollectionViewCell
        
        return cell
    }
    
    
}
