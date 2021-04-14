//
//  DogListingVM.swift
//  Dog
//
//  Created by Rahul Mayani on 14/04/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class DogListingVM {
    
    // MARK: - Variable -
    // listing data array observe by rxswift
    public var dataArray : BehaviorRelay<[DogModel]> = BehaviorRelay(value: [])
        
    private let disposeBag = DisposeBag()
        
    // MARK: - Init -
    init() {
        
    }
}

// MARK: - Sort by life span -
extension DogListingVM {
    public func sortByLifeSpan() {
        UIAlertController.showBottomSheet(title: "", message: "Sort By:") { [weak self] (sort) in
            guard let self = self else { return }
            var dogs = self.dataArray.value
            dogs.sort { (ele1, ele2) -> Bool in
                var life_span1 = (ele1.breeds.first?.life_span ?? "").split(separator: " ")
                if life_span1.count > 0 {
                    life_span1.removeLast()
                }
                
                var life_span2 = (ele2.breeds.first?.life_span ?? "").split(separator: " ")
                if life_span2.count > 0 {
                    life_span2.removeLast()
                }
                
                var total_life_span1_first = 0
                var total_life_span1_last = 0
                var total_life_span2_first = 0
                var total_life_span2_last = 0
                
                if life_span1.count == 0 {} else if life_span1.count == 1 {
                    total_life_span1_first = (Int(life_span1.first ?? "0") ?? 0)
                } else {
                    total_life_span1_first = (Int(life_span1.first ?? "0") ?? 0)
                    total_life_span1_last = (Int(life_span1.last ?? "0") ?? 0)
                }
                
                if life_span2.count == 0 {} else if life_span2.count == 1 {
                    total_life_span2_first = (Int(life_span2.first ?? "0") ?? 0)
                } else {
                    total_life_span2_first = (Int(life_span2.first ?? "0") ?? 0)
                    total_life_span2_last = (Int(life_span2.last ?? "0") ?? 0)
                }
                
                if sort == .desc {
                    if total_life_span1_first != total_life_span2_first {
                        return total_life_span1_first > total_life_span2_first
                    } else if total_life_span1_last != total_life_span2_last {
                        return total_life_span1_last > total_life_span2_last
                    } else {
                        return false
                    }
                } else {
                    if total_life_span1_first != total_life_span2_first {
                        return total_life_span1_first < total_life_span2_first
                    } else if total_life_span1_last != total_life_span2_last {
                        return total_life_span1_last < total_life_span2_last
                    } else {
                        return false
                    }
                }
            }
            self.dataArray.accept(dogs)
        }
    }
}

// MARK: - API -
extension DogListingVM {
    // get data from server by rxswift with alamofire
    public func getDataFromServer(_ isLoading: Bool = false) {
        
        APIManager.shared.setURL(APIEndPoint.Name.dogsSearch)
        .showIndicator(isLoading)
        .setDeferredAsObservable()
        .subscribeConcurrentBackgroundToMainThreads()
        .subscribe(onNext: { (response) in
            let dogs = DogModel.decodeJsonData(response)
            self.dataArray.accept(dogs)
        }, onError: { (error) in
            UIAlertController.showAlert(title: nil, message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
