import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';
class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store{

  @observable
  int currentIndex = 0;

  @observable
  int categoryId = 0;

  @action
  setCurrentIndex(int ind, int? catId){
    currentIndex = ind;
    categoryId = catId ?? 0;
  }

}