import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/common%20widgets/reply_msg.dart';
import 'package:wellnest/Presentation/common%20widgets/self_msg.dart';
import 'package:wellnest/Presentation/constants/constants.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ValueNotifier<bool> isEmojiPickerVisible = ValueNotifier(false);
  final ValueNotifier<FocusNode> focusNodeNotifier = ValueNotifier(FocusNode());
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    focusNodeNotifier.value.addListener(() {
      if (focusNodeNotifier.value.hasFocus) {
        isEmojiPickerVisible.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 233, 237),
      appBar: AppBar(
        backgroundColor: maincolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: size * 0.045,
              backgroundImage: const AssetImage('assets/imgs/doctor.webp'),
            ),
            kwidth10,
            Text('Dr. John Doe',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ))),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              SizedBox(height: 10),
              ReplyCard(
                message: 'Hello, How can I help you?',
                time: '10:00 AM',
              ),
              SizedBox(height: 10),
              OwnMessageCard(
                message: 'I am having a headache',
                time: '10:05 AM',
              ),
              SizedBox(height: 10),
              ReplyCard(
                message: 'I will prescribe you some medicines',
                time: '10:10 AM',
              ),
              SizedBox(height: 10),
              OwnMessageCard(
                message: 'Thank you',
                time: '10:15 AM',
              ),
              SizedBox(height: 10),
              ReplyCard(
                message: 'You are welcome',
                time: '10:20 AM',
              ),
              SizedBox(height: 10),
              OwnMessageCard(
                message: 'Goodbye',
                time: '10:25 AM',
              ),
              SizedBox(height: 10),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChatInputWidget(
                  onEmojiPressed: () {
                    if (!isEmojiPickerVisible.value) {
                      focusNodeNotifier.value.unfocus();
                      focusNodeNotifier.value.canRequestFocus = true;
                    }
                    isEmojiPickerVisible.value = !isEmojiPickerVisible.value;
                  },
                  focusNodeNotifier: focusNodeNotifier,
                  textEditingController: textEditingController,
                ),
                ValueListenableBuilder(
                  valueListenable: isEmojiPickerVisible,
                  builder: (context, isVisible, child) {
                    return isVisible
                        ? emojiSelect(textEditingController)
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInputWidget extends StatelessWidget {
  final VoidCallback onEmojiPressed;
  final ValueNotifier<FocusNode> focusNodeNotifier;
  final TextEditingController textEditingController;
  const ChatInputWidget(
      {required this.onEmojiPressed,
      required this.focusNodeNotifier,
      super.key,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.02;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size * 0.4, vertical: size * 0.4),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: maincolor,
                      ),
                      onPressed: onEmojiPressed,
                    ),
                    Expanded(
                      child: ValueListenableBuilder<FocusNode>(
                        valueListenable: focusNodeNotifier,
                        builder: (context, focusNode, child) {
                          return TextField(
                            focusNode: focusNode,
                            keyboardType: TextInputType.multiline,
                            controller: textEditingController,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                color: maincolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                              border: InputBorder.none,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {},
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            minWidth: 0,
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

Widget emojiSelect(TextEditingController textEditingController) {
  return EmojiPicker(
    onEmojiSelected: (category, emoji) {
      textEditingController.text = textEditingController.text + emoji.emoji;
    },
    config: const Config(
      height: 256,
      checkPlatformCompatibility: true,
      emojiViewConfig: EmojiViewConfig(
        emojiSizeMax: 28,
        columns: 7,
        horizontalSpacing: 0,
        verticalSpacing: 0,
        backgroundColor: Colors.white,
      ),
    ),
  );
}
