import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../article/article_detail_screen.dart';
import '../video/video_detail_screen.dart';

// ══════════════════════════════════════════════
//  COLORS
// ══════════════════════════════════════════════
class C {
  static const bg = Color(0xFF1A1A2E);
  static const surface = Color(0xFFF4F4F7);
  static const white = Colors.white;
  static const yellow = Color(0xFFFFD84D);
  static const gold = Color(0xFFFFB300);
  static const textDark = Color(0xFF14142B);
  static const textGrey = Color(0xFF8E8E9A);
  static const badge = Colors.red;
  static const navBg = Color(0xFF1E1B3A);
}

//  MOCK DATA
const _breakingCards = [
  {
    'image': 'https://picsum.photos/seed/vn1/400/220',
    'title': 'Vietnam-Singapore trade hits record',
    'desc': 'Thương mại giữa Việt Nam – Singapore đạt kỷ lục',
    'tag': 'Technology',
    'time': '2 hours ago',
    'source': 'Nguồn: VnExpress',
    'views': '8,402',
    'category': 'Technology',
  },
  {
    'image': 'https://picsum.photos/seed/vn2/400/220',
    'title': 'Vietnam-Japan summit yields new deals',
    'desc': 'Thương mại giữa Việt Nam – Nhật Bản đạt kỷ lục',
    'tag': 'Technology',
    'time': '3 hours ago',
    'source': 'Nguồn: VnExpress',
    'views': '6,211',
    'category': 'Business',
  },
];

const _videoCards = [
  {
    'image': 'https://picsum.photos/seed/vid1/400/260',
    'title': 'The Rise of Generative AI in..',
    'desc': 'Sự trỗi dậy của AI tạo sinh ở...',
    'source': 'VNExpress',
    'duration': '24:00',
  },
  {
    'image': 'https://picsum.photos/seed/vid2/400/260',
    'title': 'The Rise of Generative AI..',
    'desc': 'Sự trỗi dậy của AI tạo sinh ở...',
    'source': 'VNExpress',
    'duration': '18:30',
  },
];

