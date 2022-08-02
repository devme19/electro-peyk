import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
class SupportPage extends GetView<HomeController> {
  TextEditingController inputMessageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Function()? onBack;
  List<ChatBubble> messages=[
    ChatBubble(dateStr: "۱۷خرداد",isUser: true,message: null,),
    ChatBubble(dateStr: "16:34",isUser: true,message: "سلام وقت بخیر",),
    ChatBubble(dateStr: "16:36",isUser: false,message: "سلام دوست عزیز. چه کمکی از من برمیاد؟",),
    ChatBubble(dateStr: "امروز",isUser: true,message: null,),
    ChatBubble(dateStr: "16:34",isUser: true,message: "پرداخت هام توی قسمت مالی نمایش داده نمیشه  پرداخت هام توی قسمت مالی نمایش داده نمیشه",),
    ChatBubble(dateStr: "16:34",isUser: false,message: "بله در اسرع وقت رسیدگی می شود",),
  ];
  SupportPage({this.onBack}){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=>onBack!(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: Get.theme.primaryColor,),
                        Text("بازگشت",style: TextStyle(color: Get.theme.primaryColor),),
                      ],
                    ),
                  ),
                  Text("پشتیبان",style: TextStyle(color: Colors.black)),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.withOpacity(0.2)
                    ),
                      child: Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green
                            ),
                          ),
                          const SizedBox(width: 5.0,),
                          const Text("آنلاین",style: TextStyle(color: Colors.green),)
                        ],
                      )),

                ],
              ),
            ),
            const Divider(),
            controller.obx((state) => Expanded(
              child:
              ListView.builder(
                controller: scrollController,
                  itemCount: controller.messages.length,
                  itemBuilder: (context,index){
                    return
                      controller.messages[index];

                  }),
            ),
              onLoading: Expanded(child: Center(child: SpinKitRing(color: Get.theme.primaryColor)))
            ),
            Container(
                alignment: Alignment.bottomCenter,
                // padding: EdgeInsets.all(6),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.blueGrey.withOpacity(0.3),
                //         spreadRadius: 0.1,
                //         blurRadius: 1,
                //         offset: Offset(0, 2), // changes position of shadow
                //       ),
                //     ],
                //     borderRadius: BorderRadius.circular(16)
                // ),

                child:
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          if(inputMessageController.text.isNotEmpty) {
                            // controller.reply(
                            //     inputMessageController.text, controller.chatId);
                            controller.sendMessage(inputMessageController.text);
                            inputMessageController.clear();
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent+1000,
                              duration: Duration(milliseconds: 900),
                              curve: Curves.fastOutSlowIn,
                            );
                            FocusScopeNode currentFocus =
                            FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          }
                        },
                        child:
                        Image.asset('assets/icons/sendMessage.png',color: Get.theme.primaryColor,width: 40,),
                      ),
                      SizedBox(width: 8.0,),
                      Expanded(child: TextFormField(
                        controller: inputMessageController,
                        textAlign: TextAlign.right,
                        onTap: ()async{
                          await Future.delayed(Duration(milliseconds: 100));
                          scrollController.animateTo(
                            scrollController.position.maxScrollExtent+1000,
                            duration: Duration(milliseconds: 900),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        // showCursor: false,
                        minLines: 1,
                        maxLines: null,
                        // keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "پیام خود را بنویسید",
                          labelStyle:
                          TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none
                      ),
                          // enabledBorder: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none
                            ),
                          filled: true,
                          fillColor: Color(0xffF2F2F7)
                        ),
                      ),
                      )
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
  Widget connectionError(){
    return InkWell(
      onTap: (){
        // controller.getMessages(controller.chatId);
      },
      child: Container(
        height: 150,
        child: Column(children: [
          Text('خطا در برقراری ارتباط'),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.refresh,color: Colors.grey,),
          )
        ],),
      ),
    );
  }

}
class ChatBubble extends StatelessWidget {
  final String? message;
  final bool? isUser;
  final String? dateStr;

  ChatBubble({this.message, this.isUser,this.dateStr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // add some padding
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child:
      message == null ?
      Align(
        alignment: Alignment.center,
        child: Text(dateStr!,style: const TextStyle(color: Colors.grey)),
      ):
      Align(
        // align the child within the container
        alignment: isUser! ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isUser! ? Get.theme.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message!,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: isUser! ? Colors.white : Colors.black87,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                    child: Text(dateStr!,textAlign: TextAlign.start,style: TextStyle(color: isUser!?Colors.white:Colors.grey,fontSize: 11),))
                // date(dateStr!,isUser!)
                // Positioned(
                //   bottom: 0,
                //     left: 0,
                //     child:
                //     date(dateStr,isUser))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget date(String unixTimeStamp,bool isUser){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(unixTimeStamp) * 1000);
    final difference = DateTime.now().difference(dateTime).inMinutes;
    String? dateStr;
    if(difference <=1)
      dateStr = 'الان';
    else
    if(difference < 60)
      dateStr = '$difference دقیقه پیش ';
    else
    if(difference < 24*60)
    {
      int hours = DateTime.now().difference(dateTime).inHours;
      int minutes = difference%60;
      dateStr = '$hours ساعت و $minutes دقیقه پیش ';
    }
    else
    {
      int day = DateTime.now().difference(dateTime).inDays;
      if(day >= 31) {
        // dateStr = format1(Jalali.fromDateTime(dateTime));
      } else
        dateStr = '$day روز پیش ';
      // Jalali.now().compareTo(Jalali.fromDateTime(dateTime));

    }
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Text(dateStr!,style:TextStyle(
                color: isUser ? Colors.white : Colors.black87,fontSize: 8)),
            Image.asset('assets/icons/check.png',color:isUser? Colors.white:Colors.black87,width: 15,)
          ],
        ),
      );
  }
  // String format1(Date d) {
  //   final f = d.formatter;
  //
  //   return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  // }
}