

class MealModel{
   final String? name;
   final String? type;
   final String? day;
   final int?calories;
   final String? imageUrl;
MealModel( {required this.imageUrl,this.name, this.type, this.day, this.calories});
}

final List<MealModel> allMeals = [
  MealModel(name: 'بيض مسلوق', type: 'فطار', day: 'السبت', calories: 150, imageUrl: 'https://via.placeholder.com/150'),
  MealModel(name: 'فراخ مشوية', type: 'غداء', day: 'السبت', calories: 400, imageUrl: 'https://via.placeholder.com/150'),
  MealModel(name: 'زبادي', type: 'عشاء', day: 'السبت', calories: 200, imageUrl: 'https://via.placeholder.com/150'),
  MealModel(name: 'موز', type: 'سناك', day: 'السبت', calories: 100, imageUrl: 'https://via.placeholder.com/150'),
  // أضف باقي الأيام والوجبات حسب الحاجة
];