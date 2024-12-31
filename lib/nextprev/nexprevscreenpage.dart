import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictokgame/nextprev/pagenavnextpreController.dart';

class MultiStepForm extends StatelessWidget {
  const MultiStepForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MultiStepFormController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Step Form'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable swipe gestures
              itemCount: controller.pages.length,
              itemBuilder: (context, index) => controller.pages[index],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentPage.value > 0)
                      ElevatedButton(
                        onPressed: controller.goToPreviousPage,
                        child: const Text('Previous'),
                      ),
                    if (controller.currentPage.value <
                        controller.pages.length - 1)
                      ElevatedButton(
                        onPressed: controller.goToNextPage,
                        child: const Text('Next'),
                      ),
                    if (controller.currentPage.value ==
                        controller.pages.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          // Final submission or navigation
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Form Submitted'),
                              content: const Text(
                                  'Thank you for completing the form!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Submit'),
                      ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
