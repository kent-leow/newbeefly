import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/core/router.dart';

import 'user_listing_logic.dart';

class UserListingView extends StatelessWidget {
  final logic = Get.put(UserListingLogic());

  UserListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: logic.getData(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("LOADING");
        }
        return snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteConfig.userDetailView, id: 1);
                    },
                    child: Text(snapshot.data![index]['name']),
                  );
                },
                itemCount: snapshot.data!.length,
              )
            : const Text('nothing');
      },
    );
  }
}
