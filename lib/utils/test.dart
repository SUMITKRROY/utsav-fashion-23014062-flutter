    // on<MeasurementWomen>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_how_to_measure_women"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.MeasurementWomen = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });
    //
    // on<Measurementmen>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_how_to_measure_men"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.Measurementmen = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });
    //
    // on<SalwarKameezStitching>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_salwar_kameez_stitching_options"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.salwarstitch = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });
    //
    // on<LehengaStitching>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_lehenga_stitching_options"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.LehengaStitch = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });
    //
    // on<PetticoatStitching>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_petticoat_stitching_options"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.PetticoatStitch = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });
    //
    // on<BlouseStitchingSec>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filterGroups][0][filters][0][value]=mob_blouse_stitching_options_sec"
    //       "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filterGroups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.BlouseStitchingSec = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });