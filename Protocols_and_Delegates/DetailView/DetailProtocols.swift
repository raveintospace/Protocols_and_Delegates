//
//  DetailProtocols.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func setupDetailView()
}

protocol DetailWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createDetailModule() -> UIViewController
    
    func presentHomeView(from view: DetailViewProtocol)
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func goBackToHomeView()
    
    func trimInputStringToLimit(text: String?) -> String?
}

protocol DetailInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    func trimInputStringToLimit(text: String?) -> String?
}

protocol StringProtocol {
    func didSelectString(_ string: String)
}
