import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class UpcomingShimmer extends StatelessWidget {
  const UpcomingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 0),
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Container(
        width: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(right: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                        lines: 2,
                        spacing: 9,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 15,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 6,
                          maxLength: MediaQuery.of(context).size.width / 3,
                        )
                      ),
                    ),
                  ],
                ),
              ),
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(shape: BoxShape.circle, width: 50, height: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
