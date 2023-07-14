import 'package:flutter/material.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/utils/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [
    "Hello!",
    "Hi, how are you?",
    "I'm good, thanks. How about you?",
    "I'm doing well. Thanks for asking.",
    "That's great to hear.",
    "Yes, it is.",
    "Well, I have to go now. Talk to you later.",
    "Sure, bye!",
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      messages.insert(0, text);
    });
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: "Reply here......",
                ),
                style: const TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 14,
                    color: AppColors.textgreyordersummaary,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                  IconButton(
                    icon: Image.asset(
                      "images/chatarrow.png",
                      scale: 2.5,
                      // color: Colors.grey,
                    ),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Transform(
            transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
            child: Image.asset(
              "images/logo_hor.png",
              height: height / 2,
              width: width / 3,

            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/ccrossIcon.png",
                height: 22,
                width: 22,

              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NavBarBottom(selectedIndex: 0)));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/chatImg/chatScrBack.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: null /* add child content here */,
                  ),
                  Positioned(
                    bottom: 600.0,

                    left: 10.0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              child: Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/welcome_icon.png",
                                      height: 40,
                                      width: 55,
                                      // color: Colors.grey,
                                    ),
                                    Container(
                                      // color: Colors.cyan,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Utsav Fashion",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: AppColors.Textcolorheading,
                                              // fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            "Welcome to Utsav Fashion.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: AppColors.Textcolorheading,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            "Thank you for reaching out to us.I’d like to help you out!",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: AppColors.Textcolorheading,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

                              }),
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 500.0,
                    right: 10.0,
                    left: 0.0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  color: AppColors.primaryColorblue,
                                ),
                                height: height * 0.035,
                                width: null,
                                child: FloatingActionButton.extended(
                                  elevation: 0,
                                  onPressed: () {},
                                  label: const Text('Hii' ,style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),),
                                  backgroundColor: AppColors.primaryColorblue,
                                ),
                              ),
                              onTap: () {

                              }),
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "6 minutes ago",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                            fontFamily: 'SourceSansPro',
                              // color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
