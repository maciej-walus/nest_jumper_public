import 'package:flutter/material.dart';
import '../../logic/json_handling.dart';

class MirowPage extends StatefulWidget {
  const MirowPage({required this.title, super.key});
  final String title;
  @override
  _MirowPageState createState() => _MirowPageState();
}

class _MirowPageState extends State<MirowPage> {

  final JsonHandler _jsonHandler = JsonHandler();
  int id = 11;
  String _description = '';
  String _name = '';
  String _tag = '';

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  _loadJson() async {
    await _jsonHandler.loadJson();
    setState(() {
      _name = _jsonHandler.returnName(id);
      _description = _jsonHandler.returnDescription(id);
      _tag = _jsonHandler.returnTag(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_name, style: textTheme.bodyMedium),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/$_tag/${_tag}_1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: _description.isEmpty
                      ? CircularProgressIndicator()
                      : Text(_description.replaceAll('\\n', '\n'), style: textTheme.bodySmall,),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/$_tag/${_tag}_2.png'),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/$_tag/${_tag}_2.png'),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/$_tag/${_tag}_1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}