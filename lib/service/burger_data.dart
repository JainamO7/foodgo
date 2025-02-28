import 'package:foodgo/model/burger_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = BurgerModel();
  burgerModel.name = "Cheese Burger";
  burgerModel.image = "images/burger1.png";
  burgerModel.price = "99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Vaggie Burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "199";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  return burger;
}
