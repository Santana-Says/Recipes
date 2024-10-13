import Foundation

protocol RecipeService {
    func fetchRecipes() async throws -> RecipesResponse
}

class RecipeServiceImpl {
    let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}
 
extension RecipeServiceImpl: RecipeService {
    func fetchRecipes() async throws -> RecipesResponse {
        let baseURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try decoder.decode(RecipesResponse.self, from: data)
    }
}
