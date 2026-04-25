import 'package:flutter/material.dart';

class C {
  static const surface = Color(0xFFF4F4F7);
  static const white = Colors.white;
  static const gold = Color(0xFFFFB300);
  static const textDark = Color(0xFF14142B);
  static const textGrey = Color(0xFF8E8E9A);
  static const popupBg = Color(0xFF2D2B52);
  static const popupCard = Color(0xFF3A3860);
}

const _relatedVideos = [
  {
    'image': 'https://picsum.photos/seed/rv1/160/160',
    'category': 'Technology',
    'title': "Vietnam's aviation hits record 83.5 million passengers",
    'desc': 'Ngành hàng không Việt Nam đạt kỷ lục 83,5',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
    'duration': '8:45',
  },
  {
    'image': 'https://picsum.photos/seed/rv2/160/160',
    'category': 'Business',
    'title': 'Trump issues ultimatum to Iran over Hormuz.',
    'desc': 'Ông Trump ra tối hậu thư cho Iran về Hormuz',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
    'duration': '5:22',
  },
  {
    'image': 'https://picsum.photos/seed/rv3/160/160',
    'category': 'Life',
    'title': 'Ministry urges businesses to allow work from home to save fuel',
    'desc': 'Bộ khuyến khích các doanh nghiệp cho phép ...',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
    'duration': '6:10',
  },
];

const _wordDict = {
  'vietnam': {
    'phonetic': '/viˌɛtˈnɑːm/',
    'meaning': 'Việt Nam',
    'example_en': "Vietnam's AI industry just took a leap forward.",
    'example_vi': 'Ngành AI của Việt Nam vừa có bước tiến vượt bậc.',
  },
  "vietnam's": {
    'phonetic': '/viˌɛtˈnɑːmz/',
    'meaning': 'Của Việt Nam',
    'example_en': "Vietnam's economy has grown rapidly in recent years.",
    'example_vi':
        'Nền kinh tế của Việt Nam đã tăng trưởng nhanh trong những năm gần đây.',
  },
  'ai': {
    'phonetic': '/ˌeɪˈaɪ/',
    'meaning': 'Trí tuệ nhân tạo (AI)',
    'example_en': 'AI is transforming every industry around the world.',
    'example_vi': 'AI đang biến đổi mọi ngành công nghiệp trên thế giới.',
  },
  'industry': {
    'phonetic': '/ˈɪn.də.stri/',
    'meaning': 'Ngành công nghiệp',
    'example_en': 'The technology industry is growing very fast.',
    'example_vi': 'Ngành công nghệ đang phát triển rất nhanh.',
  },
  'just': {
    'phonetic': '/dʒʌst/',
    'meaning': 'Vừa mới / Chỉ',
    'example_en': 'She just arrived at the office this morning.',
    'example_vi': 'Cô ấy vừa mới đến văn phòng sáng nay.',
  },
  'took': {
    'phonetic': '/tʊk/',
    'meaning': 'Đã thực hiện (quá khứ của take)',
    'example_en': 'He took a big leap of faith with his new startup.',
    'example_vi':
        'Anh ấy đã thực hiện một bước nhảy liều lĩnh với startup mới.',
  },
  'leap': {
    'phonetic': '/liːp/',
    'meaning': 'Bước nhảy vọt',
    'example_en': 'The company took a great leap forward this year.',
    'example_vi': 'Công ty đã có bước nhảy vọt trong năm nay.',
  },
  'forward': {
    'phonetic': '/ˈfɔː.wəd/',
    'meaning': 'Tiến về phía trước',
    'example_en': 'We need to move forward with the new plan.',
    'example_vi': 'Chúng ta cần tiến về phía trước với kế hoạch mới.',
  },
  'a': {
    'phonetic': '/eɪ/',
    'meaning': 'Một (mạo từ)',
    'example_en': 'A new era of technology has begun.',
    'example_vi': 'Một kỷ nguyên công nghệ mới đã bắt đầu.',
  },
};

class VideoDetailScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const VideoDetailScreen({super.key, required this.data});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  double _progress = 0.35;
  bool _isFollowing = false;
  bool _showEnSubtitle = false;
  bool _showViSubtitle = false;
  bool _isPipMode = false;

  late AnimationController _pipAnimCtrl;
  late Animation<double> _pipScaleAnim;

  @override
  void initState() {
    super.initState();
    _pipAnimCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _pipScaleAnim = CurvedAnimation(
      parent: _pipAnimCtrl,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _pipAnimCtrl.dispose();
    super.dispose();
  }

  void _togglePlayPause() => setState(() {
    _isPlaying = !_isPlaying;
    _showEnSubtitle = _isPlaying;
  });

  void _togglePip() {
    if (_isPipMode) {
      _pipAnimCtrl.reverse().then((_) {
        if (mounted) setState(() => _isPipMode = false);
      });
    } else {
      setState(() => _isPipMode = true);
      _pipAnimCtrl.forward();
    }
  }

  void _toggleCc() => setState(() => _showViSubtitle = !_showViSubtitle);

  void _showWordPopup(String rawWord) {
    if (!_showViSubtitle) return;
    final key = rawWord.toLowerCase().replaceAll(RegExp(r"[^a-z']"), '');
    final dict =
        _wordDict[key] ??
        {
          'phonetic': '/$key/',
          'meaning': '(Chưa có dữ liệu)',
          'example_en': 'No example available.',
          'example_vi': 'Chưa có ví dụ.',
        };
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => _WordPopupDialog(word: rawWord, dict: dict),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: C.surface,
          body: Column(
            children: [
              if (!_isPipMode)
                _VideoPlayerArea(
                  imageUrl:
                      widget.data['image'] as String? ??
                      'https://picsum.photos/seed/vid1/400/260',
                  isPlaying: _isPlaying,
                  progress: _progress,
                  duration: widget.data['duration'] as String? ?? '12:00',
                  showEnSubtitle: _showEnSubtitle,
                  showViSubtitle: _showViSubtitle,
                  ccEnabled: _showViSubtitle,
                  pipEnabled: _isPipMode,
                  onBack: () => Navigator.pop(context),
                  onPlayPause: _togglePlayPause,
                  onProgressChanged: (v) => setState(() => _progress = v),
                  onRewind:
                      () => setState(
                        () => _progress = (_progress - 0.05).clamp(0.0, 1.0),
                      ),
                  onFastForward:
                      () => setState(
                        () => _progress = (_progress + 0.05).clamp(0.0, 1.0),
                      ),
                  onToggleCc: _toggleCc,
                  onTogglePip: _togglePip,
                  onWordTap: _showWordPopup,
                ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          16,
                          _isPipMode ? 52 : 12,
                          16,
                          0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['title'] as String? ??
                                  'The Rise of Generative AI in Southeast Asia | Full Documentary',
                              style: const TextStyle(
                                color: C.textDark,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.data['desc'] as String? ??
                                  'Sự trỗi dậy của AI tạo sinh ở Đông Nam Á | Phóng sự đầy đủ',
                              style: const TextStyle(
                                color: C.textGrey,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 1, color: Color(0xFFE8E8F0)),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFE8E8F0),
                                  width: 2,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  'https://picsum.photos/seed/author1/100/100',
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) => Container(
                                        color: const Color(0xFFD0D0EA),
                                        child: const Icon(
                                          Icons.person,
                                          color: Color(0xFF8888AA),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'VnExpress',
                                    style: TextStyle(
                                      color: C.textDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '2 hours ago',
                                    style: TextStyle(
                                      color: C.textGrey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => setState(
                                    () => _isFollowing = !_isFollowing,
                                  ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      _isFollowing
                                          ? C.gold.withValues(alpha: 0.12)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _isFollowing ? '✓ Following' : 'Follow',
                                  style: const TextStyle(
                                    color: C.gold,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 1, color: Color(0xFFE8E8F0)),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                        child: Text(
                          'Related videos',
                          style: TextStyle(
                            color: C.textDark,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ..._relatedVideos.map(
                        (v) => _RelatedVideoItem(
                          data: v,
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => VideoDetailScreen(
                                        data: {
                                          'image': v['image'],
                                          'title': v['title'],
                                          'desc': v['desc'],
                                          'duration': v['duration'],
                                        },
                                      ),
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_isPipMode) ...[
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 12,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          _PipFloatingPlayer(
            imageUrl:
                widget.data['image'] as String? ??
                'https://picsum.photos/seed/vid1/400/260',
            isPlaying: _isPlaying,
            progress: _progress,
            screenSize: screenSize,
            scaleAnim: _pipScaleAnim,
            onClose: _togglePip,
            onPlayPause: _togglePlayPause,
            onExpand:
                () => _pipAnimCtrl.reverse().then((_) {
                  if (mounted) setState(() => _isPipMode = false);
                }),
          ),
        ],
      ],
    );
  }
}

class _VideoPlayerArea extends StatelessWidget {
  final String imageUrl;
  final bool isPlaying;
  final double progress;
  final String duration;
  final bool showEnSubtitle;
  final bool showViSubtitle;
  final bool ccEnabled;
  final bool pipEnabled;
  final VoidCallback onBack;
  final VoidCallback onPlayPause;
  final ValueChanged<double> onProgressChanged;
  final VoidCallback onRewind;
  final VoidCallback onFastForward;
  final VoidCallback onToggleCc;
  final VoidCallback onTogglePip;
  final ValueChanged<String> onWordTap;

  static const _subtitleEn = "Vietnam's AI industry just took a leap forward";
  static const _subtitleVi = 'Ngành AI của Việt Nam vừa có bước tiến vượt bậc';

  const _VideoPlayerArea({
    required this.imageUrl,
    required this.isPlaying,
    required this.progress,
    required this.duration,
    required this.showEnSubtitle,
    required this.showViSubtitle,
    required this.ccEnabled,
    required this.pipEnabled,
    required this.onBack,
    required this.onPlayPause,
    required this.onProgressChanged,
    required this.onRewind,
    required this.onFastForward,
    required this.onToggleCc,
    required this.onTogglePip,
    required this.onWordTap,
  });

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final parts = duration.split(':');
    final totalSec = int.parse(parts[0]) * 60 + int.parse(parts[1]);
    final curSec = (progress * totalSec).round();
    final curMin = (curSec ~/ 60).toString().padLeft(2, '0');
    final curSecStr = (curSec % 60).toString().padLeft(2, '0');

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 190 + top,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) =>
                              Container(color: const Color(0xFF23234A)),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.25),
                    ),
                  ),
                  Positioned(
                    top: top + 8,
                    left: 12,
                    right: 12,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onBack,
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.45),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: onTogglePip,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  pipEnabled
                                      ? C.gold.withValues(alpha: 0.9)
                                      : Colors.black.withValues(alpha: 0.45),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.picture_in_picture_alt_rounded,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: onToggleCc,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  ccEnabled
                                      ? C.gold.withValues(alpha: 0.9)
                                      : Colors.black.withValues(alpha: 0.45),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'CC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showEnSubtitle || showViSubtitle)
                    Positioned(
                      bottom: 10,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (showEnSubtitle)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.65),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: _TappableSubtitle(
                                text: _subtitleEn,
                                onWordTap: onWordTap,
                                tappable: showViSubtitle,
                              ),
                            ),
                          if (showEnSubtitle && showViSubtitle)
                            const SizedBox(height: 4),
                          if (showViSubtitle)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.50),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                _subtitleVi,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFDDDDFF),
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  height: 1.4,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (!showEnSubtitle && !showViSubtitle)
                    Positioned(
                      right: 12,
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onRewind,
                        child: const SizedBox(
                          width: 34,
                          height: 28,
                          child: Center(
                            child: Icon(
                              Icons.fast_rewind_rounded,
                              color: C.textDark,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: onPlayPause,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: C.gold,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x55FFB300),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: onFastForward,
                        child: const SizedBox(
                          width: 34,
                          height: 28,
                          child: Center(
                            child: Icon(
                              Icons.fast_forward_rounded,
                              color: C.textDark,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2.5,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 5,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 12,
                      ),
                      activeTrackColor: C.gold,
                      inactiveTrackColor: const Color(0xFFE0E0EA),
                      thumbColor: C.gold,
                      overlayColor: const Color(0x33FFB300),
                    ),
                    child: SizedBox(
                      height: 22,
                      child: Slider(
                        value: progress,
                        onChanged: onProgressChanged,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 4,
                      bottom: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$curMin:$curSecStr',
                          style: const TextStyle(
                            color: C.textGrey,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          duration,
                          style: const TextStyle(
                            color: C.textGrey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TappableSubtitle extends StatelessWidget {
  final String text;
  final ValueChanged<String> onWordTap;
  final bool tappable;

  const _TappableSubtitle({
    required this.text,
    required this.onWordTap,
    required this.tappable,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 3,
      children:
          text.split(' ').map((word) {
            return GestureDetector(
              onTap: tappable ? () => onWordTap(word) : null,
              child: Text(
                '$word ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                  decoration:
                      tappable ? TextDecoration.underline : TextDecoration.none,
                  decorationColor: const Color(0x88FFFFFF),
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
            );
          }).toList(),
    );
  }
}

class _PipFloatingPlayer extends StatefulWidget {
  final String imageUrl;
  final bool isPlaying;
  final double progress;
  final Size screenSize;
  final Animation<double> scaleAnim;
  final VoidCallback onClose;
  final VoidCallback onPlayPause;
  final VoidCallback onExpand;

  const _PipFloatingPlayer({
    required this.imageUrl,
    required this.isPlaying,
    required this.progress,
    required this.screenSize,
    required this.scaleAnim,
    required this.onClose,
    required this.onPlayPause,
    required this.onExpand,
  });

  @override
  State<_PipFloatingPlayer> createState() => _PipFloatingPlayerState();
}

class _PipFloatingPlayerState extends State<_PipFloatingPlayer> {
  static const double _w = 180;
  static const double _h = 108;
  late Offset _pos;

  @override
  void initState() {
    super.initState();
    _pos = Offset(
      widget.screenSize.width - _w - 14,
      widget.screenSize.height - _h - 90,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _pos.dx,
      top: _pos.dy,
      child: ScaleTransition(
        scale: widget.scaleAnim,
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onPanUpdate:
              (d) => setState(() {
                _pos = Offset(
                  (_pos.dx + d.delta.dx).clamp(
                    0.0,
                    widget.screenSize.width - _w,
                  ),
                  (_pos.dy + d.delta.dy).clamp(
                    0.0,
                    widget.screenSize.height - _h - 60,
                  ),
                );
              }),
          child: Container(
            width: _w,
            height: _h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) =>
                              Container(color: const Color(0xFF23234A)),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: widget.progress,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(C.gold),
                      minHeight: 3,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: widget.onPlayPause,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: C.gold.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: GestureDetector(
                      onTap: widget.onExpand,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.55),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.open_in_full_rounded,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: widget.onClose,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.55),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
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

class _WordPopupDialog extends StatefulWidget {
  final String word;
  final Map<String, dynamic> dict;

  const _WordPopupDialog({required this.word, required this.dict});

  @override
  State<_WordPopupDialog> createState() => _WordPopupDialogState();
}

class _WordPopupDialogState extends State<_WordPopupDialog> {
  bool _saved = false;

  @override
  Widget build(BuildContext context) {
    final cleanWord = widget.word.toLowerCase().replaceAll(
      RegExp(r"[^a-z''-]"),
      '',
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        decoration: BoxDecoration(
          color: C.popupBg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cleanWord,
                        style: const TextStyle(
                          color: C.gold,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.dict['phonetic'] as String,
                        style: const TextStyle(
                          color: C.gold,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.record_voice_over_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _PopupCard(
              label: 'Nghĩa Tiếng Việt',
              child: Text(
                widget.dict['meaning'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _PopupCard(
              label: 'Ví dụ trong câu',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dict['example_en'] as String,
                    style: const TextStyle(
                      color: C.gold,
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.dict['example_vi'] as String,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 12.5,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => setState(() => _saved = !_saved),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: _saved ? Colors.white.withValues(alpha: 0.12) : C.gold,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _saved ? '✓ Đã lưu vào kho' : 'Lưu vào kho',
                    style: TextStyle(
                      color: _saved ? C.gold : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PopupCard extends StatelessWidget {
  final String label;
  final Widget child;

  const _PopupCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
      decoration: BoxDecoration(
        color: C.popupCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 11.5,
            ),
          ),
          const SizedBox(height: 5),
          child,
        ],
      ),
    );
  }
}

class _RelatedVideoItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onTap;

  const _RelatedVideoItem({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: C.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 90,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      data['image'] as String,
                      width: 100,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(
                            color: const Color(0xFFE0E0EA),
                            child: const Icon(
                              Icons.image,
                              color: Color(0xFFB0B0CC),
                            ),
                          ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: C.gold,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF5050A0).withValues(alpha: 0.5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      data['category'] as String,
                      style: const TextStyle(
                        color: Color(0xFF5050A0),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data['title'] as String,
                    style: const TextStyle(
                      color: C.textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data['desc'] as String,
                    style: const TextStyle(color: C.textGrey, fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${data['source']} · ${data['time']}',
                          style: const TextStyle(
                            color: C.gold,
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 12,
                        color: C.textGrey,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        data['views'] as String,
                        style: const TextStyle(color: C.textGrey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
