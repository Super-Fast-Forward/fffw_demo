import 'package:fffw_demo/core/_core_exports.dart';
import 'package:flutter/services.dart';

//TODO isn't used so I am not sure how to categorize it.
void showEditProfileDialog(BuildContext context, WidgetRef ref) {
  Widget buildPhoto(BuildContext context, WidgetRef ref) => Center(
      child: FirebaseAuth.instance.currentUser?.photoURL == null
          ? const Icon(Icons.person)
          : CircleAvatar(
              radius: 50,
              backgroundImage:
                  Image.network(FirebaseAuth.instance.currentUser!.photoURL!)
                      .image));

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("User Profile"),
            content: SizedBox(
                height: 200.0, // Change as per your requirement
                width: 400.0, // Change as per your requirement
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: buildPhoto(context, ref)),
                      Text(
                          FirebaseAuth.instance.currentUser!.displayName ?? ''),
                      GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: FirebaseAuth.instance.currentUser!.uid));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('copied to clipboard'),
                            ));
                          },
                          child: Text(FirebaseAuth.instance.currentUser!.uid))
                      // ...ref
                      //     .watch(docSP(
                      //         'userInfo/${FirebaseAuth.instance.currentUser?.uid}'))
                      //     .when(
                      //         data: (userDoc) => [
                      //               Text(userDoc.data()!['email']),
                      //               FFLTTextEdit(userDoc, 'name', 'user name',
                      //                   'edit user name',
                      //                   key: Key(userDoc.id)),
                      //             ],
                      //         loading: () => [Loader()],
                      //         error: (e, s) => [ErrorWidget(e)])
                    ])),
            actions: <Widget>[
              ElevatedButton(
                  key: const Key('sign_out_btn'),
                  child: const Text("Sign Out"),
                  onPressed: () {
                    //Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    // Navigator.of(context).pushNamed(LoginPage.route);
                    Navigator.of(context).pop();
                    FirebaseAuth.instance.signOut();
                  }),
              ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]);
      });
}
