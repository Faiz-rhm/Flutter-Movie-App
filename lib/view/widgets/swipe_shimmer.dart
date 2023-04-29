import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SwipeShimmer extends StatelessWidget {
  const SwipeShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Swiper(
        itemCount: 3,
        viewportFraction: 0.42,
        scale: 0.5,
        itemBuilder: (BuildContext context, int index) {
          final movie = index;
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      minHeight: MediaQuery.of(context).size.height / 8,
                      maxHeight: MediaQuery.of(context).size.height / 3,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 30,
                        width: 40,
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsetsDirectional.only(start: 5)
                      ),
                    ),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 30,
                        width: 50,
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsetsDirectional.only(start: 5)
                      ),
                    ),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 30,
                        width: 45,
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsetsDirectional.only(start: 5)
                      ),
                    ),
                  ],
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    padding: const EdgeInsets.all(10.0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
