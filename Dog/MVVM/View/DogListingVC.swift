//
//  DogListingVC.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class DogListingVC: BaseVC {
    // MARK: - IBOutlet -
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Variable -
    // interaction between view and model by listing view model
    public let listingVM = DogListingVM()
        
    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Bind table view with rxswift
        bindTableViewData()
                
        // Get data from Server
        listingVM.getDataFromServer(true)
        
        // add sort button in nav bar
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItem  = sortButton
    }
    
    // MARK: - Others -
    
    // MARK: - Remove Button -
    @objc func sortButtonTapped() {
        listingVM.sortByLifeSpan()
    }
}

// MARK: - UITableView -
extension DogListingVC {
    
    private func bindTableViewData() {
        
        listingVM.dataArray.bind(to: listTableView.rx.items(cellIdentifier: R.reuseIdentifier.dogListingCell.identifier, cellType: DogListingCell.self))
        {  (row, dog, cell) in
            cell.data = dog
        }.disposed(by: rxbag)
    }
}