const _forYou = [
  {
    'image': 'https://picsum.photos/seed/a1/160/160',
    'category': 'Technology',
    'title': "Vietnam's aviation hits record 83.5 million passengers",
    'desc': 'Ngành hàng không Việt Nam đạt kỷ lục 83,5',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
  {
    'image': 'https://picsum.photos/seed/a2/160/160',
    'category': 'Business',
    'title': 'Trump issues ultimatum to Iran over Hormuz.',
    'desc': 'Ông Trump ra tối hậu thư cho Iran về Hormuz',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
  {
    'image': 'https://picsum.photos/seed/a3/160/160',
    'category': 'Life',
    'title': 'Ministry urges businesses to allow work from home',
    'desc': 'Bộ khuyến khích các doanh nghiệp cho phép ...',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
];

const _recentlyRead = [
  {
    'image': 'https://picsum.photos/seed/r1/160/160',
    'category': 'Life',
    'title': 'Vietnam emerges as global economic growth leader',
    'desc': 'Việt Nam vươn lên dẫn đầu tăng trưởng kinh tế toàn cầu',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
  {
    'image': 'https://picsum.photos/seed/r2/160/160',
    'category': 'World',
    'title': "Russia becomes Vietnam's 3rd largest source of tourists",
    'desc': 'Nga vượt qua Campuchia để trở thành nguồn khách lớn thứ 3.',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
  {
    'image': 'https://picsum.photos/seed/r3/160/160',
    'category': 'Education',
    'title': "Vietnam's oldest courthouse in HCMC restored",
    'desc': 'Tòa án cổ nhất Việt Nam tại Thành phố Hồ Chí Minh...',
    'source': 'Nguồn: VnExpress',
    'time': '2 ngày trước',
    'views': '12,234',
  },
];

//  HOME SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  void _goToArticle(Map<String, String> data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ArticleDetailScreen(data: data)),
    );
  }

  void _goToVideo(Map<String, String> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => VideoDetailScreen(data: Map<String, dynamic>.from(data)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.surface,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            Transform.translate(
              offset: const Offset(0, -80),
              child: _BreakingNewsCards(onTap: _goToArticle),
            ),
            Transform.translate(
              offset: const Offset(0, -72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BreakingVideoSection(onTap: _goToVideo),
                  const SizedBox(height: 20),
                  _ArticleSection(
                    title: 'For you',
                    items: _forYou,
                    onTap: _goToArticle,
                  ),
                  const SizedBox(height: 20),
                  _ArticleSection(
                    title: 'Recently read',
                    items: _recentlyRead,
                    onTap: _goToArticle,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _ScallopNavBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

//  HEADER
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      decoration: const BoxDecoration(
        color: C.bg,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, top + 12, 20, 104),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: C.yellow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('✦', style: TextStyle(fontSize: 22, color: C.bg)),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'AINews',
                style: TextStyle(
                  color: C.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: C.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: C.navBg,
                      size: 22,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 19,
                      height: 19,
                      decoration: const BoxDecoration(
                        color: C.badge,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: C.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Good Morning! Linh 👋',
            style: TextStyle(
              color: C.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Discover Breaking News',
            style: TextStyle(
              color: C.yellow,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Color(0xAAFFFFFF), size: 21),
                      SizedBox(width: 9),
                      Text(
                        'Find breaking news',
                        style: TextStyle(
                          color: Color(0xAAFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.tune, color: C.white, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            'Breaking News 🔥',
            style: TextStyle(
              color: C.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//  BREAKING NEWS CARDS
class _BreakingNewsCards extends StatelessWidget {
  final Function(Map<String, String>) onTap;
  const _BreakingNewsCards({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _breakingCards.length,
          itemBuilder: (ctx, i) {
            final item = _breakingCards[i];
            return GestureDetector(
              onTap: () => onTap(Map<String, String>.from(item)),
              child: Container(
                width: 260,
                margin: EdgeInsets.only(
                  right: i < _breakingCards.length - 1 ? 12 : 0,
                ),
                decoration: BoxDecoration(
                  color: C.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 62,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (_, __, ___) =>
                                      Container(color: const Color(0xFF23234A)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 32,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Color(0x22000000),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 38,
                        child: Container(
                          color: C.white,
                          padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  color: C.textDark,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['desc']!,
                                style: const TextStyle(
                                  color: C.textGrey,
                                  fontSize: 10,
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(
                                          0xFF5050A0,
                                        ).withValues(alpha: 0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      item['tag']!,
                                      style: const TextStyle(
                                        color: Color(0xFF5050A0),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.circle,
                                    size: 3,
                                    color: C.textGrey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    item['time']!,
                                    style: const TextStyle(
                                      color: C.gold,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//  BREAKING VIDEO SECTION
class _BreakingVideoSection extends StatelessWidget {
  final Function(Map<String, String>) onTap;
  const _BreakingVideoSection({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: C.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(
              'Breaking Video 🔥',
              style: TextStyle(
                color: C.gold,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 155,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _videoCards.length,
              itemBuilder: (ctx, i) {
                final v = _videoCards[i];
                return GestureDetector(
                  onTap: () => onTap(Map<String, String>.from(v)),
                  child: Container(
                    width: 180,
                    margin: EdgeInsets.only(
                      right: i < _videoCards.length - 1 ? 12 : 0,
                    ),
                    decoration: BoxDecoration(
                      color: C.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.07),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14),
                          ),
                          child: SizedBox(
                            height: 88,
                            width: double.infinity,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  v['image']!,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) => Container(
                                        color: const Color(0xFF2D2D4E),
                                      ),
                                ),
                                Container(
                                  color: Colors.black.withValues(alpha: 0.18),
                                ),
                                Center(
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.88,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: C.bg,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 6,
                                  bottom: 6,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      v['duration']!,
                                      style: const TextStyle(
                                        color: C.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 7, 8, 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v['title']!,
                                style: const TextStyle(
                                  color: C.textDark,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                v['desc']!,
                                style: const TextStyle(
                                  color: C.textGrey,
                                  fontSize: 10,
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                v['source']!,
                                style: const TextStyle(
                                  color: C.textGrey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//  ARTICLE SECTION (For you / Recently read)
class _ArticleSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final Function(Map<String, String>) onTap;

  const _ArticleSection({
    required this.title,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: C.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 12, 12),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: C.gold,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        color: C.navBg,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: C.navBg, size: 18),
                  ],
                ),
              ],
            ),
          ),
          ...items.map((a) => _ArticleItem(data: a, onTap: onTap)),
        ],
      ),
    );
  }
}

//  ARTICLE ITEM ROW
class _ArticleItem extends StatelessWidget {
  final Map<String, String> data;
  final Function(Map<String, String>) onTap;
  const _ArticleItem({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(data),
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
              height: 100,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      data['image']!,
                      width: 100,
                      height: 100,
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
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.88),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Article',
                        style: TextStyle(
                          color: C.textDark,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
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
                      data['category']!,
                      style: const TextStyle(
                        color: Color(0xFF5050A0),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data['title']!,
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
                    data['desc']!,
                    style: const TextStyle(color: C.textGrey, fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
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
                        data['views']!,
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

//  SCALLOP NAV BAR
const double _kBarHeight = 72.0;
const double _kCircleR = 26.0;
const double _kNotchDepth = 42.0;

class _ScallopNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _ScallopNavBar({required this.currentIndex, required this.onTap});

  @override
  State<_ScallopNavBar> createState() => _ScallopNavBarState();
}

class _ScallopNavBarState extends State<_ScallopNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _xAnim;

  static const _icons = [
    Icons.home_rounded,
    Icons.newspaper,
    Icons.play_circle_outline,
    Icons.person_outline,
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _xAnim = Tween<double>(
      begin: widget.currentIndex.toDouble(),
      end: widget.currentIndex.toDouble(),
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
    _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(_ScallopNavBar old) {
    super.didUpdateWidget(old);
    if (widget.currentIndex != old.currentIndex) {
      _xAnim = Tween<double>(
        begin: old.currentIndex.toDouble(),
        end: widget.currentIndex.toDouble(),
      ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    final totalHeight = _kBarHeight + bottom;

    return SizedBox(
      height: totalHeight,
      child: AnimatedBuilder(
        animation: _xAnim,
        builder: (context, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final slotWidth = totalWidth / _icons.length;
              final notchCx = slotWidth * (_xAnim.value + 0.5);
              final circleBottom = bottom + _kBarHeight - _kCircleR - 2;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _ScallopPainter(
                        notchCenterX: notchCx,
                        notchRadius: _kCircleR + 10,
                        notchDepth: _kNotchDepth,
                        barColor: C.navBg,
                        bottomPadding: bottom,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: bottom,
                    height: _kBarHeight,
                    child: Row(
                      children: List.generate(_icons.length, (i) {
                        final isActive = i == widget.currentIndex;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => widget.onTap(i),
                            behavior: HitTestBehavior.opaque,
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: isActive ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  _icons[i],
                                  color: Colors.white.withValues(alpha: 0.55),
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Positioned(
                    left: notchCx - _kCircleR - 2,
                    bottom: circleBottom,
                    child: _FloatingCircle(
                      radius: _kCircleR,
                      icon: _icons[widget.currentIndex],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _FloatingCircle extends StatelessWidget {
  final double radius;
  final IconData icon;
  const _FloatingCircle({required this.radius, required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = radius * 2 + 4;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: C.navBg,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(icon, color: C.white, size: radius * 0.85),
    );
  }
}

class _ScallopPainter extends CustomPainter {
  final double notchCenterX;
  final double notchRadius;
  final double notchDepth;
  final Color barColor;
  final double bottomPadding;

  const _ScallopPainter({
    required this.notchCenterX,
    required this.notchRadius,
    required this.notchDepth,
    required this.barColor,
    required this.bottomPadding,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final halfWidth = notchRadius + 30;
    final leftX = notchCenterX - halfWidth;
    final rightX = notchCenterX + halfWidth;

    final barPath = Path();
    barPath.moveTo(0, 0);
    barPath.lineTo(leftX, 0);
    barPath.cubicTo(
      leftX + halfWidth * 0.5,
      0,
      notchCenterX - notchRadius * 0.6,
      notchDepth,
      notchCenterX,
      notchDepth,
    );
    barPath.cubicTo(
      notchCenterX + notchRadius * 0.6,
      notchDepth,
      rightX - halfWidth * 0.5,
      0,
      rightX,
      0,
    );
    barPath.lineTo(size.width, 0);
    barPath.lineTo(size.width, size.height);
    barPath.lineTo(0, size.height);
    barPath.close();

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawPath(barPath, Paint()..color = barColor);

    final hole = Path();
    hole.moveTo(leftX, 0);
    hole.cubicTo(
      leftX + halfWidth * 0.5,
      0,
      notchCenterX - notchRadius * 0.6,
      notchDepth,
      notchCenterX,
      notchDepth,
    );
    hole.cubicTo(
      notchCenterX + notchRadius * 0.6,
      notchDepth,
      rightX - halfWidth * 0.5,
      0,
      rightX,
      0,
    );
    hole.lineTo(rightX, -20);
    hole.lineTo(leftX, -20);
    hole.close();

    canvas.drawPath(
      hole,
      Paint()
        ..color = Colors.black
        ..blendMode = BlendMode.clear,
    );
    canvas.restore();
    canvas.drawShadow(barPath, Colors.black.withValues(alpha: 0.35), 12, false);
  }

  @override
  bool shouldRepaint(_ScallopPainter old) =>
      old.notchCenterX != notchCenterX ||
      old.notchDepth != notchDepth ||
      old.notchRadius != notchRadius;
}
