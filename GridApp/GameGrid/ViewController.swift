//
//  ViewController.swift
//  GameGrid
//
//  Created by Kartik Sharma on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fldRows: UITextField!
    @IBOutlet weak var fldColumns: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func generateButtonTapped( _ sender: UIButton) {
        let vc = GridViewController()
        vc.numberOfRows = (Int)(fldRows.text!)!
        vc.numberOfColumns = (Int)(fldColumns.text!)!
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

