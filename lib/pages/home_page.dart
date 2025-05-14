import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                      Image.asset(
                        'assets/images/logo.png',
                        width: 70,
                        height: 70,
                      ),
                      SizedBox(width: 5),
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
                        TextButton(onPressed: () {}, child: NavItem('Home')),
                        TextButton(
                          onPressed: () {},
                          child: NavItem('Services'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: NavItem('Products'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: NavItem('About Us'),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Contact Us',
                            style: TextStyle(color: Colors.white),
                          ),
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
                                ],
                              ),
                            ),
                            SizedBox(width: 40),
                            // Image Section
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/maham.png',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
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
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Crinkle')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Codelytical')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Cartel')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Control Lines')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Emdad')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Kuken')),
                      TextButton(
                        onPressed: () {},
                        child: PartnerLogo('Antinoopolis')),
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


