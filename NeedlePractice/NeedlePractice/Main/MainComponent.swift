//
//  MainComponent.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit
import NeedleFoundation
import Combine

class MainComponent: BootstrapComponent {
    var rootViewController: UIViewController {
        return MainVC(
            firstBuilder: firstComponent,
            secondBuilder: secondComponent,
            sharedClass: sharedClass
        )
    }

    var firstComponent: FirstComponent {
        return FirstComponent(parent: self)
    }

    var secondComponent: SecondComponent {
        return SecondComponent(parent: self)
    }
    
    var sharedClass: SharedClass {
        shared { SharedClass() }
    }
}

class SharedClass {
    var sharedValue = 1 {
        willSet {
            listener?(newValue)
        }
    }
    
    var listener: ((Int)->Void)?
}
