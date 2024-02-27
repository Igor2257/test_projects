import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_projects/ui/components/rounded_button.dart';
import 'package:test_projects/ui/pages/result_list_screen.dart';
import 'package:test_projects/ux/bloc/app_bloc.dart';
import 'package:test_projects/ux/repository.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key, required this.userUrl});

  final String userUrl;

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  void initState() {
    BlocProvider.of<AppBloc>(context).add(AddNewUrl(url: widget.userUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      List<Map<String, dynamic>> result = state.result;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Process screen"),
          backgroundColor: Colors.blue.shade300,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.percentage == 100)
                const Text(
                  "All calculations has finished, you can send your results to server",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "${state.percentage}%",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: SizedBox(
                  width: size.width / 5,
                  height: size.width / 5,
                  child: CircularProgressIndicator(
                    value: state.percentage / 100,
                    color: Colors.blue.shade300,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: result.isNotEmpty
            ? SafeArea(
                minimum: const EdgeInsets.all(16),
                child: RoundedButton(
                    child: const Text("Send result to server"),
                    onPress: () async {
                      await Repository().sendResult(result).whenComplete(() {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ResultListScreen(
                                    results: result,
                                    currentData: state.currentData,
                                  )),
                          (route) => true,
                        );
                      });
                    }),
              )
            : null,
      );
    });
  }
}
