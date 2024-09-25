import 'package:flutter/material.dart';

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
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      home: const MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  String? _name = "";
  String? _phoneNumber = "";
  String? _email = "";
  String? _password = "";

  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();

   Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value != null && value.isEmpty){
          return "Name es requerido";
        }
        return null;
      },
      onSaved: (String? value){
        _name = value;
        print(_name)
      },
    );
  }

  Widget _buildPhoneNumber(){
    return TextFormField(
        decoration: InputDecoration(labelText: "Phone Number"),
    validator: (String? value) {
    if (value != null && value.isEmpty){
    return "Phone number es requerido";
    }
    return null;
    },
    onSaved: (String? value){
    _phoneNumber = value;
    print(_phoneNumber)
    },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
        decoration: InputDecoration(labelText: "Email"),
    validator: (String? value) {
    if (value != null && value.isEmpty){
    return "Email es requerido";
    }
    return null;
    },
    onSaved: (String? value){
    _email = value;
    print(_email)
    },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
        decoration: InputDecoration(labelText: "Password"),
    validator: (String? value) {
    if (value != null && value.isEmpty){
    return "Password es requerido";
    }
    return null;
    },
    onSaved: (String? value){
    _password = value;
    print(_password)
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo de Formas"),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                _buildPhoneNumber(),
                _buildEmail(),
                _buildPassword(),
                SizedBox(height: 100,),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState?.save();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("data saved")),
                        );
                      }
                    },
                    child: Text("Enviar",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16 ),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
