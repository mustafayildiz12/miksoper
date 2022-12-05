part of '../profile.dart';

class _UploadDocumentDialog extends StatelessWidget {
  const _UploadDocumentDialog();

  @override
  Widget build(BuildContext context) {
    FilePickerProvider filePickerProvider =
        Provider.of<FilePickerProvider>(context);
    final viewModel = PostViewModel();
    return SizedBox(
      height: 90.h,
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: const Text("Döküman Yükle"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear)),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "KAYDET",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          body: Padding(
            padding: PagePadding.allM(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              PageSizedBox.heightM(),
              MyPrimaryFormField(onChanged: (v) {}, label: "Belge İsmi"),
              PageSizedBox.heightM(),
              Observer(builder: (_) {
                return MyPrimaryButton(
                  title: viewModel.isLoading ? 'Yükleniyor' : 'BELGE YÜKLE',
                  onPressed: () async {
                    // await filePickerProvider.pickFile(context);

                    await viewModel.pickFile(context);
                    /*
                 
                  await OpenFile.open(
                      filePickerProvider.result!.files.first.path!);
                  */
                  },
                );
              }),
              SizedBox(
                height: 5.h,
              ),
            ]),
          )),
    );
  }
}
