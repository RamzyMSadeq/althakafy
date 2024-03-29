import 'package:althaqafy/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewBooksScreen extends StatefulWidget {
  final String bookUrl;
  final String name;

  const ViewBooksScreen({this.bookUrl, this.name});

  @override
  _ViewBooksScreenState createState() => _ViewBooksScreenState();
}

class _ViewBooksScreenState extends State<ViewBooksScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
   // loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: greenColor,
          centerTitle: true,
          title: Text("${widget.name}"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: PDF(
            swipeHorizontal: true,
            

          ).cachedFromUrl(
          
          '${widget.bookUrl}',
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text("++++++++++++++++++++"+error.toString())),
        ),
        )
    

        );
  }
}
