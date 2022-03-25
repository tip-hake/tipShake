import 'package:tipShake/data/message.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);


  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.conversation
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // profileWidget(context),
            _messagingWidget(context),
            _typeMessageWidget(context),
            //BackWidget(name: Strings.inbox,)
          ],
        ),
      ),
    );
  }

  Widget profileWidget(BuildContext context) {
    return Positioned(
      top: 150.0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -40,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/user.png',
                            height: 80.0,
                          ),
                        ),
                        Text(
                          'Jhon Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.largeTextSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'widget.specialist',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimensions.smallTextSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Dimensions.heightSize * 3,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  _messagingWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.heightSize,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: MessageList.list().length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index){
              Message message = MessageList.list()[index];
              return Padding(
                  padding: EdgeInsets.only(
                    bottom: Dimensions.heightSize,
                  ),
                  child: message.type != 'sender' ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: Dimensions.marginSize,
                            left: Dimensions.marginSize
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0)
                              )
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                  top: Dimensions.heightSize,
                                  bottom: Dimensions.heightSize
                              ),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.defaultTextSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: Dimensions.marginSize
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'seen message',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: Dimensions.extraSmallTextSize,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  )
                      : Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/user.png',
                                height: 20,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.smallTextSize,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                message.time,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: Dimensions.extraSmallTextSize,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.marginSize,
                            right: Dimensions.marginSize
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: CustomColor.accentColor.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30.0), 
                                  bottomLeft: Radius.circular(30.0), 
                                  bottomRight: Radius.circular(30.0) )
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                  top: Dimensions.heightSize,
                                  bottom: Dimensions.heightSize
                              ),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Dimensions.defaultTextSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              );
            }
        ),
      ),
    );
  }

  Widget _typeMessageWidget(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.marginSize
                ),
                child: Row(
                  children: [
                    Form(
                        key: formKey,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            style: CustomStyle.textStyle,
                            controller: messageController,
                            keyboardType: TextInputType.name,
                            validator: (String? value){
                              if(value!.isEmpty){
                                return Strings.typeSomething;
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: Strings.typeMessage,
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.blueGrey,
                              hintStyle: CustomStyle.textStyle,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: CustomColor.primaryColor,
                    size: 18,
                  ),
                  onPressed: () {

                  }
              )
            ],
          ),
        )
    );
  }
}
