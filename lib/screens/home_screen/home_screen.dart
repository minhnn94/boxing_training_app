import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/enum/martial_art_enum.dart';
import 'package:boxing_traning/models/martial_art_model.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/shared_widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final martialArtData = [
    MartialArtModel(martialArtEnum: MartialArtEnum.boxing, id: '1'),
    MartialArtModel(martialArtEnum: MartialArtEnum.kickboxing, id: '2'),
    MartialArtModel(martialArtEnum: MartialArtEnum.mma, id: '3'),
    MartialArtModel(martialArtEnum: MartialArtEnum.karate, id: '4'),
    MartialArtModel(martialArtEnum: MartialArtEnum.jiujitsu, id: '5'),
    MartialArtModel(martialArtEnum: MartialArtEnum.createLesson, id: '6'),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Choice Your Skill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(AppLocalizationUtils.instance().helloWorld('John')),
            Text(AppLocalizationUtils.instance().nWombats(0)),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: martialArtData.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final martialArtModel = martialArtData[index];
                    return _MartialArtItem(
                      martialArtModel: martialArtModel,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _MartialArtItem extends StatelessWidget {
  const _MartialArtItem({
    super.key,
    required this.martialArtModel,
  });
  final MartialArtModel martialArtModel;
  String getNameDisplay(MartialArtEnum martialArtEnum) {
    if (martialArtEnum != MartialArtEnum.createLesson) {
      return martialArtEnum.name;
    } else {
      return '+ ${martialArtEnum.name}';
    }
  }

  void _handleOnPressItem(BuildContext context) {
    context.pushNamed(RouterPath.timingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleOnPressItem(context),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
        child: Text(
          getNameDisplay(martialArtModel.martialArtEnum),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
