import 'package:get/get.dart';
import 'sliderrectangle23908_item_model.dart';
import 'sliderrectangle23908_one_item_model.dart';
import 'sliderrectangle23908_two_item_model.dart';

class HotelListPageModel {
  RxList<Sliderrectangle23908ItemModel> sliderrectangle23908ItemList =
      RxList.filled(1, Sliderrectangle23908ItemModel());

  RxList<Sliderrectangle23908OneItemModel> sliderrectangle23908OneItemList =
      RxList.filled(1, Sliderrectangle23908OneItemModel());

  RxList<Sliderrectangle23908TwoItemModel> sliderrectangle23908TwoItemList =
      RxList.filled(1, Sliderrectangle23908TwoItemModel());
}
