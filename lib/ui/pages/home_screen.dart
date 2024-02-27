import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projects/ui/components/rounded_button.dart';
import 'package:test_projects/ui/pages/process_screen.dart';
import 'package:test_projects/ux/bloc/app_bloc.dart';
import 'package:test_projects/ux/models/saved_url.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController apiController = TextEditingController(text: "");
  final FocusNode apiFocusNode = FocusNode();

  @override
  void initState() {
    BlocProvider.of<AppBloc>(context).add(LoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      List<SavedUrl> savedUrls = state.savedUrls;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home screen"),
          backgroundColor: Colors.blue.shade300,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Set valid API base URL in order to continue"),
              Row(
                children: [
                  const Icon(Icons.compare_arrows),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: apiController,
                    focusNode: apiFocusNode,
                    decoration: InputDecoration(
                        errorText: state.error.isEmpty ? null : state.error),
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              if (savedUrls.isNotEmpty) const Text("Your saved urls"),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: savedUrls.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => ProcessScreen(
                              userUrl: savedUrls[position].url,
                            ),
                          ),
                          (route) => true,
                        );
                      },
                      child: Container(
                          height: 44,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(savedUrls[position].url),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AppBloc>(context).add(
                                        DeleteUrl(id: savedUrls[position].id));
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          )),
                    );
                  }),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: RoundedButton(
              onPress: () async {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => ProcessScreen(
                      userUrl: apiController.text,
                    ),
                  ),
                  (route) => true,
                );
              },
              child: const Text("Start counting process")),
        ),
      );
    });
  }
}
