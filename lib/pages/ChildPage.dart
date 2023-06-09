import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChildPage extends ConsumerStatefulWidget {
  const ChildPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChildPageState();
}

class _ChildPageState extends ConsumerState<ChildPage> {

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("child")
          ],
        ),
      ),
    );
  }
}