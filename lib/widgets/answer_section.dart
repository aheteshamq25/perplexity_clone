import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:perplexity_clone/services/chat_web_services.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;

  String fullResponse = """
  As of today (Monday, 21 September 2026), the headline “Ind vs Australia” refers to youth and A-team cricket fixtures in India, not a senior men’s ODI/Test happening right now. [espn.co](https://www.espn.co.uk/cricket/series/24377/game/1535682/india-19s-vs-australia-19s-2nd-youth-odi-24377)

  ## Today’s match: India U‑19 vs Australia U‑19 (2nd Youth ODI)

  - **Match**: 2nd Youth ODI, Australia U‑19s tour of India
  - **Venue**: Niranjan Shah Stadium, Rajkot
  - **Time**: 09:30 AM IST (toss around 08:30 AM IST)
  - **Series status**: India U‑19s lead the 5‑match series **2–0** after winning the first Youth ODI. [espn.com](https://www.espn.com.sg/cricket/series/24377/game/1535682/india-under-19s-vs-australia-under-19s-2nd-youth-odi-24377)

  There is **no official TV telecast or live streaming** for this U‑19 match; updates are available via scorecards and ball‑by‑ball commentary on cricket sites and the BCCI website. [sportstar.thehindu](https://sportstar.thehindu.com/cricket/india-vs-australia-u19-2nd-youth-odi-live-streaming-telecast-where-to-watch/article71487751.ece)

  ## Other India–Australia games around this period

  - **India A Women vs Australia A Women**: India A Women won the **1st unofficial ODI** in Mohali by 4 wickets (chasing 236) on 20 Sept, taking a **1–0** lead in the ODI leg after Australia A Women had swept the preceding T20 leg 3–0. [espn.com](https://www.espn.com.au/cricket/series/24725/report/1552024/india-a-women-vs-australia-a-women-1st-unofficial-odi-24725)
  - **India A vs Australia A (men)**: A multi‑format series is scheduled in Puducherry starting 22 Sept (two 4‑day matches followed by three one‑dayers), with Devdutt Padikkal and Ruturaj Gaikwad named as captains for different formats. [espn](https://www.espn.com/cricket/series/24375/commentary/1535672/india-a-vs-australia-a-1st-unofficial-test-24375)

  If you tell me which format/team you care about (senior men, U‑19, A teams, women’s), I can narrow this to the exact score, squad, or where to follow live updates.

  """;

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Perplexity', style: TextStyle(fontSize: 19)),

        Skeletonizer(
          enabled: isLoading,
          child: Markdown(data: fullResponse.toString(), shrinkWrap: true),
        ),
      ],
    );
  }
}
