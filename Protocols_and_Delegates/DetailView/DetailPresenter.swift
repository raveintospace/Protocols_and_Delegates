//
//  DetailPresenter.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

final class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    func viewDidLoad() {
        view?.setupDetailView()
    }
    
    func goBackToHomeView() {
        wireFrame?.presentHomeView(from: view!)
    }
    
    func trimInputStringToLimit(text: String?) -> String? {
        interactor?.trimInputStringToLimit(text: text)
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}


