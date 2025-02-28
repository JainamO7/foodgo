import 'package:foodgo/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = PizzaModel();
  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "999";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita Pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "1999";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizza;
}
