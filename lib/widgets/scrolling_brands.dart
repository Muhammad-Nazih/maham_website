import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBrand {
  final String name;
  final String logoUrl;

  SubBrand({required this.name, required this.logoUrl});
}

class ScrollingBrandsBanner extends StatefulWidget {
  const ScrollingBrandsBanner({super.key});

  @override
  State<ScrollingBrandsBanner> createState() => ScrollingBrandsBannerState();
}

class ScrollingBrandsBannerState extends State<ScrollingBrandsBanner> {
  late ScrollController scrollController;
  late Timer timer;

  final List<SubBrand> brands = [
    SubBrand(name: 'Codelytical', logoUrl: 'images/codelytical.png'),
    SubBrand(name: 'Control Lines', logoUrl: 'images/control_lines.png'),
    SubBrand(name: 'Pro Guard', logoUrl: 'images/pro_guard.png'),
    SubBrand(name: 'Antinoopolis', logoUrl: 'images/antinoopolis.png'),
    SubBrand(name: 'Emdad', logoUrl: 'images/emdad_en.png'),
    SubBrand(name: 'Küken', logoUrl: 'images/kuken.png'),
    SubBrand(name: 'Crinkle', logoUrl: 'images/crinkle.png'),
    SubBrand(name: 'Cartel', logoUrl: 'images/cartel.png'),
    SubBrand(name: 'إمداد', logoUrl: 'images/emdad_ar.png'),
  ];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => startAutoScroll());
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (scrollController.hasClients) {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        final nextScroll = currentScroll + 1;

        if (nextScroll >= maxScroll / 2) {
          scrollController.jumpTo(currentScroll - maxScroll / 2);
        } else {
          scrollController.jumpTo(nextScroll);
        }
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 3.2; // show ~3 cards at a time

    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.black.withOpacity(0.2),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: brands.length * 2,
        itemBuilder: (context, index) {
          final brand = brands[index % brands.length];
          return AnimatedBrandCard(brand: brand, width: cardWidth);
        },
      ),
    );
  }
}

class AnimatedBrandCard extends StatefulWidget {
  final SubBrand brand;
  final double width;

  const AnimatedBrandCard({
    required this.brand,
    required this.width,
    super.key,
  });

  @override
  State<AnimatedBrandCard> createState() => AnimatedBrandCardState();
}

class AnimatedBrandCardState extends State<AnimatedBrandCard> {
  bool _hovering = false;

  void handleTap() {
    final url = _getBrandUrl(widget.brand.name);
    _launchUrl(url);
  }

  String _getBrandUrl(String brandName) {
    switch (brandName) {
      case 'Codelytical':
        return 'https://codelytical.com';
      case 'Control Lines':
        return 'https://control-lines.com';
      default:
        return 'https://default-brand.com';
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          width: widget.width,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _hovering ? 1.0 : 0.85,
            child: Card(
              color: Colors.white.withOpacity(0.95),
              elevation: _hovering ? 10 : 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        widget.brand.logoUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      widget.brand.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
