//
//  RootViewController.swift
//  ReadMoon
//
//  Created by 박현진 on 2022/02/07.
//

import UIKit

internal final class RootViewController: UIViewController {
    private lazy var contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(self.contentView)
        self.contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let naviCon = UINavigationController(rootViewController: MainViewController())
        naviCon.view.frame = self.contentView.bounds
        naviCon.isNavigationBarHidden = true
        self.addChild(naviCon)
        self.contentView.addSubview(naviCon.view)
    }
}
