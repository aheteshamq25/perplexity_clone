import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/Constants/theme/colors_theme.dart';
import 'package:perplexity_clone/pages/chat_page.dart';
import 'package:perplexity_clone/services/chat_web_services.dart';
import 'package:perplexity_clone/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What is in your mind?',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 650,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1.5, color: AppColors.searchBarBorder),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGrey,
                      wordSpacing: 1.5,
                    ),
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Row(
                children: [
                  SearchBarButton(
                    icon: Icons.auto_awesome_outlined,
                    text: 'Focus',
                  ),
                  const SizedBox(width: 20),
                  SearchBarButton(
                    icon: Icons.add_circle_outline_outlined,
                    text: 'Attach',
                  ),
                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      ChatWebService().chat(queryController.text.trim());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatPage(question: queryController.text.trim()),
                        ),
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.submitButton,
                      ),
                      child: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 20,
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ],
    );
  }
}
