import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/app_title.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headline6 = Theme.of(context).textTheme.headline6;
    TextStyle? bodyText1 = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          leadingTitle: '问题 & 解答',
        ),
        actions: const [
          Icon(
            Icons.ac_unit,
            color: Colors.transparent,
          ),
          Icon(
            Icons.ac_unit,
            color: Colors.transparent,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '怎么添加一个 todo 清单？',
                style: headline6,
              ),
              Text(
                '在主页的输入框，点击即可弹出。输入完 todo 的内容就按 enter 即可。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么标记 todo 为完成？',
                style: headline6,
              ),
              Text(
                '点击 todo 左边圆圈部分，在已完成标签中可以看到。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎样永久删除 todo？',
                style: headline6,
              ),
              Text(
                '从左右方向滑动 todo 删除。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么标记 todo？',
                style: headline6,
              ),
              Text(
                '点击 todo 右边标记图案，在已标记下可以看到。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么标记 todo',
                style: headline6,
              ),
              Text(
                '点击 todo 标题即可修改。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么备份 todo',
                style: headline6,
              ),
              Text(
                '跳转到 \'备份 & 存储\' 页面然后点击 \'新建备份\' 按钮。你的备份将保存到 "/Android/data/$appName/files/" 文件夹。不要忘记给这个 app 存储文件的权限。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么存储备份？',
                style: headline6,
              ),
              Text(
                '跳转到 \'备份 & 存储\' 页面然后点击 \'备份文件目录\' 按钮。你可以导航到 \'备份目录\' 页面，你可以找到所有的确切时间的备份文件。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '如何分享备份文件？',
                style: headline6,
              ),
              Text(
                '跳转到 \'备份 & 存储\' 页面然后点击 \'备份文件目录\' 按钮。你可以导航到 \'备份目录\' 页面。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '怎么存储备份文件？',
                style: headline6,
              ),
              Text(
                '跳转到 \'备份 & 存储\' 页面然后点击 \'从存储载入备份文件\' 按钮。然后，选择一个有效的 json 文件。',
                style: bodyText1,
              ),
              const Divider(height: 16),
              Text(
                '在哪里找存储的备份文件？',
                style: headline6,
              ),
              Text(
                '在文件管理位置 "/Android/data/$appName/files/"。在这个文件夹你能找到所有的备份文件。',
                style: bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
