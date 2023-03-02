//
//  FirstVC.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit
import Combine

import SnapKit

final class FirstVC: UIViewController {
    
    var sharedClass: SharedClass
    
    private lazy var upButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("FirstVC : UP Button", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.sharedClass.sharedValue += 1
            },
            for: .touchUpInside
        )
        return bt
    }()
    
    init(sharedClass: SharedClass) {
        self.sharedClass = sharedClass
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        self.setLayout()
        super.viewDidLoad()
    }
}

// MARK: - UI & Layout

extension FirstVC {
    private func setLayout() {
        self.view.addSubview(upButton)
        
        upButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.centerX.equalToSuperview()
        }
    }
}
