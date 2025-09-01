import 'package:get/get.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/register/bindings/auth_register_binding.dart';
import '../modules/auth/register/views/auth_register_view.dart';
import '../modules/buku/buku_create/bindings/buku_buku_create_binding.dart';
import '../modules/buku/buku_create/views/buku_buku_create_view.dart';
import '../modules/buku/buku_detail/bindings/buku_buku_detail_binding.dart';
import '../modules/buku/buku_detail/views/buku_buku_detail_view.dart';
import '../modules/buku/buku_edit/bindings/buku_buku_edit_binding.dart';
import '../modules/buku/buku_edit/views/buku_buku_edit_view.dart';
import '../modules/buku/buku_kategori_create/bindings/buku_buku_kategori_create_binding.dart';
import '../modules/buku/buku_kategori_create/views/buku_buku_kategori_create_view.dart';
import '../modules/buku/buku_kategori_edit/bindings/buku_buku_kategori_edit_binding.dart';
import '../modules/buku/buku_kategori_edit/views/buku_buku_kategori_edit_view.dart';
import '../modules/buku/buku_kategori_list/bindings/buku_buku_kategori_list_binding.dart';
import '../modules/buku/buku_kategori_list/views/buku_buku_kategori_list_view.dart';
import '../modules/buku/buku_lihat_pdf/bindings/buku_buku_lihat_pdf_binding.dart';
import '../modules/buku/buku_lihat_pdf/views/buku_buku_lihat_pdf_view.dart';
import '../modules/buku/buku_list/bindings/buku_buku_list_binding.dart';
import '../modules/buku/buku_list/views/buku_buku_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kuis/kuis_attempt/bindings/kuis_kuis_attempt_binding.dart';
import '../modules/kuis/kuis_attempt/views/kuis_kuis_attempt_view.dart';
import '../modules/kuis/kuis_create/bindings/kuis_kuis_create_binding.dart';
import '../modules/kuis/kuis_create/views/kuis_kuis_create_view.dart';
import '../modules/kuis/kuis_edit/bindings/kuis_kuis_edit_binding.dart';
import '../modules/kuis/kuis_edit/views/kuis_kuis_edit_view.dart';
import '../modules/kuis/kuis_list/bindings/kuis_kuis_list_binding.dart';
import '../modules/kuis/kuis_list/views/kuis_kuis_list_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/peminjaman/peminjaman_create/bindings/peminjaman_peminjaman_create_binding.dart';
import '../modules/peminjaman/peminjaman_create/views/peminjaman_peminjaman_create_view.dart';
import '../modules/peminjaman/peminjaman_detail/bindings/peminjaman_peminjaman_detail_binding.dart';
import '../modules/peminjaman/peminjaman_detail/views/peminjaman_peminjaman_detail_view.dart';
import '../modules/peminjaman/peminjaman_list/bindings/peminjaman_peminjaman_list_binding.dart';
import '../modules/peminjaman/peminjaman_list/views/peminjaman_peminjaman_list_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN,
      page: () => const AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_REGISTER,
      page: () => const AuthRegisterView(),
      binding: AuthRegisterBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_LIST,
      page: () => const BukuBukuListView(),
      binding: BukuBukuListBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_DETAIL,
      page: () => const BukuBukuDetailView(),
      binding: BukuBukuDetailBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_KATEGORI_LIST,
      page: () => const BukuBukuKategoriListView(),
      binding: BukuBukuKategoriListBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN_PEMINJAMAN_DETAIL,
      page: () => const PeminjamanPeminjamanDetailView(),
      binding: PeminjamanPeminjamanDetailBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN_PEMINJAMAN_LIST,
      page: () => const PeminjamanPeminjamanListView(),
      binding: PeminjamanPeminjamanListBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_CREATE,
      page: () => const BukuBukuCreateView(),
      binding: BukuBukuCreateBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_EDIT,
      page: () => const BukuBukuEditView(),
      binding: BukuBukuEditBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_KATEGORI_CREATE,
      page: () => const BukuBukuKategoriCreateView(),
      binding: BukuBukuKategoriCreateBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_KATEGORI_EDIT,
      page: () => const BukuBukuKategoriEditView(),
      binding: BukuBukuKategoriEditBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN_PEMINJAMAN_CREATE,
      page: () => const PeminjamanPeminjamanCreateView(),
      binding: PeminjamanPeminjamanCreateBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_KUIS_CREATE,
      page: () => const KuisKuisCreateView(),
      binding: KuisKuisCreateBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_KUIS_LIST,
      page: () => const KuisKuisListView(),
      binding: KuisKuisListBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_KUIS_EDIT,
      page: () => const KuisKuisEditView(),
      binding: KuisKuisEditBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_KUIS_ATTEMPT,
      page: () => const KuisKuisAttemptView(),
      binding: KuisKuisAttemptBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.BUKU_BUKU_LIHAT_PDF,
      page: () => const BukuBukuLihatPdfView(),
      binding: BukuBukuLihatPdfBinding(),
    ),
  ];
}
