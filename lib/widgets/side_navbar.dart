import 'package:flutter/material.dart';
import 'package:perplexity_clone/Constants/theme/colors_theme.dart';
import 'package:perplexity_clone/widgets/side_navbar_button.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: AlignmentGeometry.center,
      duration: Duration(milliseconds: 200),
      color: AppColors.sideNav,
      width: isCollapsed ? 64 : 180,
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),

            child: Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 24),

          SideNavbarButton(
            icon: Icons.add,
            text: isCollapsed ? '' : 'New Chat',
          ),
          SideNavbarButton(
            icon: Icons.search,
            text: isCollapsed ? '' : 'search Chat',
          ),
          SideNavbarButton(
            icon: Icons.language,
            text: isCollapsed ? '' : 'web search',
          ),

          SideNavbarButton(
            icon: Icons.auto_awesome,
            text: isCollapsed ? '' : 'pro',
          ),
          SideNavbarButton(
            icon: Icons.cloud_outlined,
            text: isCollapsed ? '' : 'cloud',
          ),

          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 25,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
