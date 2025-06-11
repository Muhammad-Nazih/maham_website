import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  final List<SubBrand> brands = [
    SubBrand(name: 'Codelytical', logoUrl: 'images/codelytical.png'),
    SubBrand(name: 'Crinkle', logoUrl: 'images/crinkle.png'),
    SubBrand(name: 'Emdad', logoUrl: 'images/emdad_en.png'),
    SubBrand(name: 'Control Lines', logoUrl: 'images/control_lines.png'),
    SubBrand(name: 'Pro Guard', logoUrl: 'images/pro_guard.png'),
    SubBrand(name: 'Antinoopolis', logoUrl: 'images/antinoopolis.png'),
    SubBrand(name: 'Küken', logoUrl: 'images/kuken.png'),
    SubBrand(name: 'Cartel', logoUrl: 'images/cartel.png'),
    SubBrand(name: 'إمداد', logoUrl: 'images/emdad_ar.png'),
  ];

  final double spacing = 16; // 16 left + 16 right margin

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollCards(double cardWidth, {required bool forward}) {
    final offsetPerCard = cardWidth + spacing;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    double nextScroll =
        forward ? currentScroll + offsetPerCard : currentScroll - offsetPerCard;

    // Looping logic
    if (nextScroll > maxScroll - offsetPerCard) {
      nextScroll = 0; // رجع للبداية
    } else if (nextScroll < 0) {
      nextScroll = maxScroll; // راح للنهاية
    }

    scrollController.animateTo(
      nextScroll,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final int cardsPerView = 3;
    const double cardScaleFactor = 0.91;
    final cardWidth =
        ((screenWidth - (spacing * (cardsPerView - 1))) / cardsPerView) *
        cardScaleFactor;

    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.black.withOpacity(0.2),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 50,
            ),
            onPressed: () => scrollCards(cardWidth, forward: false),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                final brand = brands[index % brands.length];
                return AnimatedBrandCard(brand: brand, width: cardWidth);
              },
              separatorBuilder: (context, index) => SizedBox(width: spacing),
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 50,
            ),
            onPressed: () => scrollCards(cardWidth, forward: true),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          String lang = Localizations.localeOf(context).languageCode;
          String? route;

          switch (widget.brand.name) {
            case 'Codelytical':
              route = '/$lang/codelytical';
              break;
            case 'Control Lines':
              route = '/$lang/control_lines';
              break;
            case 'Pro Guard':
              route = '/$lang/pro_guard';
              break;
            case 'Antinoopolis':
              route = '/$lang/antinoopolis';
              break;
            case 'Crinkle':
              route = '/$lang/crinkle';
              break;
            case 'Küken':
              route = '/$lang/kuken';
              break;
            case 'Emdad':
              route = '/$lang/emdad';
              break;
            case 'إمداد':
              route = '/$lang/إمداد';
              break;
            case 'Cartel':
              route = '/$lang/cartel';
              break;
          }

          if (route != null) {
            context.go(route);
          }
        },
        child: AnimatedScale(
          scale: _hovering ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            width: widget.width,
            margin: EdgeInsets.zero,
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
      ),
    );
  }
}
