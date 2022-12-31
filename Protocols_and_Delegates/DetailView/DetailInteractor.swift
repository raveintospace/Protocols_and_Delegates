//
//  DetailInteractor.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    private enum Constants {
        static let maxLength = 15
    }
    
    func trimInputStringToLimit(text: String?) -> String? {
        guard let text = text else { return nil }
        return String(text.prefix(Constants.maxLength))
    }
    
    
    // MARK: Properties
    var presenter: DetailInteractorOutputProtocol?
    
}

