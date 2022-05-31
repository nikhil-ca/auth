import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    hintText: '',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 1.0
        )
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.deepPurple,
            width:1.0
        )
    )
);