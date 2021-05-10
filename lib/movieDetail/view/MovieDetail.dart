import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapp/movieDetail/viewModel/MovieDetailViewModel.dart';

class MovieDetail extends StatefulWidget {
  final MovieDetailViewModel _viewModel;

  MovieDetail(this._viewModel);

  @override
  _MovieDetailState createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget._viewModel.isFavorited;
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Movie Detail"),
      ),
      child: _body(),
    );
  }

  Widget _body() {
    // This is used in the platform side to register the view.
    final String viewType = '<platform-view-type>';

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return widget on Android.
        return PlatformViewLink(
          viewType: viewType,
          surfaceFactory:
              (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
                controller: controller,
                gestureRecognizers: const <
                    Factory<OneSequenceGestureRecognizer>>{},
                hitTestBehavior: PlatformViewHitTestBehavior.opaque);
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: widget._viewModel.movie.toJSONEncodable(),
              creationParamsCodec: JSONMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        );
      case TargetPlatform.iOS:
        return UiKitView(
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: widget._viewModel.movie.toJSONEncodable(),
            creationParamsCodec: const JSONMessageCodec()
        );

      default:
        throw UnsupportedError("Unsupported platform view");
    }
  }
}
