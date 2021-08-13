import 'package:dfa/contents/colors.dart';
import 'package:dfa/contents/size_config.dart';
import 'package:dfa/contents/texts.dart';
import 'package:dfa/dfa.dart';
import 'package:dfa/ui_components/layout_ui.dart';
import 'package:flutter/material.dart';

class VisualizationPage extends StatefulWidget {
  DFA dfa;
  String text;
  VisualizationPage({this.dfa, this.text});

  @override
  _VisualizationPageState createState() => _VisualizationPageState();
}

class _VisualizationPageState extends State<VisualizationPage> {
  List<TextSpan> list = new List();
  int last;
  @override
  void initState() {
    // TODO: implement initState
    last = 0;
    widget.dfa.position.forEach((element) {
      list.add(TextSpan(text: widget.text.substring(last, element['start'])));
      list.add(TextSpan(
          text: widget.text.substring(element['start'], element['end']),
          style: TextStyle(fontWeight: FontWeight.bold)));
      last = element['end'];
    });
    if (last != widget.text.length - 1) {
      list.add(
          TextSpan(text: widget.text.substring(last, widget.text.length - 1)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KiPage(
      appBarType: AppBarType.backButton,
      color: ThemeColor.whiteColor,
      child: Padding(
          padding: EdgeInsets.all(SizeConfig.small),
          child: Column(children: <Widget>[
            Text(
              'Visualized Text',
              style: mediumTextStyle(color: ThemeColor.blueColor),
            ),
            SizeConfig.smallVerticalBox,
            RichText(
              text: TextSpan(
                  text: '',
                  style: smallTextStyle(color: ThemeColor.themeBlueColor),
                  children: list),
            )
          ])),
    );
  }
}
