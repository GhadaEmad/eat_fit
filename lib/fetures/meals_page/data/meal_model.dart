

class MealModel {
  final String? name;
  final String? type;
  final String? day;
  final int? calories;
  final String? imageUrl;
  final List<String> ingredients;

  MealModel({
    required this.imageUrl,
    required this.ingredients,
    this.name,
    this.type,
    this.day,
    this.calories,
  });
}


final List<MealModel> allMeals = [
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Saturday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Saturday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Saturday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Saturday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews'],),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Sunday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Sunday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Sunday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Sunday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Monday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Monday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Monday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Monday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Tuesday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Tuesday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Tuesday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Tuesday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Wednesday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Wednesday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Wednesday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Wednesday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Thursday ', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Thursday ', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Thursday ', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Thursday ', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),
  MealModel(name: 'Boiled eggs + salad + slice of toast', type: 'Breakfast', day: 'Friday', calories: 150, imageUrl: 'assets/image/breakfast.jpg',ingredients: ['2 boiled eggs', '1 cup salad', '1 slice toast'],),
  MealModel(name: 'Meat + rice with vegetables', type: 'Lunch', day: 'Friday', calories: 400, imageUrl: 'assets/image/lunch.jpg',ingredients: ['100g meat', '1 cup rice', 'steamed vegetables']),
  MealModel(name: 'Banana oatmeal', type: 'Dinner', day: 'Friday', calories: 200, imageUrl: 'assets/image/dinner.jpg', ingredients: ['1 banana', '1/2 cup oats', '1 tsp honey']),
  MealModel(name: 'Nuts', type: 'Snacks', day: 'Friday', calories: 100, imageUrl: 'assets/image/Snacks.jpg', ingredients: ['Almonds', 'Walnuts', 'Cashews']),

 ];