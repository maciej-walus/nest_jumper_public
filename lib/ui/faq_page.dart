import 'package:flutter/material.dart';
import '../logic/json_handling.dart';
import 'menu.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key, required String title});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  JsonHandler _jsonHandler = JsonHandler();
  List<dynamic> _faqData = [];

  @override
  void initState() {
    super.initState();
    _loadFaqData();
  }

  Future<void> _loadFaqData() async {
    await _jsonHandler.loadFaqJson();
    setState(() {
      _faqData = _jsonHandler.jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ', style: textTheme.bodyMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: _faqData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _faqData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(_faqData[index]['question'], style: textTheme.bodyMedium),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom:5.0),
                    child: Text(_faqData[index]['answer'], style: textTheme.bodySmall),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
