import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/firebase/firebase_vaccination.dart';
import 'package:pregnancy_flutter/doctor/child_widget/doctor_row.dart';
import 'package:pregnancy_flutter/routes/routes.dart';
import 'package:pregnancy_flutter/vaccination/bloc/vaccination_bloc.dart';
import 'package:pregnancy_flutter/vaccination/bloc/vaccination_event.dart';
import 'package:pregnancy_flutter/vaccination/bloc/vaccination_state.dart';
import 'package:pregnancy_flutter/vaccination/child_widget/vaccination_row.dart';
import 'package:pregnancy_flutter/vaccination/vaccination_model.dart';

class Vaccination extends BaseStatefulWidget {
  const Vaccination({super.key});
  @override
  State<Vaccination> createState() => _VaccinationState();
}

class _VaccinationState extends BaseStatefulState<Vaccination> {
  final ScrollController _controller = ScrollController();
  final double _endReachedThreshold = 30;
  bool _loading = false;
  VaccinationBloc vaccinationBloc = VaccinationBloc();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    vaccinationBloc.add(const LoadVaccination());
  }

  void _onScroll() {
    if (!_controller.hasClients || _loading) return;

    final shouldReload = _controller.position.extentAfter < _endReachedThreshold;
    bool isNotFull = vaccinationBloc.vaccinations.length >= FirebaseVaccination.instance.limit;
    if (shouldReload && !_loading && isNotFull) {
      _loading = true;
      vaccinationBloc.add(const LoadVaccination());
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
        title: 'Phòng tiêm chủng',
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
        create: (context) => vaccinationBloc,
        child: BlocListener<VaccinationBloc, VaccinationState> (
            listener: (context, state) {
              if (state is LoadingVaccinationState) {
                loadingView.show(context);
                return;
              }

              if (state is LoadingVaccinationSuccessfulState) {
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
                    VaccinationModel vaccination = vaccinationBloc.vaccinations[index];
                    return InkWell(
                      onTap: () {
                        // Routes.instance.navigateTo(RoutesName.doctorDetail, arguments: doctor);
                      },
                      child: VaccinationRow(vaccination: vaccination),
                    );
                  },
                    childCount: vaccinationBloc.vaccinations.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: 30,
                      child: FirebaseVaccination.instance.limit > vaccinationBloc.vaccinations.length
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
    FirebaseVaccination.instance.limit = 0;
    vaccinationBloc.add(const LoadVaccination());
  }
}