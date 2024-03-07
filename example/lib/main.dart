import 'package:flutter/material.dart';
import 'package:typeheaderfield/src/material/field/text_field_configuration.dart';
import 'package:typeheaderfield/typeheaderfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String site = "";
  late TextEditingController siteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Center(
          child: TypeHeaderField<String>(
            getImmediateSuggestions: true,
            textFieldConfiguration: TextFieldConfiguration(
              onChanged: (value) {
                setState(() {
                  site = value;
                });
              },
              keyboardType: TextInputType.text,
              controller: siteController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Fruits",
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                ),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            suggestionsCallback: (String pattern) async {
              List<String> list = [
                "Apple",
                "Banana",
                "Orange",
                "Water Melon",
                "Kiwi",
              ];
              return list;
            },
            itemBuilder: (context, String suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (String suggestion) {
              siteController.text = suggestion;
              setState(() {
                site = suggestion;
              });
              debugPrint("Suggestion selected=" + suggestion);
            },
          ),
        ));
  }
}
