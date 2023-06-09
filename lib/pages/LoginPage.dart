import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: CustomScrollView(
      slivers: [
        SliverAppBar(
            // pinned: _pinned,
            // snap: _snap,
            // floating: _floating,
            expandedHeight: 200.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
      ],
    ));
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   // padding: EdgeInsetsDirectional.zero,
      //   backgroundColor: Colors.red,
      //   previousPageTitle: "Back",
      //   border: Border(bottom: BorderSide(color: Colors.transparent)),
      //   // middle: Text('Login Page'),
      //   // leading: CupertinoButton(
      //   //   padding: EdgeInsets.zero,
      //   //   onPressed: () {},
      //   //   child: Text("Edit"),
      //   // ),
      //   automaticallyImplyLeading: false,
      //   trailing: CupertinoButton(
      //     padding: EdgeInsets.zero,
      //     onPressed: () {},
      //     child: Icon(CupertinoIcons.add),
      //   ),
      // ),
      child: Stack(
        children: [
          SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 100, color: Colors.red,),
                CupertinoTextField(
                  controller: _textController,
                  placeholder: 'Email',
                ),
                // Container(height: 1000, color: CupertinoColors.activeGreen,),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: const CupertinoNavigationBar().preferredSize.height,
              // padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(CupertinoIcons.back), 
              )
            ),
          )
        ],
      ),
    );
  }
}