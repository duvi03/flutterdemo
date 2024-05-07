import 'package:flutter/material.dart';

class ConstWidget{
  static commonItem({ required String index,required String name,VoidCallback? onTap}){
    return  GestureDetector(
      onTap: onTap ?? (){},
      child: Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 50),
                margin: const EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                  color: Colors.purple.shade900,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.shade900,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Center(
                child: Text(
                  index,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}