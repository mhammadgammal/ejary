import 'dart:io' show File;

import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ContractViewer extends StatelessWidget {
  const ContractViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttachFileCubit, AttachFileState>(
      builder: (context, state) {
        var cubit = AttachFileCubit.get(context);
        return cubit.showContract
            ? cubit.filePath.isEmpty
                ? const Center(child: Text('لا يوجد عقد مرفوع حاليا'))
                : cubit.filePath.split('.').last == 'pdf'
                ? SfPdfViewer.file(
                  File(cubit.filePath),
                  canShowPageLoadingIndicator: false,
                )
                : Image.file(File(cubit.filePath), fit: BoxFit.cover)
            : SizedBox();
      },
    );
  }
}
