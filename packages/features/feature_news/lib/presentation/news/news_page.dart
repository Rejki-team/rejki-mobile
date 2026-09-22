import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/news_cubit.dart';
import 'cubit/news_state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<NewsCubit>()..loadNews(),
      child: const _NewsView(),
    );
  }
}

class _NewsView extends StatelessWidget {
  const _NewsView();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            const _FilterTabs(),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const AppCustomShimmerList(
                      style: ShimmerCardStyle.leftImage,
                    );
                  }
                  if (state.errorMessage != null) {
                    return AppErrorState(
                      description: state.errorMessage!,
                      onRetry: () => context.read<NewsCubit>().loadNews(),
                    );
                  }
                  return _NewsList(selectedFilter: state.selectedFilter);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'News',
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}

class _FilterTabs extends StatelessWidget {
  const _FilterTabs();

  final List<String> filters = const ['Semuanya', 'Informasi', 'Tips & Trck'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      buildWhen: (previous, current) =>
          previous.selectedFilter != current.selectedFilter,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final isSelected = state.selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: InkWell(
                    onTap: () => context.read<NewsCubit>().setFilter(filter),
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.textBlack
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        filter,
                        style: AppTypography.labelMedium.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _NewsList extends StatelessWidget {
  final String selectedFilter;

  const _NewsList({required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    // Hardware items to replicate UI (could be filtered based on 'selectedFilter' later)
    final items = _mockNews;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      itemCount: items.length,
      separatorBuilder: (context, index) =>
          const Divider(color: AppColors.divider, height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        return NewsCard(
          imageUrl: item['imageUrl']!,
          category: item['category']!,
          title: item['title']!,
          timeText: item['timeText']!,
          onTap: () {},
        );
      },
    );
  }
}

// Mockup Data
const List<Map<String, String>> _mockNews = [
  {
    'imageUrl':
        '', // Fallback handling in NewsCard will render grey placeholder
    'category': 'Informasi',
    'title':
        'PT REJEKI Resmi Rilis Update Aplikasi YouBroke Versi 2.0, Kini Lebih Cepat dan Interaktif',
    'timeText': 'Just Now  •  Just Now',
  },
  {
    'imageUrl': '',
    'category': 'Informasi',
    'title': '5 Tips Membuat CV Sederhana tapi Menarik untuk Pekerja Pabrik',
    'timeText': 'Just Now  •  Just Now',
  },
  {
    'imageUrl': '',
    'category': 'Informasi',
    'title': 'Kesalahan Umum Saat Melamar Kerja, Hati-Hati!',
    'timeText': 'Just Now  •  Just Now',
  },
  {
    'imageUrl': '',
    'category': 'Informasi',
    'title':
        'PT REJEKI Resmi Rilis Update Aplikasi YouBroke Versi 2.0, Kini Lebih Cepat dan Interaktif',
    'timeText': 'Just Now  •  Just Now',
  },
  {
    'imageUrl': '',
    'category': 'Informasi',
    'title': 'Cara Menjaga Kesehatan Tubuh Walau Lembur Terus-menerus',
    'timeText': 'Just Now  •  Just Now',
  },
];
