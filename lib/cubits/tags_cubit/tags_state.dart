part of 'tags_cubit.dart';

sealed class TagsState {}

final class TagsInitial extends TagsState {}
final class TagSelected extends TagsState {}
final class TagUnselected extends TagsState {}