import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasky/componenets/task_model.dart';

class ProductDetails extends StatelessWidget {
  final Task data;
  final String time;

  ProductDetails(this.data, this.time);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.ellipsis_vertical,color: Colors.black,))
        ],
        title: Text(
          "Task Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/online-shopping.jpg"),
                ),
              ),
              SizedBox(height: 12),
              Text(
                data.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                data.description,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(10),
                width: 326,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffF0ECFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${data.timestamp.toLocal().day}-${data.timestamp.toLocal().month}-${data.timestamp.toLocal().year}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      size: 24,
                      Icons.calendar_month_outlined,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(10),
                width: 326,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffF0ECFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      size: 24,
                      Icons.flag_outlined,
                      color: Colors.purple,
                    ),
                    Text(
                      "${data.priority}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Center(
                  child: QrImageView(
                    data: time,
                    size: 280,
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: const Size(
                        100,
                        100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
