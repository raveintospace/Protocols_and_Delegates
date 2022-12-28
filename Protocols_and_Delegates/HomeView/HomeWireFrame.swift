//
//  HomeWireFrame.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    static func createHomeModule() -> UINavigationController {
        let view = HomeView()
        let navController = UINavigationController(rootViewController: view)
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return navController
    }
    
    func presentNewDetailView(from view: HomeViewProtocol) {
        let newDetailView = DetailWireFrame.createDetailModule() as! DetailView
        
        let viewController = view as! HomeView
        viewController.navigationController?.pushViewController(newDetailView, animated: true)
        
        newDetailView.delegate = viewController
    }
}
