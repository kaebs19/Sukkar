//
//  CategoriesVC.swift
//  Sukkar
//
//  Created by mjeed on 15/12/2023.
//

import UIKit

class CategoriesVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var productsCV: UICollectionView!
    
    
    // MARK: - Variables
    var categoriesList: [Categories] = [Categories(title: "All", isSelected: true),
                                        Categories(title: "Category one", isSelected: false),
                                        Categories(title: "Category tow", isSelected: false),
                                        Categories(title: "Category therr CategoryCategory", isSelected: false),
                                        Categories(title: "Category therr CategoryCategory", isSelected: false)
    ]
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
}
    
    // MARK: -  Configure Action - Func

   
    
}

extension CategoriesVC {
    func initUI() {
        //CategoriesCell
        setupCV(categoriesCV, "CategoriesCell")
        //ProudectCell

        setupCV(productsCV, "ProudectCell")
    }
    
    func setupCV(_ cv: UICollectionView , _ cellName: String){
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        cv.reloadData()
    }
}

extension CategoriesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(categoriesList[indexPath.row].title)
        
        for index in 0..<categoriesList.count {
        
            categoriesList[index].isSelected = (index == indexPath.row)
            collectionView.reloadData()
            
        }
    }
    
}

extension CategoriesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0 :
            return categoriesList.count
        default:
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            let date = categoriesList[indexPath.row]
            cell.titleLable.text = date.title
            cell.titleLable.textColor = UIColor(named: date.isSelected ? Colors.C0079FB.rawValue: Colors.C2E2E2E.rawValue) //
            cell.mainView.addBorder(borderColor: date.isSelected ? .C0079FB : .C2E2E2E, whithSize: 1 )
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProudectCell", for: indexPath) as! ProudectCell
            return cell

        }
    }
    
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let cellWidth = calculateCellWidth(title: categoriesList[indexPath.row].title)
            
            let cellectionViewHeight = collectionView.bounds.height

            return CGSize(width: cellWidth, height: cellectionViewHeight)
        default:
            
            /// numberOfCellsInRow
            let numberOfCellsInRow: CGFloat = 2
            //collectionViewWidth
            let collectionViewWidth = collectionView.bounds.width
            //flowLayout
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            //spacingBetweenCells * numberOfCellsInRow - 1
            let spacingBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfCellsInRow  - 1)
            /// adjustWidth collectionViewWidth - spacingBetweenCells
            let adjustWidth = collectionViewWidth - spacingBetweenCells
            /// width = adjustWidth/numberOfCellsInRow
            let width = floor(adjustWidth/numberOfCellsInRow)
            /// height = width * sizeHeight
            let height = width * 0.8092105263
            return CGSize(width: width, height: height)
        }
    }
    
    private func calculateCellWidth(title: String) -> CGFloat {
        
        let cell = Bundle.main.loadNibNamed("CategoriesCell", owner: self)?.first as! CategoriesCell
        cell.titleLable.text = title
        let fittingSiez = CGSize(width: UIView.layoutFittingCompressedSize.width, height: cell.bounds.height)
        let size = cell.contentView.systemLayoutSizeFitting(fittingSiez)
        return size.width
    }

    
}
