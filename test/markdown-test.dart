library markdownTest;

import 'package:unittest/unittest.dart';
import '../lib/markdown.dart';

void main() {
  parseMarkdown("""
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a fermentum urna.
  Pellentesque ligula quam, sollicitudin et turpis in, condimentum porta purus.
  Morbi sit amet faucibus mauris. Etiam sed venenatis arcu. Nunc ut risus ac neque auctor
  fringilla. Aliquam justo justo, consectetur eu pellentesque a, consectetur ut ligula. In quis dolor nisi. Donec
  laoreet urna nec placerat lobortis. Pellentesque dignissim facilisis augue, nec rutrum lacus semper nec. Ut vehicula
  dolor sit amet neque vehicula, non vestibulum odio ornare. Nam ut varius dolor. Sed augue nisl, accumsan sed lacus et,
  ultrices tempor tortor. Nullam sagittis dui a nulla tincidunt placerat. Morbi imperdiet sagittis leo, at dictum dolor
  mollis in. Etiam vehicula vel tellus sit amet pulvinar.

  Quisque convallis imperdiet magna, mattis feugiat massa sollicitudin id. Mauris elementum metus eu consectetur auctor.
  Morbi consectetur elit urna, vel feugiat tortor tempus vel. Donec sodales at sapien et tincidunt. Nam et pulvinar
  nisi. In id luctus mi. Quisque ac odio laoreet, pretium urna eget, sodales augue. Donec at felis placerat, eleifend
  dolor at, pellentesque nisi.

  Morbi nec fringilla neque. Sed porttitor faucibus libero eget scelerisque. Ut commodo laoreet ante ac ultricies.
  Maecenas gravida lacinia justo vitae venenatis. Nulla ac vehicula tortor. In congue mi pharetra consectetur aliquam.
  Proin vitae lectus at est congue euismod. Quisque ut risus neque. Proin in consequat urna.

  Nunc vel leo lacus. Vivamus vel malesuada lectus. Proin pharetra egestas leo. Ut nec eleifend nisi, non tempor nisl.
  Sed et dapibus purus. Etiam tristique tincidunt magna quis condimentum. Vivamus sodales odio eu dolor adipiscing
  condimentum. Donec ut augue placerat, bibendum risus ac, commodo quam. Sed pellentesque neque quis nisl placerat,
  aliquam pulvinar lorem dapibus. Pellentesque vel mauris a est egestas rutrum. Donec vitae velit luctus, porta orci
  vel, sagittis orci. Nam at nunc feugiat, eleifend massa a, vehicula metus. Aliquam sit amet scelerisque purus.

  Phasellus scelerisque felis lorem, vel venenatis quam sodales ut. Sed rhoncus rhoncus nisl, vel commodo tortor
  sodales ornare. Nulla scelerisque ipsum quis dapibus porttitor. Aenean luctus orci quis augue porttitor, id dignissim
  erat commodo. Nulla in commodo justo, sit amet ultrices justo. Sed ut molestie turpis. Pellentesque luctus turpis et
  eros varius vestibulum. Proin semper cursus sem, id feugiat nibh ornare id. Pellentesque habitant morbi tristique
  senectus et netus et malesuada fames ac turpis egestas. Aenean tempus adipiscing dignissim. Donec suscipit mauris
  vitae sapien laoreet, quis tempus lorem lacinia. Suspendisse nisl magna, convallis eu adipiscing sed, viverra
  consequat mauris. Etiam et convallis tortor. Quisque sit amet ante et massa pulvinar accumsan vitae ac arcu. Mauris
  venenatis lacinia mauris, non suscipit diam commodo adipiscing.
  """);
}
