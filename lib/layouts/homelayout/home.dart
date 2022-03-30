import 'package:authfirebase/layouts/homelayout/cubit/cubit.dart';
import 'package:authfirebase/layouts/homelayout/cubit/states.dart';
import 'package:authfirebase/modules/AudioRecorder/AudioFeature.dart';
import 'package:authfirebase/shared/components/components.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News Feed',
              ),
            ),
            body: ConditionalBuilderRec(
              condition: SocialCubit.get(context).model != null,
              builder: (context) {
                var model = FirebaseAuth.instance.currentUser!.emailVerified;
                print(model);

                return Column(
                  children: [
                    if (!model)
                      Container(
                        color: Colors.red.withOpacity(.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: Text(
                                  'please verify your email',
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              defaultTextButton(
                                function: () {
                                  FirebaseAuth.instance.currentUser!
                                      .sendEmailVerification()
                                      .then((value) {
                                    showToast(
                                      message: 'check your mail',
                                      toastStates: ToastStates.SUCCESS,
                                    );
                                  }).catchError((error) {});
                                },
                                text: 'send',
                              ),
                            ],
                          ),
                        ),
                      ),
                    Expanded(child: Center(child: AudioFeature()))
                  ],
                );
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
