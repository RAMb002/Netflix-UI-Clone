import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/the_provider/account/names.dart';
import 'package:netflix_clone/widgets/pop_up_dialog.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.identity})
      : super(key: key);

  final String imagePath;
  final String name;
  final String identity;

  @override
  State<EditProfile> createState() => _EditProfileState();
}
bool rotation = false;
class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    print('account vuild');


    final TextEditingController textEditingController = TextEditingController();
    textEditingController..text = widget.name ..selection = TextSelection.collapsed(offset:  widget.name.length);


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '  Edit Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          // Icon(Icons.edit,color: Colors.white,),
          Center(
            child: GestureDetector(
              onTap: () async{
                setState(() {
                  rotation=true;
                });
                FocusScope.of(context).unfocus();
                if (widget.identity == 'name1') {
                  Provider.of<AccountName>(context, listen: false)
                      .changeName1(textEditingController.text);
                }
                if (widget.identity == 'name2') {
                  Provider.of<AccountName>(context, listen: false)
                      .changeName2(textEditingController.text);
                }
                if (widget.identity == 'name3') {
                  Provider.of<AccountName>(context, listen: false)
                      .changeName3(textEditingController.text);
                }
                if (widget.identity == 'name4') {
                  Provider.of<AccountName>(context, listen: false)
                      .changeName4(textEditingController.text);
                }
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  rotation = false;
                });
                Navigator.pop(context);
              },
              child: Visibility(
                visible: !rotation,
                child: Text(
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green[400],
                  ),
                ),
              ),
            ),
          ),
          Icon(
            Icons.edit,
            color: Colors.black,
            size: 14,
          )
          // Container(height: 120,width: 20,color: Colors.red,),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 110,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: textEditingController,
                    cursorColor: Colors.white,
                    cursorHeight: 22,
                    // showCursor: data.focusValue(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade900, width: 1)),
                      fillColor: Colors.grey[900],
                      filled: true,
                      // isDense: true
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  'ALL MATURITY RATINGS',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Show titles of all maturity ratings for this profile.',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Visit  ',
                      style: TextStyle(
                        color: Colors.white24,
                      )),
                  TextSpan(
                      text: 'Account Settings',
                      style: TextStyle(
                        color: Colors.blue,
                      )),
                  TextSpan(
                      text: '  to change',
                      style: TextStyle(
                        color: Colors.white24,
                      )),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: FlatButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    // isScrollControlled: true,
                    builder: (context) => PopUpDialog(
                      mainText: 'The profile cannot be deleted because it is currently active. Please switch profiles to delete this profile.',
                      buttonName:  'OK',
                      cancelButton: false ,
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Delete Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
              child: Visibility(
            visible: rotation,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.75),
            ),
          )),
          Positioned(
            child: Visibility(
              visible: rotation,
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
