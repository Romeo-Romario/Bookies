import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class FinishBookPage extends StatefulWidget {
  final String bookName;
  const FinishBookPage({super.key, required this.bookName});

  @override
  State<FinishBookPage> createState() => _FinishBookPageState();
}

class _FinishBookPageState extends State<FinishBookPage> {
  double rating = 0.0;
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 178, 223),
      appBar: AppBar(
        title: Text("Congratulations"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(92, 107, 192, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onTap,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 5,
          children: [
            Icon(Icons.auto_awesome_outlined),
            Text("Confirm"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You have finished book:",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 94, 40, 188)),
              ),
              Text(
                widget.bookName,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 0,
              ),
              Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
                StarRating(
                  onRatingChanged: (rating) => setState(() {
                    this.rating = rating;
                  }),
                  starCount: 5,
                  size: 50,
                  rating: rating,
                  allowHalfRating: true,
                ),
                Positioned(
                  top: -20,
                  child: Text(
                    "Rate your experience",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple),
                  ),
                )
              ]),
              SizedBox(
                height: 350,
                width: double.infinity,
                child: TextFormField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    labelText: "Write feedback",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(top: 12, left: 12),
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() async {
    if (await checkData()) {
    } else {
      Navigator.pop(
          context, {"rating": rating, "feedback": feedbackController.text});
    }
  }

  Future<bool> checkData() async {
    if (rating == 0 || feedbackController.text.isEmpty) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Please, fill all the fields",
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            );
          });
      return true;
    }
    return false;
  }
}
