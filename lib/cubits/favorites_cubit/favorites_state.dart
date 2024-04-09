part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class RemoveFromFaroitesState extends FavoritesState {}

final class AddToFaroitesState extends FavoritesState {}


