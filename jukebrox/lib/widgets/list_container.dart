import 'package:flutter/material.dart';
import 'package:jukebrox/widgets/scrolling_text.dart';

abstract class ListContainer extends StatelessWidget {
  Color backgroundColor;
  EdgeInsetsGeometry padding;
  Widget icon;
  String text;
  Color color;

  ListContainer(
      {Key key,
      this.backgroundColor,
      this.padding,
      this.icon,
      this.text,
      this.color})
      : super(key: key);

  TextStyle getTextStyle(context);
  void onClick(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backgroundColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            constraints: BoxConstraints.expand(
              height:
              this.getTextStyle(context).fontSize * 1.1 + 50.0,
            ),
            padding: this.padding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                this.icon,
                Expanded(
                  child: ScrollingText(
                    text: this.text,
                    textStyle: getTextStyle(context),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            onClick(context);
          },
        ),
      ),
    );
  }
}