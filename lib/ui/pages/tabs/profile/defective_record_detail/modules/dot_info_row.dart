part of '../defective_record_detail.dart';

class _DotIndicatorRow extends StatelessWidget {
  const _DotIndicatorRow({
    Key? key,
    required this.imgList,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final List<String> imgList;
  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 2.w,
            height: 2.w,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0.2.w, color: MyColors().grey_600),
                color: (_current != entry.key
                    ? MyColors().grey_300
                    : MyColors().grey_700)),
          ),
        );
      }).toList(),
    );
  }
}