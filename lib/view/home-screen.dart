import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/model/movie-list-model.dart';
import 'package:mvvm_architecture/res/colors.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view-model/home-view-model.dart';
import 'package:mvvm_architecture/view-model/user-view-model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  void initState() {
    homeViewModel.fetchMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Welcome',
          style: TextStyle(color: Appcolors.whiteColor),
        ),
        actions: [
          InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(
                  child: Text(
                "logout",
                style: TextStyle(color: Appcolors.whiteColor),
              ))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            value.moviesList.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, error, stack) {
                              return Icon(Icons.error);
                            },
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(value
                              .moviesList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .moviesList.data!.movies![index].year
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.averageRating(value
                                      .moviesList.data!.movies![index].ratings!)
                                  .toStringAsFixed(1)),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      );
                    });
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
