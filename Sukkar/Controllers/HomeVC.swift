//
//  HomeVC.swift
//  Sukkar
//
//  Created by AhmedAbuelmagd on 15/12/2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var slidersCV: UICollectionView!
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var productsCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}
extension HomeVC{
    func initUI(){
        initCV(cvs: [(slidersCV, "HomeSliersCVCell"), (categoriesCV,"HomeCategoriesCVCell"),(productsCV,"HomeProductsCVCell")])
    }
    
    func initCV(cvs: [(collectionView: UICollectionView, cell: String)]) {
        for cv in cvs {
            cv.collectionView.delegate = self
            cv.collectionView.dataSource = self

            // تأكد من تسجيل الـ UICollectionViewCell بشكل صحيح
            cv.collectionView.register(UINib(nibName: cv.cell, bundle: nil), forCellWithReuseIdentifier: cv.cell)
        }
    }

}
extension HomeVC: UICollectionViewDelegate{
    
}
extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0: return 10
        case 1: return 7
        default: return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 0: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSliersCVCell", for: indexPath) as! HomeSliersCVCell
            return cell
        case 1: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoriesCVCell", for: indexPath) as! HomeCategoriesCVCell
            return cell
        default: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductsCVCell", for: indexPath) as! HomeProductsCVCell
            return cell
        }
    }
    
    
}
extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag{
        case 0:
            let collectionViewWidth = collectionView.bounds.width
            let collectionViewHeight = collectionView.bounds.height
            return CGSize(width: collectionViewWidth, height: collectionViewHeight)
        case 1:
            let numberOfCellsInRow: CGFloat = 2
            let collectionViewWidth = collectionView.bounds.width
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let spacingBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfCellsInRow-1)
            let adjustWidth = collectionViewWidth-spacingBetweenCells
            let width = floor(adjustWidth/numberOfCellsInRow)
            return CGSize(width: width, height: width*0.6993464052)
        default:
            let collectionViewHeight = collectionView.bounds.height
            
            return CGSize(width: collectionViewHeight*1.2488262911, height: collectionViewHeight)
        }
    }
}
