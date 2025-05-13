import 'package:flutter/material.dart';
import 'package:maham_website/pages/widgets/side_bar_menu.dart';
import 'package:maham_website/shared/app_colors.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FC),
      body: SafeArea(
        child: Column(
          children: [
            // Header / Navbar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.health_and_safety,
                        color: Colors.blue,
                        size: 32,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'MAHAM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (isWide)
                    Row(
                      children: [
                        NavItem('Home'),
                        NavItem('Services'),
                        NavItem('Products'),
                        NavItem('About Us'),
                        SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Contact Us'),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // Hero Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child:
                    isWide
                        ? Row(
                          children: [
                            // Text Section
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Because First\nImpressions Matter',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Delivering compassionate, comprehensive dental care that keeps your whole family smiling for years to come.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text('Book Now'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 40),
                            // Image Section
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            300, // عدل الارتفاع حسب التصميم بتاعك
                                        decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/310954422_467273372131269_5522447553533068761_n.png?stp=dst-png_s960x960&_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=vkVGsbFgczQQ7kNvwEVQj1h&_nc_oc=Adk3w3EIt8-ke5lhAzNMQzss4zD0BzDWIzlDOR3_SuwrqaaeqLzVC41l6_wSJDbD2C8&_nc_zt=23&_nc_ht=scontent.fcai20-1.fna&_nc_gid=6mgWGMon06DuraapjZIeNg&oh=00_AfJwWZ-87OjsZLBbEO91zvxkSqUOY8_MU2TlAKYeYQ4NGg&oe=6829B000',
                                            ),
                                            fit:
                                                BoxFit
                                                    .cover, // زي object-fit: cover في CSS
                                            alignment:
                                                Alignment
                                                    .center, // الصورة تتوسط في النص
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: CustomPaint(
                                        painter: DiagonalLinePainter(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Because First\nImpressions Matter',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Delivering compassionate, comprehensive dental care that keeps your whole family smiling for years to come.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('Book Now'),
                            ),
                            SizedBox(height: 20),
                            AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      color: Colors.blue[100],
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          size: 100,
                                          color: Colors.blue[300],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: CustomPaint(
                                      painter: DiagonalLinePainter(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
              ),
            ),

            // Footer (Partners Logos)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Built on trust. Driven by results',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 16,
                    children: [
                      PartnerLogo('Zoom'),
                      PartnerLogo('Asus'),
                      PartnerLogo('AECOM'),
                      PartnerLogo('Nike'),
                      PartnerLogo('Stripe'),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;

  const NavItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
      ),
    );
  }
}

class PartnerLogo extends StatelessWidget {
  final String name;

  const PartnerLogo(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(name, style: TextStyle(fontSize: 16, color: Colors.grey[600]));
  }
}

class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2;

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
