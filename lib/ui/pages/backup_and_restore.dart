import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/list_of_todo_model.dart';
import '../../providers/export_providers.dart';
import '../widgets/app_title.dart';
import '../widgets/custom_button.dart';
import 'backup_list.dart';

class BackupAndRestorePage extends ConsumerWidget {
  const BackupAndRestorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageProvider);
    void _showAlert(String msg) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '确定',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          ],
        ),
      );
    }

    Future<File?> _writeListOfTodoModel() async {
      ListOfTodoModel listOfTodoModel = ref.watch(todoListProvider);

      File? file = await storage.writeData(listOfTodoModel);
      if (file != null) {
        _showAlert('创建备用文件。');
        return file;
      } else {
        _showAlert('备用时发生错误。\n检查是否开启了缓存权限。');
        return null;
      }
    }

    void _readListOfTodoModelFromFilePicker() async {
      ListOfTodoModel? listOfTodoModel = await storage.readFromFilePicker();
      if (listOfTodoModel != null) {
        ref.read(todoListProvider.notifier)
          ..overrideData(listOfTodoModel)
          ..saveData();
        _showAlert('从文件中载入数据。');
      }
      if (listOfTodoModel == null) {
        _showAlert('数据不能载入。\n请选择一个有效的文件。');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          leadingTitle: '备份 &',
          trailingTitle: '存储',
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              '创建备份',
              onTap: _writeListOfTodoModel,
            ),
            CustomButton(
              '备份文件目录',
              onTap: () async {
                List<String> listOfFiles = await storage.getListOfBackups();
                listOfFiles = listOfFiles.reversed.toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BackupList(
                      listOfFiles: listOfFiles,
                    ),
                  ),
                );
              },
            ),
            CustomButton(
              '从存储载入备份文件',
              onTap: _readListOfTodoModelFromFilePicker,
            ),
          ],
        ),
      ),
    );
  }
}
