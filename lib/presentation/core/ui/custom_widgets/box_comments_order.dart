import 'package:flutter/material.dart';

class BoxCommentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Comentarios",),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: new TextFormField(
                minLines: 1,
                maxLines: 3,
                decoration: new InputDecoration(
                  labelText: "Comentarios",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    borderSide: new BorderSide(width: 3.0)

                  ),
                  //fillColor: Colors.green
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
