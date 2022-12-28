//
//  DetailPresenter.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var delegate: StringProtocol?
    
    func viewDidLoad() {
        view?.setupDetailView()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
