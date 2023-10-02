import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskoctohub/View/Dashboard/completedPage.dart';
import '../../../Res/Utils/color.dart';
class CompleteBottomSheet extends StatefulWidget {
  const CompleteBottomSheet({super.key});

  @override
  State<CompleteBottomSheet> createState() => _CompleteBottomSheetState();
}

class _CompleteBottomSheetState extends State<CompleteBottomSheet> {
  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 0,top: 16,bottom: 16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.question_mark)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 8),
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm',
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                            color: Colors.white
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Do you want to mark this task as completed',
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Open Sans',
                            color: Colors.white
                        ),
                        //  overflow: TextOverflow.ellipsis,
                      ),


                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 40,
              width:100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: primary)
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),


),
                    primary: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                //           TextEditingController _titleCtrl = TextEditingController();
                //         TextEditingController _noteCtrl= TextEditingController();
                //   TextEditingController _dateCtrl= TextEditingController();
                // TextEditingController _timeCtrl= TextEditingController();
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompletedPage(
complete:true
                        )),
                  );

                } ,child: Text(
                'Complete',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  color: primary,
                  fontWeight: FontWeight.w300,
                ),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

