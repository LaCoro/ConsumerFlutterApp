import 'package:flutter/material.dart';

class BoxCommentOrder extends StatelessWidget {

  String comment = "Esto es una prueba de texto, para la caja de commentario de Lacoro, calle #45 carrera 78-bis-99 ";

  BoxCommentOrder(this.comment);

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
              child: new TextFormField(initialValue: comment,
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
