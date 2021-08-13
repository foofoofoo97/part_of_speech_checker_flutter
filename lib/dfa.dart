class DFA {
  //initialize variables
  int found = 0;
  List<Map<String, dynamic>> position = new List();
  List<String> acceptedPatterns = new List<String>();
  List<String> type = new List<String>();
  Map typeToPatterns = new Map<String, dynamic>();
  int start = 0;
  int end;
  String pattern = "";
  int isFound = 0;
  String dfa = "start";

  //start states
  void begin(var c) {
    if (c == 'a') {
      dfa = "a";
    } else if (c == 'b') {
      dfa = "b";
    } else if (c == 'm') {
      dfa = "m";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (M|MOST) of DFA
  void stateM(var c) {
    if (c == 'o') {
      dfa = "mo";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (MO|MOST) of DFA
  void stateMO(var c) {
    if (c == 's') {
      dfa = "mos";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (MOS|MOST) of DFA
  void stateMOS(var c) {
    if (c == 't') {
      dfa = "most";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (MOST|MOST) of DFA
  void stateMOST(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == 'l') {
      dfa = "+l";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (A|AND) of DFA
  void stateA(var c) {
    if (c == 'n') {
      dfa = "an";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (AN|AND) of DFA
  void stateAN(var c) {
    if (c == 'd') {
      dfa = "and";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (AN|AND) of DFA
  void stateAND(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (B|BUT) of DFA
  void stateB(var c) {
    if (c == 'u') {
      dfa = "bu";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (BU|BUT) of DFA
  void stateBU(var c) {
    if (c == 't') {
      dfa = "but";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (BUT|BUT) of DFA
  void stateBUT(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state Other of DFA
  void stateOther(var c) {
    if (c == 'e') {
      dfa = "+e";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xE|xEST) of DFA
  void statexE(var c) {
    if (c == 's') {
      dfa = "+es";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xES|xEST) of DFA
  void statexES(var c) {
    if (c == 't') {
      dfa = "+est";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xEST|xEST) of DFA
  void statexEST(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xA|xAL) of DFA
  void statexA(var c) {
    if (c == 'l') {
      dfa = "+al";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xAL|xAL) of DFA
  void statexAL(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'y') {
      dfa = "+ly";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xI|xIC/xISH) of DFA
  void statexI(var c) {
    if (c == 'c') {
      dfa = "+ic";
    } else if (c == 's') {
      dfa = "+is";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xIS|xISH) of DFA
  void statexIS(var c) {
    if (c == 'h') {
      dfa = "+ish";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xISH|xISH) of DFA
  void statexISH(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xIC|xIC) of DFA
  void statexIC(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xO|xOUS) of DFA
  void statexO(var c) {
    if (c == 'u') {
      dfa = "+ou";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xOU|xOUS) of DFA
  void statexOU(var c) {
    if (c == 's') {
      dfa = "+ous";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xOUS|xOUS) of DFA
  void statexOUS(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xL|xLY) of DFA
  void statexL(var c) {
    if (c == 'y') {
      dfa = "+ly";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else {
      dfa = "other";
    }
  }

  // This function is for the
  // state (xLY|xLY) of DFA
  void statexLY(var c) {
    if (c == ' ' || c == ',' || c == '.' || c == '(' || c == ')') {
      dfa = "start";
    } else if (c == 'a') {
      dfa = "+a";
    } else if (c == 'i') {
      dfa = "+i";
    } else if (c == 'e') {
      dfa = "+e";
    } else if (c == 'l') {
      dfa = "+l";
    } else if (c == 'o') {
      dfa = "+o";
    } else {
      dfa = "other";
    }
  }

  int isAccepted(String str) {
    //Initialize an empty list for each type of POS
    typeToPatterns.putIfAbsent("conjunction", () => new List<String>());
    typeToPatterns.putIfAbsent("adjective", () => new List<String>());
    typeToPatterns.putIfAbsent("adverb", () => new List<String>());

    //for each character in text
    for (int i = 0; i < str.length; i++) {
      if (dfa == "start") {
        //if isFound ==1, pattern is recognized as conjunction
        if (isFound == 1) {
          //save pattern as conjunction
          conjunction();
        }
        //if isFound ==2, pattern is recognized as adverb
        else if (isFound == 2) {
          //save pattern as adverb
          adverb();
        }
        //if isFound ==3, pattern is recognized as adjective
        else if (isFound == 3) {
          //save pattern as adjective
          adjective();
        }

        //clear variables values
        isFound = 0;
        pattern = "";
        start = i;
        pattern = pattern + str[i];
        begin(str[i]);
      } else if (dfa == "m") {
        pattern = pattern + str[i];
        stateM(str[i]);
      } else if (dfa == "mo") {
        pattern = pattern + str[i];
        stateMO(str[i]);
      } else if (dfa == "mos") {
        pattern = pattern + str[i];
        stateMOS(str[i]);
      } else if (dfa == "most") {
        end = i;
        isFound = 2;
        pattern = pattern + str[i];
        stateMOST(str[i]);
      } else if (dfa == "a") {
        pattern = pattern + str[i];
        stateA(str[i]);
      } else if (dfa == "an") {
        pattern = pattern + str[i];
        stateAN(str[i]);
      } else if (dfa == "and") {
        end = i;
        isFound = 1;
        pattern = pattern + str[i];
        stateAND(str[i]);
      } else if (dfa == "b") {
        pattern = pattern + str[i];
        stateB(str[i]);
      } else if (dfa == "bu") {
        pattern = pattern + str[i];
        stateBU(str[i]);
      } else if (dfa == "but") {
        end = i;
        isFound = 1;
        pattern = pattern + str[i];
        stateBUT(str[i]);
      } else if (dfa == "other") {
        isFound = 0;
        pattern = pattern + str[i];
        stateOther(str[i]);
      } else if (dfa == "+a") {
        isFound = 0;
        pattern = pattern + str[i];
        statexA(str[i]);
      } else if (dfa == "+al") {
        end = i;
        pattern = pattern + str[i];
        isFound = 3;
        statexAL(str[i]);
      } else if (dfa == "+e") {
        isFound = 0;
        pattern = pattern + str[i];
        statexE(str[i]);
      } else if (dfa == "+es") {
        isFound = 0;
        pattern = pattern + str[i];
        statexES(str[i]);
      } else if (dfa == "+est") {
        end = i;
        isFound = 3;
        pattern = pattern + str[i];
        statexEST(str[i]);
      } else if (dfa == "+i") {
        isFound = 0;
        pattern = pattern + str[i];
        statexI(str[i]);
      } else if (dfa == "+is") {
        isFound = 0;
        pattern = pattern + str[i];
        statexIS(str[i]);
      } else if (dfa == "+ish") {
        end = i;
        isFound = 3;
        pattern = pattern + str[i];
        statexISH(str[i]);
      } else if (dfa == "+ic") {
        end = i;
        isFound = 3;
        pattern = pattern + str[i];
        statexIC(str[i]);
      } else if (dfa == "+o") {
        isFound = 0;
        pattern = pattern + str[i];
        statexO(str[i]);
      } else if (dfa == "+ou") {
        isFound = 0;
        pattern = pattern + str[i];
        statexOU(str[i]);
      } else if (dfa == "+ous") {
        end = i;
        pattern = pattern + str[i];
        isFound = 3;
        statexOUS(str[i]);
      } else if (dfa == "+l") {
        isFound = 0;
        pattern = pattern + str[i];
        statexL(str[i]);
      } else if (dfa == "+ly") {
        end = i;
        isFound = 2;
        pattern = pattern + str[i];
        statexLY(str[i]);
      }
    }

    //if isFound>0,then the last detected pattern
    // is adjective/adverb/conjunction
    if (isFound > 0) {
      switch (isFound) {
        case 1:
          conjunction();
          break;
        case 2:
          adverb();
          break;
        case 3:
          adjective();
          break;
      }
    }
    for (String word in acceptedPatterns) {
      print(word + ' ');
    }

    if (found > 0)
      return 1;
    else
      return 0;
  }

  void conjunction() {
    type.add("conjunction");

    //to remember position of word in text
    Map<String, int> pp = new Map<String, int>();
    pp.addAll({"start": start, "end": end});

    //no of words recognized +1
    found = found + 1;

    //add current position to list
    position.add(pp);

    //remove blank space
    pattern = pattern.substring(0, pattern.length - 1);
    //add detected string to list of accepted patterns
    acceptedPatterns.add(pattern);

    //save detected string to list of its type
    List<String> strings = typeToPatterns["conjunction"];
    strings.add(pattern);
    typeToPatterns["conjunction"] = strings;
  }

  void adverb() {
    type.add("adverb");

    //to remember position of word in text
    Map<String, int> pp = new Map<String, int>();
    pp.addAll({"start": start, "end": end});

    //no of words recognized +1
    found = found + 1;

    //add current position to list
    position.add(pp);

    //remove blank space
    pattern = pattern.substring(0, pattern.length - 1);
    //add detected string to list of accepted patterns
    acceptedPatterns.add(pattern);

    //save detected string to list of its type
    List<String> strings = typeToPatterns["adverb"];
    strings.add(pattern);
    typeToPatterns["adverb"] = strings;
  }

  void adjective() {
    type.add("adjective");

    //to remember position of word in text
    Map<String, int> pp = new Map<String, int>();
    pp.addAll({"start": start, "end": end});

    //no of words recognized +1
    found = found + 1;

    //add current position to list
    position.add(pp);

    //remove blank space
    pattern = pattern.substring(0, pattern.length - 1);
    //add detected string to list of accepted patterns
    acceptedPatterns.add(pattern);

    //save detected string to list of its type
    List<String> strings = typeToPatterns["adjective"];
    strings.add(pattern);
    typeToPatterns["adjective"] = strings;
  }
}
