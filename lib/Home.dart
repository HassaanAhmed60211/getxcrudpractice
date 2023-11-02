import 'package:crudgetx_app/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController textController = TextEditingController();
  CrudController controllerCrud = Get.put(CrudController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: textController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ))),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    controllerCrud.addItem(textController.text);
                    print(controllerCrud.textData);
                    textController.clear();
                  },
                  child: const Text("Submit")),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CrudController>(
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.textData.length,
                    itemBuilder: (context, index) {
                      return controller.textData.isEmpty
                          ? const Center(
                              child: SizedBox(
                              height: 200,
                              child: Text("No Data"),
                            ))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.blue[800],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      controller.textData[index],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteItem(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 20,
                                        ))
                                  ],
                                ),
                              ),
                            );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
