import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HappyTails FAQs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "frequently asked questions (FAQs) for the HappyTails app:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  final faqItem = _faqs[index];
                  return _buildFAQItem(faqItem, context);
                },
              ),
            ),
            Text(
              "Queries between pet owners:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _faqsPet.length,
                itemBuilder: (context, index) {
                  final faqItem = _faqsPet[index];
                  return _buildFAQItemsPet(faqItem, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faqItem, BuildContext context) {
    if (faqItem.subItems == null) {
      // Regular FAQ item with single question and answer
      return ExpansionTile(
        title: Text(faqItem.question, style: TextStyle(fontSize: 18.0)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(faqItem.answer),
          ),
        ],
      );
    } else {
      // FAQ item with sub-questions
      return ExpansionTile(
        title: Text(faqItem.question, style: TextStyle(fontSize: 18.0)),
        children: [
          ListView.builder(
            shrinkWrap: true, // Prevent list view from expanding
            itemCount: faqItem.subItems!.length,
            itemBuilder: (context, subIndex) {
              final subItem = faqItem.subItems![subIndex];
              return ListTile(
                title: Text(subItem.question),
                subtitle: Text(subItem.answer),
              );
            },
          ),
        ],
      );
    }
  }

  Widget _buildFAQItemsPet(FAQItem faqItemsPet, BuildContext context) {
    if (faqItemsPet.subItems == null) {
      // Regular FAQ item with single question and answer
      return ExpansionTile(
        title: Text(faqItemsPet.question, style: TextStyle(fontSize: 18.0)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(faqItemsPet.answer),
          ),
        ],
      );
    } else {
      // FAQ item with sub-questions
      return ExpansionTile(
        title: Text(faqItemsPet.question, style: TextStyle(fontSize: 18.0)),
        children: [
          ListView.builder(
            shrinkWrap: true, // Prevent list view from expanding
            itemCount: faqItemsPet.subItems!.length,
            itemBuilder: (context, subIndex) {
              final subItem = faqItemsPet.subItems![subIndex];
              return ListTile(
                title: Text(subItem.question),
                subtitle: Text(subItem.answer),
              );
            },
          ),
        ],
      );
    }
  }
}

final List<FAQItem> _faqs = [
  FAQItem(
      question: 'What is HappyTails?',
      answer:
          'HappyTails is a comprehensive pet care app that integrates veterinary scheduling, pet management, an online store, and a vibrant community platform.'),
  FAQItem(
      question: 'How can I schedule veterinary appointments using HappyTails?',
      answer:
          "With HappyTails, you can easily schedule veterinary appointments through the app's intuitive interface. Simply select your preferred date and time, choose your veterinarian, and confirm your appointment"),
  FAQItem(
      question: "How does HappyTails help me manage my pet's health records?",
      answer:
          "HappyTails allows users to create and manage detailed pet profiles including medical history, vaccination records, and customizable preferences, all in one convenient location."),
  FAQItem(
      question: "Is my personal information ",
      answer:
          "Yes, HappyTails prioritizes the security and privacy of user data. We use industry-standard encryption protocols and follow best practices to protect your personal information."),
  FAQItem(
      question: "Can I connect with other pet owners on HappyTails?",
      answer:
          "Absolutely! HappyTails fosters a vibrant community where pet owners can connect, share experiences, and seek advice from fellow pet enthusiasts."),
];

class FAQItem {
  final String question;
  final String answer;
  final List<SubItem>? subItems; // Optional list for sub-questions

  FAQItem({required this.question, required this.answer, this.subItems});
}

class SubItem {
  final String question;
  final String answer;

  SubItem({required this.question, required this.answer});
}

///

final List<FAQItem> _faqsPet = [
  FAQItem(
    question:
        "What type of food do you feed your pet, and do they have any dietary restrictions?",
    answer:
        "I feed my pet a combination of dry kibble and wet food, and they don't have any specific dietary restrictions. However, I've noticed they prefer food with real meat ingredients.",
  ),
  FAQItem(
    question:
        "Do you have any tips for managing grooming or training challenges with your pet?",
    answer:
        "For grooming, I've found that regular brushing and positive reinforcement during grooming sessions help keep my pet cooperative. As for training, consistency and patience have been key. I've also enrolled in obedience classes, which have been really help",
  ),
  FAQItem(
      question:
          "Can you recommend any local parks or trails that are pet-friendly?",
      answer:
          "There's a beautiful nature reserve nearby called Green Paws Park that's perfect for walks with pets. It has well-maintained trails and even a designated off-leash area."),
  FAQItem(
      question:
          "How do you handle emergencies or unexpected health issues with your pet?",
      answer:
          "I always keep a pet first aid kit handy with essentials like bandages, antiseptic wipes, and a pet-specific thermometer. It's also important to have the contact information for a reliable emergency vet clinic in case of urgent situations."),
  FAQItem(
      question:
          "Are there any local pet events or community gatherings that you recommend attending?",
      answer:
          "my pet a combination of dry kibble and wet food, and they don't have any specific dietary restrictions. However, I've noticed they prefer food with real meat ingredients."),
  FAQItem(
    question: "How does HappyTails handle feedback and feature requests ?",
    answer:
        "HappyTails values user feedback and actively incorporates it into ongoing improvements and updates. We have dedicated channels for collecting and prioritizing feature requests from our community",
  )
];

class FAQItemsPets {
  final String question;
  final String answer;
  final List<SubItem>? subItems; // Optional list for sub-questions

  FAQItemsPets({required this.question, required this.answer, this.subItems});
}
