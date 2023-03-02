//
//  ViewController.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit

import SnapKit
import Combine

final class MainVC: UIViewController {
    
    // MARK: - Properties
    
    private let service: ImageFetchable
    private let firstBuilder: FirstBuilder
    private let secondBuilder: SecondBuilder
    
    // MARK: - UI Components
    
    private lazy var firstButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("첫 번째 페이지", for: .normal)
        bt.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.present(self.firstBuilder.firstVC, animated: true)
            },
            for: .touchUpInside
        )
        return bt
    }()
    
    private lazy var secondButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("두 번째 페이지", for: .normal)
        bt.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.present(self.secondBuilder.secondVC, animated: true)
            },
            for: .touchUpInside
        )
        return bt
    }()
    
    init(service: ImageFetchable, firstBuilder: FirstBuilder, secondBuilder: SecondBuilder) {
        self.service = service
        self.firstBuilder = firstBuilder
        self.secondBuilder = secondBuilder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UI & Layout

extension MainVC {
    private func setLayout() {
        [firstButton, secondButton].forEach {
            self.view.addSubview($0)
        }
        
        firstButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.centerX.equalToSuperview()
        }
        
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
