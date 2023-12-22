import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/firebase/firebase_doctor.dart';
import 'package:pregnancy_flutter/doctor/bloc/doctor_bloc.dart';
import 'package:pregnancy_flutter/doctor/bloc/doctor_event.dart';
import 'package:pregnancy_flutter/doctor/bloc/doctor_state.dart';
import 'package:pregnancy_flutter/doctor/child_widget/doctor_row.dart';
import 'package:pregnancy_flutter/doctor/doctor_model.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class Doctor extends BaseStatefulWidget {
  const Doctor({super.key});
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends BaseStatefulState<Doctor> {
  final ScrollController _controller = ScrollController();
  final double _endReachedThreshold = 30;
  bool _loading = false;
  DoctorBloc doctorBloc = DoctorBloc();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    doctorBloc.add(const LoadDoctor());
  }

  void _onScroll() {
    if (!_controller.hasClients || _loading) return;

    final shouldReload = _controller.position.extentAfter < _endReachedThreshold;
    bool isNotFull = doctorBloc.doctors.length >= FirebaseDoctor.instance.limit;
    if (shouldReload && !_loading && isNotFull) {
      _loading = true;
      doctorBloc.add(const LoadDoctor());
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
      title: 'Bác sỹ',
      leading: InkWell(
        onTap: () => Routes.instance.pop(),
        child: Align(
          alignment: Alignment.center,
          child: Assets.icons.arrowBack.svg(width: 24, height: 24),
        ),
      )
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
        create: (context) => doctorBloc,
        child: BlocListener<DoctorBloc, DoctorState> (
            listener: (context, state) {
              if (state is LoadingState) {
                loadingView.show(context);
                return;
              }

              if (state is LoadingSuccessfulState) {
                setState(() {
                  _loading = false;
                });
                loadingView.hide();
              }
            },
            child: CustomScrollView(
              controller: _controller,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: _refresh,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    DoctorModel doctor = doctorBloc.doctors[index];
                    return InkWell(
                      onTap: () {
                        // Routes.instance.navigateTo(RoutesName.doctorDetail, arguments: doctor);
                      },
                      child: DoctorRow(doctor: doctor),
                    );
                  },
                    childCount: doctorBloc.doctors.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: 30,
                      child: FirebaseDoctor.instance.limit > doctorBloc.doctors.length
                          ? Container()
                          : const CupertinoActivityIndicator(radius: 12.0, color: CupertinoColors.inactiveGray)
                  ),
                )
              ],
            )
        )
    );
  }

  Future<void> _refresh() async {
    FirebaseDoctor.instance.limit = 0;
    doctorBloc.add(const LoadDoctor());
  }
}