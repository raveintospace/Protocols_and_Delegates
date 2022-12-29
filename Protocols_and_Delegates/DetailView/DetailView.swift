//
//  DetailView.swift
//  Protocols_and_Delegates
//
//  Created by Uri on 24/12/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    
    // MARK: - Properties
    var presenter: DetailPresenterProtocol?
    var delegate: StringProtocol!
    
    var safeArea: UILayoutGuide!
    var detailTextField = UITextField()
    var goToHomeViewButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .magenta
    }
}

extension DetailView: DetailViewProtocol {
    
    func setupDetailView() {
        safeArea = view.layoutMarginsGuide
        setupDetailTextField()
        setupGoToHomeViewButton()
    }
    
    func setupDetailTextField() {
        view.addSubview(detailTextField)
        
        detailTextField.translatesAutoresizingMaskIntoConstraints = false
        detailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        detailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        detailTextField.placeholder = "Insert text for the home view"
        detailTextField.backgroundColor = .white
        detailTextField.textAlignment = .center
        
        // add a maximum lenght for textfield
        // https://developer.apple.com/forums/thread/110754
        // https://www.hackingwithswift.com/example-code/uikit/how-to-limit-the-number-of-characters-in-a-uitextfield-or-uitextview
    }
    
    func setupGoToHomeViewButton() {
        view.addSubview(goToHomeViewButton)
        
        goToHomeViewButton.translatesAutoresizingMaskIntoConstraints = false
        goToHomeViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToHomeViewButton.topAnchor.constraint(equalTo: detailTextField.bottomAnchor, constant: 15).isActive = true
        
        goToHomeViewButton.setTitle("Go to Home View", for: .normal)
        goToHomeViewButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        goToHomeViewButton.setTitleColor(.black, for: .normal)
        
        goToHomeViewButton.addTarget(self, action: #selector(goToHomeViewButtonPressed), for: .touchUpInside)
    }
    
    @objc func goToHomeViewButtonPressed() {
        delegate.didSelectString(detailTextField.text!)
        print("Text from delegate: \(detailTextField.text!)")
        presenter?.goBackToHomeView()
    }
}
