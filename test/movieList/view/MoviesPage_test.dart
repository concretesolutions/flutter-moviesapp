import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moviesapp/moviesList/view/MovieCard.dart';
import 'package:moviesapp/moviesList/view/MoviesPage.dart';
import 'package:moviesapp/moviesList/viewModel/MoviesListViewModel.dart';
import 'package:moviesapp/network/APIResponse.dart' as response;
import 'package:moviesapp/view/ErrorPage.dart';
import 'package:provider/provider.dart';

import '../../stubs/MovieStubs.dart';
import '../../utils/utils.dart';

class MockMoviesListViewModel extends Mock implements MoviesListViewModel {}

void main() {
  ChangeNotifierProvider sut;
  MockMoviesListViewModel viewModel;

  setUp(() {
    viewModel = MockMoviesListViewModel();
    sut = ChangeNotifierProvider<MoviesListViewModel>(
        create: (context) => viewModel, child: MoviesPage());
  });

  group("MoviesPage -", () {
    testWidgets("Loading state", (WidgetTester tester) async {
      when(viewModel.responseController)
          .thenReturn(response.Response.loading("..."));

      await tester.pumpWidget(makeTestable(sut));
      final indicator = find.byType(CircularProgressIndicator);

      expect(indicator, findsOneWidget);
    });

    testWidgets("Error state", (WidgetTester tester) async {
      when(viewModel.responseController)
          .thenReturn(response.Response.error("..."));

      await tester.pumpWidget(makeTestable(sut));
      final errorPage = find.byType(ErrorPage);

      expect(errorPage, findsOneWidget);
    });

    testWidgets("List state", (WidgetTester tester) async {
      bool didCallFetchNewPage = false;
      when(viewModel.responseController)
          .thenReturn(response.Response.completed("..."));
      when(viewModel.moviesCount()).thenReturn(0);
      when(viewModel.itemsCount()).thenReturn(2);
      when(viewModel.shouldFetchNewPage()).thenAnswer((realInvocation) {
        didCallFetchNewPage = true;
        return false;
      });

      await tester.pumpWidget(makeTestable(sut));
      final gridView = find.byType(GridView);
      final loadings = find.byType(CircularProgressIndicator);

      expect(gridView, findsOneWidget);
      expect(loadings, findsNWidgets(2));
      expect(didCallFetchNewPage, true);
    });
  });
}