import 'package:foodgo/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> catrgory = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.name = "Pizza";
  categoryModel.image = "images/pizza.png";
  catrgory.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Burger";
  categoryModel.image = "images/burger.png";
  catrgory.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Chinese";
  categoryModel.image = "images/chinese.png";
  catrgory.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.name = "Maxican";
  categoryModel.image = "images/tacos.png";
  catrgory.add(categoryModel);
  categoryModel = CategoryModel();

  return catrgory;
}
