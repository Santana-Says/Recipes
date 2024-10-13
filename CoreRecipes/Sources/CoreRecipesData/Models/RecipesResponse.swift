import CoreRecipesDomain
import Foundation

struct RecipesResponse: Decodable {
    let recipes: [Recipe]
}
