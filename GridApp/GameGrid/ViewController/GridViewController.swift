//
//  GridViewController.swift
//  GameGrid
//
//  Created by Kartik Sharma on 18/12/2023.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberOfColumns = 20
    var numberOfRows = 20
    
    var gridData: [String] = []
    
    var thiefPosition: IndexPath?
    var policePosition: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "GridCollectionCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    flowLayout.minimumInteritemSpacing = 0
                    flowLayout.minimumLineSpacing = 0
                }
        generateGrid()
    }
    
    func generateGrid() {
        gridData = []
        let thiefRow = Int.random(in: 0..<numberOfRows)
        let thiefColumn = Int.random(in: 0..<numberOfColumns)
        let policeRow = Int.random(in: 0..<numberOfRows)
        let policeColumn = Int.random(in: 0..<numberOfColumns)
        
        if thiefRow != policeRow && thiefColumn != policeColumn {
            thiefPosition = IndexPath(row: thiefRow * numberOfColumns + thiefColumn, section: 0)
            policePosition = IndexPath(row: policeRow * numberOfColumns + policeColumn, section: 0)
        } else {
            generateGrid()
        }
        
        for _ in 0..<(numberOfColumns * numberOfColumns) {
            gridData.append("White")
        }
        
        if let thiefPos = thiefPosition, let policePos = policePosition {
            gridData[thiefPos.row] = "Ghost"
            gridData[policePos.row] = "Police"
        }
        
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionCell", for: indexPath) as? GridCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.setUpTitle(with: "\(gridData[indexPath.item])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / CGFloat(numberOfColumns)
            let height = collectionView.frame.height / CGFloat(numberOfRows)
            return CGSize(width: width, height: height)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    
    
    @IBAction func generateButtonTapped( _ sender: UIButton) {
        generateGrid()
    }
}

