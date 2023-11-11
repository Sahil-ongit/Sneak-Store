import 'package:flutter/material.dart';

class WhiteTile extends StatelessWidget {
  const WhiteTile({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'nikepage'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                height: _mediaquery.size.height * 0.17,
                width: _mediaquery.size.width * 0.95,
                child: Image.asset(
                  'lib/images/Icons/Nike-Logo.png',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'adidaspage'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                height: _mediaquery.size.height * 0.17,
                width: _mediaquery.size.width * 0.95,
                child: Image.asset('lib/images/Icons/Adidas-Logo-now.jpg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'pumapage'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                height: _mediaquery.size.height * 0.17,
                width: _mediaquery.size.width * 0.95,
                child: Image.asset('lib/images/Icons/PUMA-Logo.png'),
              ),
            ),
             SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'vanspage'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                height: _mediaquery.size.height * 0.17,
                width: _mediaquery.size.width * 0.95,
                child: Image.asset('lib/images/Icons/Vans-Logo.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
