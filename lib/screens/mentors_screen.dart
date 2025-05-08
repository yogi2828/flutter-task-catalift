import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/screens/CoursesScreen.dart';
import 'package:flutter_task_catalift/screens/HomeScreen.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:flutter_task_catalift/utils/dimens.dart';
import 'package:flutter_task_catalift/utils/text_styles.dart';
import 'package:flutter_task_catalift/widgets/search_bar.dart';
import '../models/mentor_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/mentor_card.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  int _selectedTabIndex = 1; 
  int _bottomNavIndex = 1; 
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Mentor> _allMentors = [
    Mentor(
      id: '1',
      name: 'Ayush Zagade',
      imageUrl: 'assets/images/ayush.jpg', 
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      role: 'Business Administration',
      reviews: 175,
      description:
          'Strategy Manager @ CEO Office | Ex-eBay & L&T | MDI Gurgaon. ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 98,
    ),
    Mentor(
      id: '2',
      name: 'Yogendra Karri',
      imageUrl: 'assets/images/yogi.jpg', 
      rating: 4.8,
      sector: 'Marketing',
      experience: '6 years',
      role: 'Digital Marketing Lead',
      reviews: 210,
      description:
          'Expert in SEO, SEM, and Social Media Strategy. Proven track record of boosting online presence and engagement for startups.',
      compatibility: 95,
    ),
    Mentor(
      id: '3',
      name: 'Anushka Singh',
      imageUrl: 'assets/images/anushka.jpg', 
      rating: 4.7,
      sector: 'Finance',
      experience: '8 years',
      role: 'Investment Banking',
      reviews: 150,
      description:
          'Specializes in M&A, financial modeling, and market analysis. Ex-Goldman Sachs. Passionate about guiding finance aspirants.',
      compatibility: 82,
    ),
     Mentor(
      id: '4',
      name: 'Sagar Charade',
      imageUrl: 'assets/images/ayush.jpg', 
      rating: 4.9,
      sector: 'Product Management',
      experience: '5 years',
      role: 'Senior Product Manager',
      reviews: 190,
      description:
          'Launched multiple successful B2C products. Strong in agile methodologies, user research, and roadmap planning. IIT Bombay Alum.',
      compatibility: 91,
    ),
  ];

  final List<Mentor> _myMentors = [
     Mentor(
      id: '1',
      name: 'Kareena Gupta',
      imageUrl: 'assets/images/anushka.jpg', 
      rating: 4.9,
      sector: 'IT Sector',
      experience: '4 years',
      role: 'Business Administration',
      reviews: 175,
      description:
          'Strategy Manager @ CEO Office | Ex-eBay & L&T | MDI Gurgaon. ESCP Europe | 32+ National Case Comps Podiums',
      compatibility: 98,
    ),
  ];


  List<Mentor> get _filteredMentors {
    final listToFilter = _selectedTabIndex == 0 ? _myMentors : _allMentors;
    if (_searchQuery.isEmpty) {
      return listToFilter;
    }
    return listToFilter
        .where((mentor) =>
            mentor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            mentor.sector.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            mentor.role.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            mentor.description.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (mounted) { 
        setState(() {
          _searchQuery = _searchController.text;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  void _onBottomNavTapped(int index) {
    if (mounted) {
      setState(() {
        _bottomNavIndex = index;
      });
    }
    String screenName = '';
    switch (index) {
      case 0:
        screenName = 'Home';
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 1:
        screenName = 'Explore Mentors';
        break;
      case 2:
        screenName = 'Courses';
        Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesScreen()));
        break;
    }
    if (mounted) { 
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigated to $screenName')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.paddingLarge,
                top: AppDimens.paddingLarge,
                bottom: AppDimens.paddingSmall),
            child: Text(
              'Mentors',
              style: AppTextStyles.headline1,
            ),
          ),
          _buildTabBar(),
          SearchBarWidget(
            controller: _searchController,
          ),
          Expanded(
            child: _filteredMentors.isEmpty
                ? Center(
                    child: Text(
                    _searchQuery.isNotEmpty ? 'No mentors found for "$_searchQuery".' : 'No mentors available in this section.',
                    style: AppTextStyles.bodyText,
                    textAlign: TextAlign.center,
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: AppDimens.paddingLarge, top: AppDimens.paddingSmall),
                    itemCount: _filteredMentors.length,
                    itemBuilder: (context, index) {
                      return MentorCard(mentor: _filteredMentors[index]);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingLarge, vertical: AppDimens.paddingSmall),
      child: Row(
        children: [
          Expanded(
            child: _buildTabItem('My Mentors', 0),
          ),
          const SizedBox(width: AppDimens.paddingMedium),
          Expanded(
            child: _buildTabItem('Explore', 1),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {
            _selectedTabIndex = index;
            _searchController.clear(); // Clear search on tab switch
            _searchQuery = '';
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.tabSelectedColor : AppColors.tabUnselectedColor,
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.buttonText.copyWith(
              color: isSelected ? AppColors.tabSelectedTextColor : AppColors.tabUnselectedTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}