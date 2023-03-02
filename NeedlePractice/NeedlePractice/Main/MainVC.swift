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
    
    private let firstBuilder: FirstBuilder
    private let secondBuilder: SecondBuilder
    private let sharedClass: SharedClass
    
    // MARK: - UI Components
    
    private lazy var firstButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("첫 번째 페이지", for: .normal)
        bt.setTitleColor(.black, for: .normal)
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
        bt.setTitleColor(.black, for: .normal)
        bt.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.present(self.secondBuilder.secondVC, animated: true)
            },
            for: .touchUpInside
        )
        return bt
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "공유 값 : \(sharedClass.sharedValue)"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    init(
        firstBuilder: FirstBuilder,
        secondBuilder: SecondBuilder,
        sharedClass: SharedClass
    ) {
        self.firstBuilder = firstBuilder
        self.secondBuilder = secondBuilder
        self.sharedClass = sharedClass
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.bind()
        self.setLayout()
    }
}

// MARK: - UI & Layout

extension MainVC {
    private func setLayout() {
        [firstButton, secondButton, valueLabel].forEach {
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
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(secondButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func bind() {
        self.sharedClass.listener = { [weak self] sharedValue in
            guard let self = self else { return }
            self.valueLabel.text = "공유 값 : \(sharedValue)"
        }
    }
}
