//
//  CategoriesVC.swift
//  Sukkar
//
//  Created by mjeed on 09/12/2023.
//

import UIKit

class CategoriesVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var collectionesCV: UICollectionView!
    
    
    // MARK: - Variables


    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        confgeView()

    }

    // MARK: -  Configure Action - Func
    
    private func confgeView() {
        view.backgroundColor = .systemBackground
        setCollectionView(collectionesCV)
    }
    
    private func setCollectionView(_ conllectionView: UICollectionView ) {
        conllectionView.delegate = self
        conllectionView.dataSource = self
        conllectionView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCell")
    }

    
}



// MARK: -  CollectionView Delegate & DataSource

extension CategoriesVC: UICollectionViewDelegate {
    
}

extension CategoriesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        
        return cell
    }
    
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // numberOfCellsInRow
        let numberOfCellsInRow: CGFloat = 2
        // ConectionViewWidth
        let ConectionViewWidth = collectionView.bounds.width
        // SpacingBetweenCells
        let fayout = collectionViewLayout as! UICollectionViewFlowLayout
        let SpacingBetweenCells = fayout.minimumLineSpacing * (numberOfCellsInRow - 1)
        // adjusWidth = ConectionViewWidth - SpacingBetweenCells
        let adjusWidth = ConectionViewWidth - SpacingBetweenCells
        // width = adjusWidth/numberOfCellsInRow
        let width = floor(adjusWidth/numberOfCellsInRow)
        
        return CGSize(width: width , height: width*0.8092105263)
    }
}
