import 'package:dfa/contents/colors.dart';
import 'package:dfa/contents/size_config.dart';
import 'package:dfa/contents/texts.dart';
import 'package:dfa/dfa.dart';
import 'package:dfa/ui_components/functional_ui.dart';
import 'package:dfa/ui_components/layout_ui.dart';
import 'package:dfa/visualization_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  DFA dfa;
  String text;
  ResultPage({this.dfa,this.text});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return KiPage(
      appBarType: AppBarType.backButton,
      color: ThemeColor.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.small),
        child: Column(
          children: <Widget>[
            Center(
              child:  Text('DFA RESULT',style: mediumTextStyle(color: ThemeColor.themeBlueColor),),
            ),
            SizeConfig.smallVerticalBox,
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.extraSmall,
                  horizontal: SizeConfig.smaller),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: ThemeColor.lightBlueGreyColor, width: 1.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total Detected Pattern',style: smallTextStyle(color: ThemeColor.blackColor),),
                      Text(widget.dfa.acceptedPatterns.length.toString(),style: smallTextStyle(color: ThemeColor.blueColor),)
                    ],
                  ),
                  Text(widget.dfa.acceptedPatterns.toString(),style: smallTextStyle(color: ThemeColor.themeBlueColor),),
                  SizeConfig.smallVerticalBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total Detected Conjunctions',style: smallTextStyle(color: ThemeColor.blackColor),),
                      Text(widget.dfa.typeToPatterns['conjunction'].length.toString(),style: smallTextStyle(color: ThemeColor.blueColor),)
                    ],
                  ),
                  Text(widget.dfa.typeToPatterns['conjunction'].toString(),style: smallTextStyle(color: ThemeColor.themeBlueColor),),
                  SizeConfig.smallVerticalBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total Detected Adverb',style: smallTextStyle(color: ThemeColor.blackColor),),
                      Text(widget.dfa.typeToPatterns['adverb'].length.toString(),style: smallTextStyle(color: ThemeColor.blueColor),)
                    ],
                  ),
                  Text(widget.dfa.typeToPatterns['adverb'].toString(),style: smallTextStyle(color: ThemeColor.themeBlueColor),),
                  SizeConfig.smallVerticalBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total Detected Adjective',style: smallTextStyle(color: ThemeColor.blackColor),),
                      Text(widget.dfa.typeToPatterns['adjective'].length.toString(),style: smallTextStyle(color: ThemeColor.blueColor),)
                    ],
                  ),
                  Text(widget.dfa.typeToPatterns['adjective'].toString(),style: smallTextStyle(color: ThemeColor.themeBlueColor),),
                ],
              ),
            ),
            SizeConfig.mediumVerticalBox,
            KiButton.rectButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>VisualizationPage(dfa: widget.dfa,text: widget.text,)
                ));
              },
              color: ThemeColor.lightBlueColor,
              child: Text('Visualize',style: smallTextStyle(color: ThemeColor.themeBlueColor),)
            )
          ],
        ),
      ),
    );
  }
}
