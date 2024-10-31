// import 'package:flutter/material.dart';
// import 'package:webview_windows/webview_windows.dart';

// class RecipeView extends StatefulWidget {
//   final String url;

//   const RecipeView({super.key, required this.url});

//   @override
//   _RecipeViewState createState() => _RecipeViewState();
// }

// class _RecipeViewState extends State<RecipeView> {
//   final WebViewController _controller = WebViewController();

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     await _controller.initialize();
//     await _controller.loadUrl(widget.url);
//     if (!mounted) return;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recipe View'),
//       ),
//       body: FutureBuilder<bool>(
//         future: _controller.initialize(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done && snapshot.data == true) {
//             return WebViewWindows(
//               controller: _controller,
//               permissionRequested: _onPermissionRequested,
//             );
//              } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   Future<WebViewPermissionDecision> _onPermissionRequested(
//     String url,
//     WebViewPermissionKind permissionKind,
//     bool isUserInitiated,
//   ) async {
//     // You can make decisions based on the URL and permission kind
//     // For example, you can allow all permissions with:
//     return WebViewPermissionDecision.allow;
//   }
// }