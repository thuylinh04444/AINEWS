import 'package:flutter/material.dart';
import '../theme/colors.dart';

// ── Top Bar ────────────────────────────────────
class TopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  const TopBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      color: C.bg,
      padding: EdgeInsets.fromLTRB(16, top + 8, 16, 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.maybePop(context),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: C.white,
                shape: BoxShape.circle,
                border: Border.all(color: C.border),
              ),
              child: const Icon(Icons.arrow_back, size: 18, color: C.textDark),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: C.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(width: 38),
        ],
      ),
    );
  }
}

// ── Search Bar ─────────────────────────────────
class AppSearchBar extends StatelessWidget {
  final String hint;
  final String? value;
  final VoidCallback? onFilterTap;
  const AppSearchBar({
    super.key,
    this.hint = 'Find breaking news',
    this.value,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: C.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: C.border),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const Icon(Icons.search, color: C.textGrey, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    value ?? hint,
                    style: TextStyle(
                      color: value != null ? C.textDark : C.textGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: C.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: C.border),
              ),
              child: const Icon(Icons.tune, color: C.textDark, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Category Chips ─────────────────────────────
class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _selected = 0;
  final _cats = const [
    (Icons.grid_view_rounded, 'All'),
    (Icons.school_outlined, 'Education'),
    (Icons.computer_outlined, 'Technology'),
    (Icons.trending_up_outlined, 'Economy'),
    (Icons.spa_outlined, 'Lifestyle'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _cats.length,
        itemBuilder: (ctx, i) {
          final isActive = i == _selected;
          return GestureDetector(
            onTap: () => setState(() => _selected = i),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? C.purple : C.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isActive ? C.purple : C.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (i > 0) ...[
                    Icon(
                      _cats[i].$1,
                      size: 13,
                      color: isActive ? C.white : C.textGrey,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    _cats[i].$2,
                    style: TextStyle(
                      color: isActive ? C.white : C.textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
