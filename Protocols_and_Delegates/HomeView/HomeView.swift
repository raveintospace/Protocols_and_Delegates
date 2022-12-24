//
//  HomeView.swift
//  Protocols_and_Delegates
//  https://youtu.be/v7NEplM3ZrY
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    var safeArea: UILayoutGuide!
    let goToDetailViewButton = UIButton()
    let homeLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

extension HomeView: HomeViewProtocol {
    
    func setupHomeView() {
        safeArea = view.layoutMarginsGuide
        setupGoToDetailViewButton()
        setupHomeLabel()
    }
    
    func setupGoToDetailViewButton() {
        view.addSubview(goToDetailViewButton)
        
        goToDetailViewButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToDetailViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        goToDetailViewButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        goToDetailViewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        goToDetailViewButton.setTitle("Go to Detail View", for: .normal)
        goToDetailViewButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        goToDetailViewButton.setTitleColor(.black, for: .normal)
        
        goToDetailViewButton.addTarget(self, action: #selector(goToDetailViewAction), for: .touchUpInside)
    }
    
    func setupHomeLabel() {
        view.addSubview(homeLabel)
        
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeLabel.topAnchor.constraint(equalTo: goToDetailViewButton.bottomAnchor, constant: 15).isActive = true
        
        homeLabel.textColor = .black
        homeLabel.font = UIFont(name: "Verdana", size: 16)
        homeLabel.text = "Label"
    }
    
    @objc func goToDetailViewAction() {
        presenter?.showDetailView()
    }
    
}
