import 'package:flutter/material.dart';

InputDecoration customInput(String label, String hint) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    hintStyle: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.w500),
    labelStyle: TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.w500),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(0xFF0D47A1), width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(0xFF90CAF9), width: 1.5),
    ),
    filled: true,
    fillColor: Color(0xFFE3F2FD),
  );
}
ButtonStyle customButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF90CAF9),   
    foregroundColor: Colors.white,  
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    shape:BeveledRectangleBorder(
      borderRadius:BorderRadius.circular(5)
    ,side:BorderSide(width: 1,color: Colors.blue.shade400) 
    ),
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 25,
    ),
    elevation: 8,
    shadowColor: Colors.blueAccent.shade100
    
  );
}

