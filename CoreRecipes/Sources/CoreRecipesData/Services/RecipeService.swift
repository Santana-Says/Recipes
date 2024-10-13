import CoreRecipesDomain
import Foundation

protocol RecipeService {
    func fetchRecipes(fromSource source: RecipeSourceDataType) async throws -> RecipesResponse
}

class RecipeServiceImpl {
    let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    private func getRecipeLink(source: RecipeSourceDataType) -> String {
        switch source {
            case .empty: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
            case .malformed: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
            case .original: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        }
    }
}
 
extension RecipeServiceImpl: RecipeService {
    func fetchRecipes(fromSource source: RecipeSourceDataType) async throws -> RecipesResponse {
        let link = getRecipeLink(source: source)
        let baseURL = URL(string: link)!
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try decoder.decode(RecipesResponse.self, from: data)
    }
}
