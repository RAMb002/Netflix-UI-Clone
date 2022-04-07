import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
   PopUpDialog({Key? key,required this.mainText,required this.cancelButton,required this.buttonName}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final Color color = Colors.white70;
  final String mainText;
  final bool cancelButton;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10,top: 20,left: 30,right: 10),
      backgroundColor: Colors.grey.shade900,
      key: _key,
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 30),
              width: MediaQuery.of(context).size.width,
              child: Text(mainText,
              style: TextStyle(
                color: color
              ),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible : cancelButton,
                  child: FlatButton(onPressed:(){Navigator.pop(context);}, child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: color
                    ),
                  )),
                ),
                SizedBox(width: 0,),
                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text(
                 buttonName,
                  style: TextStyle(
                    color: color
                  ),
                ),)
              ],
            )
          ],
        ),

      ),
    );
  }
}
