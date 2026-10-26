
import 'package:flutter/material.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/user/domain/objectif.dart';
import 'package:keeptrack/src/features/user/domain/performance.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/objectif_card.dart';
import 'package:keeptrack/theme/theme.dart';

class ObjectifsCarousel extends StatefulWidget {
  const ObjectifsCarousel(this.objectifs, this.performances, {super.key});

  final List<Objectif> objectifs;
  final List<Performance> performances;

  @override
  State<ObjectifsCarousel> createState() => _ObjectifsCarouselState();
}

class _ObjectifsCarouselState extends State<ObjectifsCarousel> {
  int pageActuelle = 0;

  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Sizes.p180,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.objectifs.length,
            onPageChanged: (index) {
              setState(() {
                pageActuelle = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.p4),
                child: ObjectifCard(
                  widget.objectifs[index],
                  widget.performances,
                ),
              );
            },
          ),
        ),
        gapH12,

        Row(
          mainAxisAlignment: .center,
          children: [
            for (int i = 0; i < widget.objectifs.length; i++)
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                margin: EdgeInsets.symmetric(horizontal: Sizes.p4),
                width: i == pageActuelle ? Sizes.p20 : Sizes.p8,
                height: Sizes.p8,
                decoration: BoxDecoration(
                  color: i == pageActuelle
                      ? AppColors.primaryAccent
                      : AppColors.progressBackground,
                  borderRadius: BorderRadius.circular(Sizes.p4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
