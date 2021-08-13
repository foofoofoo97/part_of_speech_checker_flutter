import 'package:dfa/contents/colors.dart';
import 'package:dfa/contents/size_config.dart';
import 'package:dfa/contents/texts.dart';
import 'package:dfa/contents/validators.dart';
import 'package:dfa/dfa.dart';
import 'package:dfa/result_page.dart';
import 'package:dfa/ui_components/functional_ui.dart';
import 'package:dfa/ui_components/textArea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPT443 Assignment 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DFA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text;
  bool isLoading;
  TextEditingController textEditingController = new TextEditingController();
  bool noError;
  DFA dfa = new DFA();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    isLoading=true;
    noError = true;
    setText();
    super.initState();
  }

  Future<void> setText()async{
    text = await rootBundle.loadString('assets/text.txt');
    textEditingController.text=text;
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isLoading
        ? Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue)
          ),
        ),
      ),
    ):Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.lightBlueColor,
        title: Text(widget.title,style: extraLargeTextStyle(color: ThemeColor.themeBlueColor),),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(SizeConfig.small),
          child:Column(
        children: <Widget>[
          SizeConfig.smallVerticalBox,
          Form(
              key: _formKey,
              child:
          TextArea(
            controller: textEditingController,
              titleText: 'Text To Run DFA',
              hintText: 'Enter text..',
              maxLines: 27,
              onSaved: (value)async{
                text = value;
                noError = Validators.compulsoryValidator(value);
              },
              hintStyle: smallTextStyle(color: ThemeColor.blueGreyColor),
              activeBorderColor: ThemeColor.themeBlueColor,
              borderColor: ThemeColor.blueGreyColor,
              radius: 25.0,
              textStyle: smallTextStyle(color: ThemeColor.themeBlueColor),
              labelStyle: smallTextStyle(color: ThemeColor.themeBlueColor)
          )),
          SizeConfig.largeVerticalBox,
          KiButton.rectButton(
            color: ThemeColor.themeBlueColor,
            child: Text("RUN DFA",style: smallTextStyle(color: ThemeColor.whiteColor),),
            onPressed: (){
              _formKey.currentState.save();
              if(noError){
              dfa =new DFA();
              dfa.isAccepted(text.toLowerCase());
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ResultPage(dfa: dfa,text:text)
              ));
            }else{
                Fluttertoast.showToast(msg: 'Text Area Cannot Be Empty',
                    fontSize: SizeConfig.small,
                    textColor: ThemeColor.whiteColor,
                    backgroundColor: ThemeColor.themeBlueColor);
              }
            }
          )
        ],
      ))));
  }
}
