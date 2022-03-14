//
//  ViewController.swift
//  NewsBrowser-ViewCode
//
//  Created by Matheus Quirino on 05/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var rootView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        style()
    }
        
    func layout(){
        view.addSubview(rootView)
        rootView.fillParentSafely(within: view)
    }
    
    @objc
    func buttonAction(_ sender: UIButton){
        print("Test!!!!!")
    }

    func style(){
        view.backgroundColor = .systemGray
        rootView.backgroundColor = .systemBackground
    }
}

