
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class CupertinoDemoTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: trailingButtons,
      ),
      child: CupertinoScrollbar(
        child: ListView(
          children: <Widget>[
            CupertinoUserInterfaceLevel(
              data: CupertinoUserInterfaceLevelData.elevated,
              child: Tab2Header(),
            ),
            ...buildTab2Conversation(),
          ],
        ),
      ),
    );
  }
}

class Tab2Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        top: false,
        bottom: false,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: CupertinoDynamicColor.resolve(CupertinoColors.systemFill, context),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'SUPPORT TICKET',
                        style: TextStyle(
                          color: CupertinoDynamicColor.resolve(CupertinoColors.secondaryLabel, context),
                          letterSpacing: -0.9,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Show More',
                        style: TextStyle(
                          color: CupertinoDynamicColor.resolve(CupertinoColors.secondaryLabel, context),
                          letterSpacing: -0.6,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoDynamicColor.resolve(CupertinoColors.quaternarySystemFill, context),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Product or product packaging damaged during transit',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.46,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16.0)),
                      const Text(
                        'REVIEWERS',
                        style: TextStyle(
                          color: Color(0xFF646464),
                          fontSize: 12.0,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8.0)),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'people/square/trevor.png',
                                  package: _kGalleryAssetsPackage,
                                ),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 8.0)),
                          Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'people/square/sandra.png',
                                  package: _kGalleryAssetsPackage,
                                ),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 2.0)),
                          const Icon(
                            CupertinoIcons.check_mark_circled,
                            color: Color(0xFF646464),
                            size: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Tab2ConversationBubbleColor {
  blue,
  gray,
}

class Tab2ConversationBubble extends StatelessWidget {
  const Tab2ConversationBubble({this.text, this.color});

  final String text;
  final Tab2ConversationBubbleColor color;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;

    switch (color) {
      case Tab2ConversationBubbleColor.gray:
        backgroundColor = CupertinoDynamicColor.resolve(CupertinoColors.systemFill, context);
        foregroundColor = CupertinoDynamicColor.resolve(CupertinoColors.label, context);
        break;
      case Tab2ConversationBubbleColor.blue:
        backgroundColor = CupertinoTheme.of(context).primaryColor;
        foregroundColor = CupertinoColors.white;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        color: backgroundColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          letterSpacing: -0.4,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class Tab2ConversationAvatar extends StatelessWidget {
  const Tab2ConversationAvatar({this.text, this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: <Color>[
            color,
            Color.fromARGB(
              color.alpha,
              (color.red - 60).clamp(0, 255) as int,
              (color.green - 60).clamp(0, 255) as int,
              (color.blue - 60).clamp(0, 255) as int,
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
          color: CupertinoColors.white,
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class Tab2ConversationRow extends StatelessWidget {
  const Tab2ConversationRow({this.avatar, this.text});

  final Tab2ConversationAvatar avatar;
  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isSelf = avatar == null;
    return SafeArea(
      child: Row(
        mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isSelf ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: <Widget>[
          if (avatar != null) avatar,
          CupertinoUserInterfaceLevel(
            data: CupertinoUserInterfaceLevelData.elevated,
            child: Tab2ConversationBubble(
              text: text,
              color: isSelf
              ? Tab2ConversationBubbleColor.blue
              : Tab2ConversationBubbleColor.gray,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildTab2Conversation() {
  return <Widget>[
    const Tab2ConversationRow(
      text: "My Xanadu doesn't look right",
    ),
    const Tab2ConversationRow(
      avatar: Tab2ConversationAvatar(
        text: 'KL',
        color: Color(0xFFFD5015),
      ),
      text: "We'll rush you a new one.\nIt's gonna be incredible",
    ),
    const Tab2ConversationRow(
      text: 'Awesome thanks!',
    ),
    const Tab2ConversationRow(
      avatar: Tab2ConversationAvatar(
        text: 'SJ',
        color: Color(0xFF34CAD6),
      ),
      text: "We'll send you our\nnewest Labrador too!",
    ),
    const Tab2ConversationRow(
      text: 'Yay',
    ),
    const Tab2ConversationRow(
      avatar: Tab2ConversationAvatar(
        text: 'KL',
        color: Color(0xFFFD5015),
      ),
      text: "Actually there's one more thing...",
    ),
    const Tab2ConversationRow(
      text: "What's that?",
    ),
  ];
}

final Widget trailingButtons = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    const Padding(padding: EdgeInsets.only(left: 8.0)),
  ],
);