
import 'orderproductResponse.dart';

class OrderListResponse {
  String? id;
  int? totalAmount;
  String? orderNumber;
  int? deliveryCharge;
  String? orderStatus;
  String? discountCoupon;
  String? orderType;
  String? deliveryDate;
  List<OrderProductResponse>? orderProducts;
  OrderListResponse(
      {
        this.id,
        this.totalAmount,
        this.orderNumber,
        this.deliveryCharge,
        this.orderStatus,
        this.discountCoupon,
        this.orderType,
        this.deliveryDate,
        this.orderProducts,
      });

  OrderListResponse.fromJson(Map<String, dynamic> js) {

    id = js['id'];
    totalAmount = js['totalAmount'];
    orderNumber= js['orderNumber'];
    deliveryCharge = js['deliveryCharge'];
    orderStatus = js['orderStatus'];
    discountCoupon = js['discountCoupon'];
    orderType = js['orderType'];
    deliveryDate = js['deliveryDate'];
    orderProducts = js["orderProducts"] == "" || js["orderProducts"] == null
        ? []
        : OrderProductResponse().fromList((js["orderProducts"]));

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['totalAmount'] = this.totalAmount;
    data['orderNumber'] = this.orderNumber;
    data['deliveryCharge'] = this.deliveryCharge;
    data['orderStatus'] = this.orderStatus;
    data['discountCoupon'] = this.discountCoupon;
    data['orderType'] = this.orderType;
    data['deliveryDate'] = this.deliveryDate;
    data['orderProducts'] = this.orderProducts;
    return data;
  }

  /*factory OrderListResponse.fromJson(var js) {
    return OrderListResponse(
      id: js["id"],
      totalAmount: js["totalAmount"],
      orderNumber: js["orderNumber"],
      deliveryCharge: js["deliveryCharge"],
      orderStatus: js["orderStatus"],
      discountCoupon: js["discountCoupon"],
      orderType :js["orderType"],
      deliveryDate: js["deliveryDate"],
        customer:CustomerListResponse().fromList(json.decode(js["customer"])),
      orderProducts: js["orderProducts"] == "" || js["orderProducts"] == null
          ? []
          : OrderProductResponse().fromList(json.decode(js["orderProducts"])),

    );
  }*/

  /*WalletListResponse.fromJson(Map<String, dynamic> js) {
    walletBalance = js['walletBalance'];
    transactionHistory= js["qot_pro"] == "" || js["qot_pro"] == null
        ? []
    //: QuotationModel().fromList(json.decode(js["qot_pro"])),
        : QuotationModel().fromList(json.decode(js["qot_pro"])), js['transactionHistory'];
  }*/
  List<OrderListResponse> fromList(var list) {
    List<OrderListResponse> visitList = [];
    for (final i in list) {
      visitList.add(OrderListResponse.fromJson(i));
    }
    return visitList;
  }

}
