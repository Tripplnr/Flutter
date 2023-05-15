import 'package:trippinr/core/app_export.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // final webviewController = Get.put(WebViewScreenController());
  var controllerr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controllerr = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {},
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.google.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('https://www.google.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
            leading: AppbarImage(
                height: getSize(20.00),
                width: getSize(20.00),
                svgPath: ImageConstant.imgArrowleft,
                color: ColorConstant.whiteA700,
                margin: getMargin(
                  left: 20,
                ),
                onTap: () {
                  Get.back(canPop: true);
                }),
            centerTitle: true,
            backgroundColor: ColorConstant.yellow900,
            title: Text(Get.arguments.toString(),
                style: AppTextStyle.txtPoppinsSemiBold16WhiteA700)),
        body: WebView(
          initialUrl: 'https://flutter.io',
        ),

        // WebViewWidget(
        //     controller: WebViewController()
        //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
        //       ..setBackgroundColor(const Color(0x00000000))
        //       ..setNavigationDelegate(
        //         NavigationDelegate(
        //           onProgress: (int progress) {
        //             // Update loading bar.
        //           },
        //           onPageStarted: (String url) {},
        //           onPageFinished: (String url) {},
        //           onWebResourceError: (WebResourceError error) {},
        //           onNavigationRequest: (NavigationRequest request) {
        //             if (request.url.startsWith('https://www.youtube.com/')) {
        //               return NavigationDecision.prevent;
        //             }
        //             return NavigationDecision.navigate;
        //           },
        //         ),
        //       )
        //       ..loadRequest(Uri.parse('https://flutter.dev'))),
      ),
    );
  }
}
