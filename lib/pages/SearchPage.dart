import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("search")
          ],
        ),
      ),
    );
  }
}