import 'package:example_flutter/src/screens/vinyl_disc/album.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

const _bgColor = Color(0xFFECECEA);

class VinylDiscScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _MyDiscHeader(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20.00),
                child: Text(currentAlbum.description),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtend = 350.0;
const _minHeaderExtend = 100.0;

const _maxImageSize = 160.0;
const _minImageSize = 60.0;

const _leftMarginDisc = 160.0;

const _maxTitleSize = 27.0;
const _maxSubTitleSize = 17.0;

const _minTitleSize = 15.0;
const _minSubTitleSize = 12.0;

double getSize(double max, double min, double percent) {
  return (max * (1 - percent)).clamp(min, max);
}

class _MyDiscHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtend;
    final size = MediaQuery.of(context).size;
    final currentImageSize = getSize(_maxImageSize, _minImageSize, percent);
    final titleSize = getSize(_maxTitleSize, _minTitleSize, percent);
    final subtitleSize = getSize(_maxSubTitleSize, _minSubTitleSize, percent);

    final maxMargin = size.width / 3.5;
    final textMovement = 50.0;
    final leftTextMargin = maxMargin + (textMovement * percent);

    return Container(
      color: _bgColor,
      child: Stack(
        children: [
          Positioned(
              top: 45.0,
              left: leftTextMargin,
              height: _maxImageSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentAlbum.artist,
                    style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2),
                  ),
                  Text(currentAlbum.album,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: subtitleSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.2))
                ],
              )),
          Positioned(
              bottom: 15.0,
              left: (_leftMarginDisc * (1 - percent))
                  .clamp(33.0, _leftMarginDisc),
              height: currentImageSize,
              child: Transform.rotate(
                  angle: vector.radians(360 * percent),
                  child: Image.asset(currentAlbum.imageDisc))),
          Positioned(
              bottom: 20.0,
              left: 35,
              height: currentImageSize,
              child: Image.asset(currentAlbum.imageAlbum)),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtend;

  @override
  double get minExtent => _minHeaderExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
