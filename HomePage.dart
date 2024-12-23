import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            BannerSection(),
            SizedBox(height: 28),
            RecommendedRecipes(),
            SizedBox(height: 20),
            PopularCombinations(),
          ],
        ),
      ),
    );
  }
}

class BannerData {
  final String imageUrl;
  final String? title;
  final String? description;
  final VoidCallback? onTap;

  const BannerData({
    required this.imageUrl,
    this.title,
    this.description,
    this.onTap,
  });
}

class BannerSection extends StatefulWidget {
  final List<BannerData> banners;
  
  const BannerSection({
    super.key,
    this.banners = const [
      BannerData(imageUrl: 'assets/images/banner1.png'),
      BannerData(imageUrl: 'assets/images/banner2.png'),
      BannerData(imageUrl: 'assets/images/banner3.png'),
    ],
  });

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late final ScrollController _scrollController;
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final itemWidth = viewportWidth * 0.9;
    const spacing = 20.0;
    const horizontalPadding = 20.0;
    
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(left: horizontalPadding),
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        itemCount: widget.banners.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: spacing),
        itemBuilder: (context, index) {
          if (index == widget.banners.length) {
            return const SizedBox(width: horizontalPadding);
          }
          return _BannerCard(
            banner: widget.banners[index],
            width: itemWidth,
          );
        },
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final BannerData banner;
  final double width;

  const _BannerCard({
    required this.banner,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: banner.onTap,
      child: Container(
        width: width,
        height: 100,
        decoration: ShapeDecoration(
          image: banner.imageUrl.isNotEmpty
              ? DecorationImage(
                  image: AssetImage(banner.imageUrl),
                  fit: BoxFit.cover,
                )
              : null,
          color: const Color(0xFFFF8822),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: banner.title != null || banner.description != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (banner.title != null)
                      Text(
                        banner.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (banner.description != null)
                      Text(
                        banner.description!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}

class RecommendedRecipes extends StatelessWidget {
  const RecommendedRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeSection(
      title: '사용자님에게 맞는 레시피에요!',
      recipes: [
        RecipeCard(
          imageUrl: "assets/images/padthai.png",
          tag: "#면",
          title: "라면팟타이",
          description: "너구리+닭가슴살 등",
          likes: 1309,
        ),
        RecipeCard(
          imageUrl: "assets/images/padthai.png",
          tag: "#면",
          title: "라면팟타이",
          description: "너구리+닭가슴살 등",
          likes: 1309,
        ),
      ],
    );
  }
}

class PopularCombinations extends StatelessWidget {
  const PopularCombinations({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeSection(
      title: '요즘 인기있는 편의점 꿀조합이에요!',
      recipes: [
        RecipeCard(
          imageUrl: "assets/images/buldak.png",
          tag: "인기",
          title: "불닭게티",
          description: "불닭볶음면+짜파게티",
          likes: 1309,
        ),
        RecipeCard(
          imageUrl: "assets/images/buldak.png",
          tag: "인기",
          title: "불닭게티",
          description: "불닭볶음면+짜파게티",
          likes: 1309,
        ),
      ],
    );
  }
}

class RecipeSection extends StatelessWidget {
  final String title;
  final List<RecipeCard> recipes;

  const RecipeSection({
    super.key,
    required this.title,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recipes.map((recipe) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: recipe,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String title;
  final String description;
  final int likes;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          height: 134,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFFF8822),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            tag,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF111111),
            fontSize: 20,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${likes.toString()}명이 좋아해요!',
          style: const TextStyle(
            color: Color(0xFF676767),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}