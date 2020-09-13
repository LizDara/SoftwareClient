import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:software_client/src/dialog/fact_message.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final List<FactMessage> _messages = <FactMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ChatBox'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _queryInputWidget(context),
          )
        ],
      ),
    );
  }

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextField(
              controller: _textController,
              onSubmitted: _submitQuery,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _submitQuery(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  _submitQuery(String text) {
    _textController.clear();
    FactMessage message =
        new FactMessage(text: text, name: 'Liz Dara', type: true);
    setState(() {
      _messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: 'assets/pharmacyclient.json').build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.spanish);
    AIResponse response = await dialogflow.detectIntent(query);
    FactMessage message = FactMessage(
        text: response.getMessage() ??
            CardDialogflow(response.getListMessage()[0]).title,
        name: 'Alice',
        type: false);
    setState(() {
      _messages.insert(0, message);
    });
  }
}
