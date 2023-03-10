//
//  DetailWireFrame.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    static func createDetailModule() -> UIViewController {
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentHomeView(from view: DetailViewProtocol) {
        let currentViewController = view as! DetailView
        
        currentViewController.navigationController?.popToRootViewController(animated: true)
    }
}
