import 'package:flutter/material.dart';

Widget header(String title, context) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 29),
        //geri ikon
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 32,
            color: Color(0xFF0A1034),
          ),
        ),

        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}

Widget headerKullaniciBilgileri(String title, context) {
  return Padding(
    padding: EdgeInsets.only(
      top: 45.0,
      right: 10.0,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}

Widget headerOdul(String title, context) {
  return Padding(
    padding: EdgeInsets.only(
      top: 45.0,
      right: 10.0,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}

Widget headerSimdiBasla(String title, context) {
  return Padding(
    padding: EdgeInsets.only(top: 35.0, right: 10.0, bottom: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //geri ikon
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 27,
            color: Color(0xFF0A1034),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}

Widget headerMenu(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 26,
      ),
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF0A1034)),
      ),
    ],
  );
}
