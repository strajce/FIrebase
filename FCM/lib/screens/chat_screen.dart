import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/xvau2lLhvpDFWMFwNZBY/messages')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final document = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) => (Container(
              padding: EdgeInsets.all(8),
              child: Text(document[index]['text']),
            )),
          );
        },
      )
      //         ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) => (Container(
      //     padding: EdgeInsets.all(8),
      //     child: Text('That\'s works!!'),
      //   )),
      // ),
      ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Firestore.instance
          //     .collection('chats/xvau2lLhvpDFWMFwNZBY/messages')
          //     .snapshots()
          //     .listen((event) {
          // print(event.documents[0]['text']);
          // event.documents.forEach((element) {
          // print(element['text']);
          // });
          // });
          Firestore.instance
              .collection('chats/xvau2lLhvpDFWMFwNZBY/messages')
              .add({'text': 'This text was added but clicking on button!'});
        },
      ),
    );
  }
}
