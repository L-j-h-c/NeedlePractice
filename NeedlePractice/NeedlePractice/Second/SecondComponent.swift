//
//  SecondComponent.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit

import NeedleFoundation

protocol SecondDependency: Dependency {
    var appTitle: String { get }
    var sharedClass: SharedClass { get }
}

class SecondComponent: Component<FirstDependency>, SecondBuilder {
    var secondVC: UIViewController {
        return SecondVC(
            sharedClass: dependency.sharedClass
        )
    }
}

protocol SecondBuilder {
    var secondVC: UIViewController { get }
}
