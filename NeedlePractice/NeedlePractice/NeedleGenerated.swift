

import Combine
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class FirstDependency7da73e266af7d243503bProvider: FirstDependency {
    var sharedClass: SharedClass {
        return mainComponent.sharedClass
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->FirstComponent
private func factory18174c17369cf47342b70ae93e637f014511a119(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FirstDependency7da73e266af7d243503bProvider(mainComponent: parent1(component) as! MainComponent)
}
private class FirstDependencycad314f6f9b3242d1c10Provider: FirstDependency {
    var sharedClass: SharedClass {
        return mainComponent.sharedClass
    }
    private let mainComponent: MainComponent
    init(mainComponent: MainComponent) {
        self.mainComponent = mainComponent
    }
}
/// ^->MainComponent->SecondComponent
private func factorybf3761afe12802163eca0ae93e637f014511a119(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FirstDependencycad314f6f9b3242d1c10Provider(mainComponent: parent1(component) as! MainComponent)
}

#else
extension FirstComponent: Registration {
    public func registerItems() {
        keyPathToName[\FirstDependency.sharedClass] = "sharedClass-SharedClass"
    }
}
extension SecondComponent: Registration {
    public func registerItems() {
        keyPathToName[\FirstDependency.sharedClass] = "sharedClass-SharedClass"
    }
}
extension MainComponent: Registration {
    public func registerItems() {


    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->MainComponent->FirstComponent", factory18174c17369cf47342b70ae93e637f014511a119)
    registerProviderFactory("^->MainComponent->SecondComponent", factorybf3761afe12802163eca0ae93e637f014511a119)
    registerProviderFactory("^->MainComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
