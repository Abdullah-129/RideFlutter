import 'dart:convert';

import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/config.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import '../../config.dart';

class RegisterUploadDocumentsView extends StatefulWidget {
  final Function() onUploaded;
  final GetDriver$Query$Driver driver;
  final Function(bool loading) onLoadingStateUpdated;

  const RegisterUploadDocumentsView(
      {Key? key,
      required this.driver,
      required this.onUploaded,
      required this.onLoadingStateUpdated})
      : super(key: key);

  @override
  State<RegisterUploadDocumentsView> createState() =>
      _RegisterUploadDocumentsViewState();
}

class _RegisterUploadDocumentsViewState
    extends State<RegisterUploadDocumentsView> {
  GetDriver$Query$Driver$Media? profilePicture;
  List<GetDriver$Query$Driver$Media> documents = [];

  @override
  void initState() {
    documents = widget.driver.documents;
    profilePicture = widget.driver.media;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).register_profile_photo_title,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  S.of(context).register_profile_photo_subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: UserAvatarView(
                        urlPrefix: serverUrl,
                        url: profilePicture?.address,
                        cornerRadius: 10,
                        size: 50,
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: CustomTheme.primaryColors.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.add,
                            color: CustomTheme.neutralColors.shade500,
                          ),
                        ))
                  ],
                ),
                CupertinoButton(
                    minSize: 0,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Text(S.of(context).action_add_photo),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);
                      if (result != null && result.files.single.path != null) {
                        final profilePic = await uploadFile(
                            result.files.single.path!, UploadMedia.profile);
                        setState(() {
                          profilePicture = profilePic;
                        });
                      }
                    }),
                const SizedBox(height: 12),
                Text(S.of(context).register_upload_documents_title,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  S.of(context).register_upload_documents_subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 16),
                Row(children: [
                  ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.image);

                        if (result != null &&
                            result.files.single.path != null) {
                          final file = await uploadFile(
                              result.files.single.path!, UploadMedia.document);
                          setState(() {
                            documents = documents.followedBy([file]).toList();
                          });
                        }
                      },
                      child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Ionicons.cloud_upload),
                              const SizedBox(height: 4),
                              Text(
                                S.of(context).action_upload_document,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: documents
                            .map(
                              (e) => Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    serverUrl + e.address,
                                    width: 105,
                                    height: 105,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
        Mutation(
            options: MutationOptions(
                document: SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT),
            builder: (RunMutation runMutation, QueryResult? result) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    widget.onLoadingStateUpdated(true);
                    final inp = SetDocumentsOnDriverArguments(
                        driverId: widget.driver.id,
                        relationIds: documents.map((e) => e.id).toList());
                    await runMutation(inp.toJson()).networkResult;
                    widget.onLoadingStateUpdated(false);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(demoMode
                                  ? S.of(context).title_important
                                  : S.of(context).title_success),
                              content: Text(demoMode
                                  ? S
                                      .of(context)
                                      .driver_registration_approved_demo_mode
                                  : S
                                      .of(context)
                                      .driver_register_profile_submitted_message),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    int count = 0;
                                    Navigator.popUntil(context, (route) {
                                      return count++ == 2;
                                    });
                                  },
                                  child: Text(S.of(context).action_ok),
                                )
                              ],
                            ));
                  },
                  child: Text(S.of(context).action_confirm_and_continue),
                ),
              );
            })
      ],
    );
  }

  Future<GetDriver$Query$Driver$Media> uploadFile(
      String path, UploadMedia media) async {
    var postUri = Uri.parse(
        "$serverUrl${media == UploadMedia.profile ? "upload_profile" : "upload_document"}");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        'Bearer ${Hive.box('user').get('jwt').toString()}';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    final streamedResponse = await request.send();
    widget.onUploaded();
    var response = await http.Response.fromStream(streamedResponse);
    var json = jsonDecode(response.body);
    return GetDriver$Query$Driver$Media.fromJson(json);
  }
}

enum UploadMedia { profile, document }
