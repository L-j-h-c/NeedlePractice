//
//  SecondComponent.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit

import NeedleFoundation

protocol SecondDependency: Dependency {
    var service: ImageAPI { get }
    var appTitle: String { get }
}

class SecondComponent: Component<FirstDependency>, SecondBuilder {

    var secondVC: UIViewController {
        return SecondVC()
    }
}

protocol SecondBuilder {
    var secondVC: UIViewController { get }
}
