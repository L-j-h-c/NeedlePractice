//
//  MainComponent.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit
import NeedleFoundation

class MainComponent: BootstrapComponent {

    var rootViewController: UIViewController {
        return MainVC(
            service: service,
            firstBuilder: firstComponent,
            secondBuilder: secondComponent
        )
    }

    var firstComponent: FirstComponent {
        return FirstComponent(parent: self)
    }

    var secondComponent: SecondComponent {
        return SecondComponent(parent: self)
    }
    
    var appTitle: String {
        return "Needle Parctice"
    }
    
    var service: ImageFetchable {
        shared { ImageAPI() }
    }
}
