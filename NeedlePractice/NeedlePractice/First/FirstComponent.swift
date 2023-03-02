//
//  FirstComponent.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit

import NeedleFoundation

protocol FirstDependency: Dependency {
    var sharedClass: SharedClass { get }
}

class FirstComponent: Component<FirstDependency>, FirstBuilder {
    var firstVC: UIViewController {
        return FirstVC(sharedClass: dependency.sharedClass)
    }
}

protocol FirstBuilder {
    var firstVC: UIViewController { get }
}
