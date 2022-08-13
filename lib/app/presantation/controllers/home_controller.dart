import 'package:electro_peyk/app/data/models/order_model.dart';
import 'package:electro_peyk/app/presantation/pages/support_page/support_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeController extends GetxController with StateMixin{
  PageController pageController = PageController(initialPage: 3);
  RxInt currentPageIndex = 3.obs;
  RxBool isCardAdded = true.obs;
  RxBool isModifyBankInfo = false.obs;
  RxBool addCard = false.obs;
  RxInt accountPageWidgetIndex = (-1).obs;
  RxList services = [].obs;
  RxList orders = [].obs;
  RxList messages = [].obs;
  final GlobalKey<AnimatedListState> key = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    getMessages();
  }

  getMessages(){
    messages.clear();
    List<ChatBubble> message=[
      ChatBubble(dateStr: "۱۷خرداد",isUser: true,message: null,),
      ChatBubble(dateStr: "16:34",isUser: true,message: "سلام وقت بخیر",),
      ChatBubble(dateStr: "16:36",isUser: false,message: "سلام دوست عزیز. چه کمکی از من برمیاد؟",),
      ChatBubble(dateStr: "امروز",isUser: true,message: null,),
      ChatBubble(dateStr: "16:34",isUser: true,message: "پرداخت هام توی قسمت مالی نمایش داده نمیشه  پرداخت هام توی قسمت مالی نمایش داده نمیشه",),
      ChatBubble(dateStr: "16:34",isUser: false,message: "بله در اسرع وقت رسیدگی می شود",),
    ];
    messages.addAll(message);
  }
  sendMessage(String message){
    var j = Jalali.now();
    messages.add(ChatBubble(dateStr: '${j.hour}:${j.minute}',isUser: true,message: message,));
  }
  onTapBar(int pageIndex) {
    currentPageIndex.value = pageIndex;
    pageController.jumpToPage(
      pageIndex,
      // duration: const Duration(milliseconds: 300),
      // curve: Curves.ease,
    );
    print(pageIndex);
    if(pageIndex == 3){
      getOrders();
    }else if(pageIndex == 2)
      {
        getServices();
      }
  }
  onSupportTap(){
    accountPageWidgetIndex.value = 1;
  }
  onAccountTap(){
    accountPageWidgetIndex.value = 0;
  }
  onBackPress(){
    accountPageWidgetIndex.value = -1;
  }

  Future getServices()async{
    services.clear();
    List<OrderModel> list=[];
    change(null,status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 1));
    list.add(OrderModel(title: "گوشی صوتی مستقل همراه تصویری",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00",imageUrl: "assets/orders/o1.png",isRepair: true,status: null));
    list.add(OrderModel(title: "گوشی تصویری 10 اینچ مدل 1198",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "سه شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o2.png",isRepair: true,status: Status.accepted));
    list.add(OrderModel(title: "صفحه دم دری صوتی مدل 875",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o3.png",isRepair: false,status: Status.done));
    list.add(OrderModel(title: "زنگ پیانویی مدل 288",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o4.png",isRepair: true,status: Status.reject));
    list.add(OrderModel(title: "گوشی مستقل همراه تصویری",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o5.png",isRepair: false,status: Status.rejectByClient));
    services.addAll(list.where((p0) => p0.status!= null).toList());
    change(null,status: RxStatus.success());
  }
  Future getOrders()async{

    change(null,status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 1));
    orders.clear();
    orders.add(OrderModel(title: "گوشی صوتی مستقل همراه تصویری",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "سه شنبه 16 شهریور ساعت 15:00 الی 18:00",imageUrl: "assets/orders/o1.png",isRepair: true));
    orders.add(OrderModel(title: "گوشی تصویری 10 اینچ مدل 1198",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "سه شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o2.png",isRepair: true));
    orders.add(OrderModel(title: "صفحه دم دری صوتی مدل 875",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o3.png",isRepair: false));
    orders.add(OrderModel(title: "زنگ پیانویی مدل 288",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o4.png",isRepair: true));
    orders.add(OrderModel(title: "گوشی مستقل همراه تصویری",address: "میدان ولیعصر، خیابان شقایق",code: "1255643884",date: "پنج شنبه 16 شهریور ساعت 18:00 الی 20:00",imageUrl: "assets/orders/o5.png",isRepair: false));
    change(null,status: RxStatus.success());
  }
  search(String text){
    if(text == "") {
      getOrders();
      Get.focusScope!.unfocus();
    }
    var list = orders.where((p0)=> p0.title.contains(text)).toList();
    orders.clear();
    orders.addAll(list);
    change(null,status: RxStatus.success());
    int i =0;
  }
  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('خروج از برنامه'),
        content: Text('آیا می خواهید از برنامه خارج شوید؟'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('خیر',style: Get.theme.textTheme.button),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('بله',style: Get.theme.textTheme.button),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

}
