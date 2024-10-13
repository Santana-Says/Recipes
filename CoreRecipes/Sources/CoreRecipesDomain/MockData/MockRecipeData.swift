import CoreRecipesDomain

struct MockRecipeData {
    static let recipes: [Recipe] = [
        Recipe(cuisine: "Malaysian",
               name: "Mock Apam Balik",
               photoUrlLarge: "https://example.com/large.jpg", 
               photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
               sourceUrl: "https://nyonyacooking.com",
               uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
               youtubeUrl: "https://youtube.com/apam-balik"),
        Recipe(cuisine: "British",
               name: "Mock Apple & Blackberry Crumble",
               photoUrlLarge: "https://example.com/large.jpg",
               photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
               sourceUrl: "https://bbcgoodfood.com",
               uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f",
               youtubeUrl: "https://youtube.com/apple-blackberry-crumble")
    ]
}
