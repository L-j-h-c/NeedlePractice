//
//  SecondVC.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit
import Combine

import SnapKit

final class SecondVC: UIViewController {

    var sharedClass: SharedClass
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = """
        SecondVC
        공유 값 : \(sharedClass.sharedValue)
        """
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
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

extension SecondVC {
    private func setLayout() {
        self.view.addSubview(valueLabel)
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.centerX.equalToSuperview()
        }
    }
}
