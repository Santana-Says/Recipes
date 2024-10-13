import CoreRecipesDomain
import Foundation
import Swinject

public class CoreRecipesPresentationRoot {
    static var sharedContainer = Container()
    
    public init(rootContainer: Container) {
        CoreRecipesPresentationRoot.sharedContainer = rootContainer
    }
}

extension CoreRecipesPresentationRoot: DependencyInjectionRoot {
    public func registerRoot() {
        
    }
}
