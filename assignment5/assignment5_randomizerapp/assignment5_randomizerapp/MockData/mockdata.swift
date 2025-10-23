import Foundation

let mockBreakfasts: [Breakfast] = [
    Breakfast(
        id: UUID(),
        title: "Avocado Toast",
        imageName: "avocado_toast",
        ingredients: [
            Ingredient(item: "Bread slice", quantity: 2, unit: "pcs"),
            Ingredient(item: "Avocado", quantity: 1, unit: "pcs"),
            Ingredient(item: "Lemon juice", quantity: 1, unit: "tsp"),
            Ingredient(item: "Salt", quantity: 0.25, unit: "tsp"),
            Ingredient(item: "Olive oil", quantity: 1, unit: "tsp")
        ],
        recipe: "Toast bread slices, mash avocado with lemon juice and salt, spread over toast, and drizzle with olive oil.",
        difficulty: .easy,
        prepTimeMinutes: 10,
        type: .savory
    ),
    Breakfast(
        id: UUID(),
        title: "Banana Pancakes",
        imageName: "banana_pancakes",
        ingredients: [
            Ingredient(item: "Banana", quantity: 1, unit: "pcs"),
            Ingredient(item: "Egg", quantity: 1, unit: "pcs"),
            Ingredient(item: "Oats", quantity: 0.25, unit: "cup"),
            Ingredient(item: "Honey", quantity: 1, unit: "tsp")
        ],
        recipe: "Blend banana, egg, and oats. Pour small rounds on a non-stick pan and cook until golden. Serve with honey.",
        difficulty: .easy,
        prepTimeMinutes: 15,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Eggs Benedict",
        imageName: "benedict_egg",
        ingredients: [
            Ingredient(item: "English muffin", quantity: 1, unit: "pcs"),
            Ingredient(item: "Egg", quantity: 2, unit: "pcs"),
            Ingredient(item: "Ham", quantity: 2, unit: "slices"),
            Ingredient(item: "Hollandaise sauce", quantity: 2, unit: "tbsp")
        ],
        recipe: "Toast muffin, poach eggs, layer with ham, top with hollandaise sauce.",
        difficulty: .medium,
        prepTimeMinutes: 25,
        type: .savory
    ),
    Breakfast(
        id: UUID(),
        title: "Smoothie Bowl",
        imageName: "bowl",
        ingredients: [
            Ingredient(item: "Banana", quantity: 1, unit: "pcs"),
            Ingredient(item: "Berries", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Greek yogurt", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Granola", quantity: 0.25, unit: "cup")
        ],
        recipe: "Blend banana, berries, and yogurt. Pour into bowl and top with granola and fruit.",
        difficulty: .easy,
        prepTimeMinutes: 10,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Crepes",
        imageName: "crepes",
        ingredients: [
            Ingredient(item: "Flour", quantity: 0.75, unit: "cup"),
            Ingredient(item: "Milk", quantity: 1, unit: "cup"),
            Ingredient(item: "Egg", quantity: 2, unit: "pcs"),
            Ingredient(item: "Butter", quantity: 1, unit: "tbsp")
        ],
        recipe: "Whisk ingredients into smooth batter, cook thin layers in buttered pan, fill with fruit or chocolate.",
        difficulty: .medium,
        prepTimeMinutes: 20,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Fluffy Pancakes",
        imageName: "fluffy_pancakes",
        ingredients: [
            Ingredient(item: "Flour", quantity: 1, unit: "cup"),
            Ingredient(item: "Baking powder", quantity: 1, unit: "tbsp"),
            Ingredient(item: "Milk", quantity: 0.75, unit: "cup"),
            Ingredient(item: "Egg", quantity: 1, unit: "pcs")
        ],
        recipe: "Mix dry and wet ingredients separately, then combine. Cook thick pancakes until golden and airy.",
        difficulty: .easy,
        prepTimeMinutes: 15,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Fried Egg Galette",
        imageName: "fried_egg_galette",
        ingredients: [
            Ingredient(item: "Buckwheat flour", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Egg", quantity: 1, unit: "pcs"),
            Ingredient(item: "Ham", quantity: 1, unit: "slice"),
            Ingredient(item: "Cheese", quantity: 0.25, unit: "cup")
        ],
        recipe: "Cook thin galette, top with ham, cheese, and an egg in the center. Fold corners and cook until set.",
        difficulty: .medium,
        prepTimeMinutes: 20,
        type: .savory
    ),
    Breakfast(
        id: UUID(),
        title: "Greek Yogurt Bowl",
        imageName: "greek_yogurt_bowl",
        ingredients: [
            Ingredient(item: "Greek yogurt", quantity: 1, unit: "cup"),
            Ingredient(item: "Honey", quantity: 1, unit: "tsp"),
            Ingredient(item: "Granola", quantity: 0.25, unit: "cup"),
            Ingredient(item: "Berries", quantity: 0.5, unit: "cup")
        ],
        recipe: "Layer yogurt, drizzle honey, top with granola and berries.",
        difficulty: .easy,
        prepTimeMinutes: 5,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Raspberry Cake",
        imageName: "raspberries_cake",
        ingredients: [
            Ingredient(item: "Flour", quantity: 1, unit: "cup"),
            Ingredient(item: "Sugar", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Egg", quantity: 2, unit: "pcs"),
            Ingredient(item: "Raspberries", quantity: 1, unit: "cup")
        ],
        recipe: "Mix batter, fold in raspberries, and bake until golden. Serve warm.",
        difficulty: .medium,
        prepTimeMinutes: 40,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Rice Porridge",
        imageName: "rice_porridge",
        ingredients: [
            Ingredient(item: "Rice", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Milk", quantity: 2, unit: "cups"),
            Ingredient(item: "Sugar", quantity: 1, unit: "tbsp"),
            Ingredient(item: "Butter", quantity: 1, unit: "tsp")
        ],
        recipe: "Simmer rice in milk until creamy. Stir in sugar and butter before serving.",
        difficulty: .easy,
        prepTimeMinutes: 30,
        type: .sweet
    ),
    Breakfast(
        id: UUID(),
        title: "Shakshuka",
        imageName: "shakshuka",
        ingredients: [
            Ingredient(item: "Egg", quantity: 2, unit: "pcs"),
            Ingredient(item: "Tomatoes", quantity: 2, unit: "pcs"),
            Ingredient(item: "Onion", quantity: 0.5, unit: "pcs"),
            Ingredient(item: "Garlic", quantity: 1, unit: "clove"),
            Ingredient(item: "Paprika", quantity: 0.5, unit: "tsp")
        ],
        recipe: "Cook onions and garlic, add tomatoes and spices, simmer, then crack eggs and poach in sauce.",
        difficulty: .medium,
        prepTimeMinutes: 25,
        type: .savory
    ),
    Breakfast(
        id: UUID(),
        title: "Smoked Salmon Bagel",
        imageName: "smoked_salmon_bagel",
        ingredients: [
            Ingredient(item: "Bagel", quantity: 1, unit: "pcs"),
            Ingredient(item: "Cream cheese", quantity: 2, unit: "tbsp"),
            Ingredient(item: "Smoked salmon", quantity: 2, unit: "slices"),
            Ingredient(item: "Capers", quantity: 1, unit: "tsp")
        ],
        recipe: "Spread cream cheese on toasted bagel halves, top with salmon and capers.",
        difficulty: .easy,
        prepTimeMinutes: 10,
        type: .savory
    ),
    Breakfast(
        id: UUID(),
        title: "Tiramisu",
        imageName: "tiramisu",
        ingredients: [
            Ingredient(item: "Ladyfingers", quantity: 10, unit: "pcs"),
            Ingredient(item: "Mascarpone", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Coffee", quantity: 0.5, unit: "cup"),
            Ingredient(item: "Cocoa powder", quantity: 1, unit: "tsp")
        ],
        recipe: "Layer soaked ladyfingers with mascarpone cream, dust with cocoa. Chill before serving.",
        difficulty: .hard,
        prepTimeMinutes: 45,
        type: .sweet
    )
]
