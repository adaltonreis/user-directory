import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_directory/blocs/user/user_event.dart';
import 'package:user_directory/repositories/user_repository.dart';
import 'package:user_directory/routes/app_routes.dart';
import 'package:user_directory/widgets/custom_app_bar.dart';
import 'package:user_directory/widgets/custom_bottom_bar.dart';
import 'package:user_directory/widgets/drawer.dart';

import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_state.dart';
import '../../widgets/user/user_widget.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh(BuildContext context) async {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Refreshing...')),
      );
      context.read<UserBloc>().add(LoadUsers());
    }

    return BlocProvider(
      create: (_) => UserBloc(UserRepository())..add(LoadUsers()),
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: CustomAppBar(
            title: 'User Directory', onRefresh: () => onRefresh(context)),
        body: RefreshIndicator(
          onRefresh: () => onRefresh(context),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ...state.users
                        .map((user) => UserWidget(user: user, detailed: false))
                  ],
                );
              } else if (state is UserError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return CustomBottomBar(
              onLeftPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.directory),
              onCenterPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.scan),
              onRightPressed: () => Navigator.pushNamed(
                  context, AppRoutes.config,
                  arguments: state is UserLoaded ? state.users.first : null),
            );
          },
        ),
      ),
    );
  }
}
