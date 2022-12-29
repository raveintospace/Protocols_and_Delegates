//
//  HomePresenter.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        view?.setupHomeView()
    }
    
    // create a func to show the detail view
    func showDetailView() {
        wireFrame?.presentNewDetailView(from: view!)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

