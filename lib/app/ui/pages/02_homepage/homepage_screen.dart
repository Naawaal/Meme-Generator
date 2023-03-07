import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meme_generator/app/data/api/get_meme.dart';
import 'package:meme_generator/app/data/models/get_meme_model.dart';
import 'package:meme_generator/app/ui/theme/color_const.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final GetMemeApi getMemeApi = GetMemeApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorConst.splashScreenSecondColor,
            ColorConst.splashScreenFirstColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<GetMemeModel>>(
          future: getMemeApi.getMemeApi(),
          builder: (BuildContext context,
              AsyncSnapshot<List<GetMemeModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<GetMemeModel> memeList = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: memeList.length,
                itemBuilder: (BuildContext context, int index) {
                  final GetMemeModel meme = memeList[index];
                  return Card(
                    elevation: 2,
                    color: Colors.white,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => FullMemeScreen(meme: meme));
                      },
                      leading: Image.network(
                        meme.url,
                        fit: BoxFit.cover,
                      ),
                      title: Text(meme.name),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class FullMemeScreen extends StatelessWidget {
  final GetMemeModel meme;

  const FullMemeScreen({Key? key, required this.meme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meme.name),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(meme.url),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: ${meme.name}',
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
