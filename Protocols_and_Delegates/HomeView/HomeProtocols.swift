//
//  HomeProtocols.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func setupHomeView()    // presenter asks view to apply all the code of this func
}

protocol HomeWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UINavigationController
    
    func presentNewDetailView(from view: HomeViewProtocol) // ask the wireframe to show dv
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func showDetailView()
}

protocol HomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
}
