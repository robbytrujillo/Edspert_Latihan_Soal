import 'package:flutter/material.dart';

import 'package:git_intro/constants/r.dart';
import 'package:git_intro/helpers/user_email.dart';
import 'package:git_intro/models/kerjakan_soal_list.dart';
import 'package:git_intro/models/network_response.dart';
import 'package:git_intro/repository/latihan_soal_api.dart';
//import 'package:git_intro/view/main/latihan_soal/result_page.dart';

class KerjakanLatihanSoalPage extends StatefulWidget {
  const KerjakanLatihanSoalPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<KerjakanLatihanSoalPage> createState() =>
      _KerjakanLatihanSoalPageState();
}

class _KerjakanLatihanSoalPageState extends State<KerjakanLatihanSoalPage>
    with SingleTickerProviderStateMixin {
  KerjakanSoalList? soalList;
  getQuestionList() async {
    final result = await LatihanSoalApi().postQuestionList(widget.id);
    if (result?.status == Status.success) {
      soalList = KerjakanSoalList.fromJson(result!.data!);
      _controller = TabController(length: soalList!.data!.length, vsync: this);
      _controller!.addListener(() {
        setState(() {});
      });
      setState(() {});
    }
  }

  TabController? _controller;
  @override
  void iniState() {
    super.initState();
    getQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Soal"),
      ),
      //tombol selanjutnya atau submit
      bottomNavigationBar: _controller == null
          ? SizedBox(
              height: 0,
            )
          : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: R.colors.primary,
                          fixedSize: Size(153, 33),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        if (_controller!.index == soalList!.data!.length - 1) {
                          final result = await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return BottomsheetConfirmation();
                              });
                          print(result);
                          if (result == true) {
                            print("kirim ke backend");
                            List<String> answer = [];
                            List<String> questionId = [];

                            soalList!.data!.forEach((element) {
                              questionId.add(element.bankQuestionId!);
                              answer.add(element.studentAnswer!);
                            });

                            final payload = {
                              "user_email": UserEmail.getUserEmail(),
                              "exercise_id": widget.id,
                              "bank_question_id": questionId,
                              "student_answer": answer,
                            };
                            print(payload);

                            final result = await LatihanSoalApi()
                                .postStudentAnswer(payload);
                            if (result.status == Status.success) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return ResultPage(
                                  exerciseId: widget.id,
                                );
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar(
                                      content: Text(
                                          "Submit gagal. silahkan ulangi")));
                            }
                          }
                        } else {
                          _controller!.animateTo(_controller!.index + 1);
                        }
                      },
                      child: Text(_controller?.index == soalList!.data!.length - 1
                          ? "Kumpulin"
                          : "Selanjutnya",
                      style: TextStyle(fontSize: 12),
                      ),
                  ),
                ],
              ),
            ),
      body: soalList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                //TabBar no soal
                Container(
                  child: TabBar(
                      controller: _controller,
                      tabs: List.generate(
                          soalList!.data!.length, (index) => Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.black,),
                          ),),),),
                ),
                //TabBarView soal dan pilihan jawaban
               Expanded(
                 child: Container(
                      padding: EdgeInsets.all(8),
                    child: TabBarView(
                        controller: _controller,
                        children: List.generate(
                          soalList!.data!.length,
                          (index) => SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Soal no ${index + 1}",
                                  style: TextStyle(
                                    color: R.colors.greySubtitleHome,
                                    fontSize: 12,),
                  ),
                   if (soalList!.data![index].questionTitle != null)
                                  Html(
                                    data: soalList!.data![index].questionTitle!,
                                    style: {
                                      "body": Style(
                                        padding: EdgeInsets.zero,
                                      ),
                                      "p": Style(
                                        fontSize: FontSize(12),
                                      )
                                    },
                                  ),
                                if (soalList!.data![index].questionTitleImg !=
                                    null)
                                  Image.network(
                                      soalList!.data![index].questionTitleImg!),
                                _buildOption(
                                  "A",
                                  soalList!.data![index].optionA,
                                  soalList!.data![index].optionAImg,
                                  index,
                                ),
                                _buildOption(
                                  "B",
                                  soalList!.data![index].optionB,
                                  soalList!.data![index].optionBImg,
                                  index,
                                ),
                                _buildOption(
                                  "C",
                                  soalList!.data![index].optionC,
                                  soalList!.data![index].optionCImg,
                                  index,
                                ),
                                _buildOption(
                                  "D",
                                  soalList!.data![index].optionD,
                                  soalList!.data![index].optionDImg,
                                  index,
                                ),
                                _buildOption(
                                  "E",
                                  soalList!.data![index].optionE,
                                  soalList!.data![index].optionEImg,
                                  index,
                                ),
                              ],
                            ),
                          ),
                        ).toList()),
                  ),
               ))
              ],
            ),
    );
  }

  Widget BottomsheetConfirmation() {}

  Widget ResultPage({String exerciseId}) {}
}
