import 'data_injection_container.dart';
import 'domain_injection_container.dart';

Future initDi() async {
  await initData();
  await initDomain();
}