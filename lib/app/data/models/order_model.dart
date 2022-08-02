class OrderModel{
  bool? isRepair;
  String? title;
  String? address;
  String? code;
  String? date;
  String? imageUrl;
  Status? status;

  OrderModel({this.isRepair, this.title, this.address, this.code, this.date,this.imageUrl,this.status});
}
enum Status{rejectByClient,accepted,done,reject}