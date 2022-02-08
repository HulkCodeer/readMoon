//
//  SplashViewController.swift
//  ReadMoon
//
//  Created by 박현진 on 2022/02/07.
//

import UIKit

internal final class SplashViewController: CommonBaseViewController {
    private lazy var splashIconImgView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "splashIcon")
        $0.contentMode = .scaleToFill
    }
    
    override func loadView() {
        super.loadView()        
        
        self.view.addSubview(self.splashIconImgView)
        self.splashIconImgView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(186)
            $0.height.equalTo(237)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let _window = UIApplication.shared.windows.first { $0.isKeyWindow }
            _window?.rootViewController = RootViewController()
            _window?.makeKeyAndVisible()
        })
    }
}
