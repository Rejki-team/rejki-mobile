import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../widgets/widgets.dart';

/// Personal Info Page
///
/// Displays personal information with various sections including
/// education, address, work experience, schedule, phone, and badges.
class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // State for phone visibility toggle
  bool _isPhoneVisible = true;

  // State for schedule dropdown
  String _selectedSchedule = 'Fleksibel';

  @override
  Widget build(BuildContext context) {
    // Set status bar to match app bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF272777),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background, // #F8FAFC
      body: Column(
        children: [
          // App bar
          PersonalInfoAppBar(
            onBackPressed: () => Navigator.of(context).pop(),
            onEditPressed: () {
              // Navigate to Edit Personal Data page
              context.push('/profile/personal-info/edit');
            },
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  // Summary card (education & address)
                  const PersonalInfoSummaryCard(
                    education: 'Lulusan SMK Tata Boga',
                    address:
                        'Jl Damai Lubuk Buaya, Batipuh Panjang, Koto Tangah, Kota Padang, Sumatera Barat',
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Experience card
                  const PersonalInfoExperienceCard(
                    experiences: [
                      'Bekerja sebagai koki di Restoran Sederhana selama 5 tahun',
                      'Pengalaman di bidang catering untuk acara pernikahan',
                      'Pernah bekerja di hotel berbintang 4',
                    ],
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Schedule card
                  PersonalInfoScheduleCard(
                    scheduleOptions: const ['Fleksibel', 'Morning', 'Night'],
                    selectedSchedule: _selectedSchedule,
                    onScheduleChanged: (value) {
                      setState(() {
                        _selectedSchedule = value;
                      });
                    },
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Phone card
                  PersonalInfoPhoneCard(
                    phoneNumber: '+62 8555 2231 3434',
                    isVisible: _isPhoneVisible,
                    onVisibilityChanged: (value) {
                      setState(() {
                        _isPhoneVisible = value;
                      });
                    },
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Badge card
                  const PersonalInfoBadgeCard(
                    badges:
                        [], // Empty for now, can be populated with actual badge URLs
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Ad/Promo card
                  const AdCard(
                    title: 'Pelatihan Gratis + Sertifikasi Resmi',
                    description: 'Pelatihan digital marketing dan banyak lagi',
                    ctaText: 'Lihat pelatihan',
                  ),

                  // Bottom padding for safe area
                  SizedBox(
                    height:
                        MediaQuery.of(context).padding.bottom + AppSpacing.md,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
