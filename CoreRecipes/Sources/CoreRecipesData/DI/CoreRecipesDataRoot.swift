import CoreRecipesDomain
import Foundation
import Swinject

public class CoreRecipesDataRoot {
    static let container = Container()
    
    public init() {
        
    }
}

extension CoreRecipesDataRoot: DependencyInjectionRoot {
    public func registerRoot() {
        let container = CoreRecipesDataRoot.container
        
        container.register(RecipeRepository.self) { _ in
            RecipeRepositoryImpl()
        }
    }
}
