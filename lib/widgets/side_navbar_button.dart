import 'package:flutter/material.dart';
import 'package:perplexity_clone/Constants/theme/colors_theme.dart';

class SideNavbarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SideNavbarButton({super.key, required this.icon, required this.text});

  @override
  State<SideNavbarButton> createState() => _SideNavbarButtonState();
}

class _SideNavbarButtonState extends State<SideNavbarButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isHovered ? AppColors.proButton : Colors.transparent,
            ),
            child: Row(
              children: [
                Icon(widget.icon, color: AppColors.iconGrey, size: 25),

                const SizedBox(width: 2),
                Text(
                  widget.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
