import 'package:foodgo/model/chineseModel.dart';

List<Chinesemodel> getChinese() {
  List<Chinesemodel> chinese = [];
  Chinesemodel chinesemodel = Chinesemodel();
  chinesemodel.name = "Cheese Burger";
  chinesemodel.image = "images/burger1.png";
  chinesemodel.price = "99";
  chinese.add(chinesemodel);
  chinesemodel = new Chinesemodel();

  chinesemodel.name = "Vaggie Burger";
  chinesemodel.image = "images/burger2.png";
  chinesemodel.price = "199";
  chinese.add(chinesemodel);
  chinesemodel = new Chinesemodel();

  return chinese;
}
