import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'stepageclass.dart';

class MultiStepFormController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<Widget> pages = [
    const StepPage(
      stepNumber: 1,
      title: 'Step 1: Personal Information',
      content: 'Enter your name, email, and phone number.',
    ),
    const StepPage(
      stepNumber: 2,
      title: 'Step 2: Address Information',
      content: 'Enter your address details.',
    ),
    const StepPage(
      stepNumber: 3,
      title: 'Step 3: Confirm Details',
      content: 'Review and confirm your information.',
    ),
  ];

  void goToNextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value--;
    }
  }
}
