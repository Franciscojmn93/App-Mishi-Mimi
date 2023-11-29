import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    '6dk5ojb7': {
      'es': 'Ingresar',
      'en': 'Log in',
    },
    'ry32psp6': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    '5e3kfvki': {
      'es': 'Ingresa un email',
      'en': 'Enter an email',
    },
    'okejy5lg': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '1zeq44ve': {
      'es': 'Ingresa una contraseña',
      'en': 'Enter a password',
    },
    '6lh8my5j': {
      'es': 'Entrar',
      'en': 'Log in',
    },
    'kwl9rq9b': {
      'es': 'Nueva Cuenta',
      'en': 'New account',
    },
    'dhhdd4lr': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'f3u6a5un': {
      'es': 'Ingresa un correo',
      'en': 'Enter an email',
    },
    'lmvqo8mw': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'n0a3kzpu': {
      'es': 'Ingresa una contraseña',
      'en': 'Enter a password',
    },
    'rhwtro84': {
      'es': 'Crea una cuenta',
      'en': 'Create an account',
    },
    'x5u5hty4': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'ms02ygn1': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
    'wusdksen': {
      'es': 'Este campo es requrido',
      'en': 'This field is required',
    },
    'yx00fizf': {
      'es': 'La contraseña debe tener minimo 6 números',
      'en': 'The password must have a minimum of 6 numbers',
    },
    '7w3rpdaf': {
      'es': 'La contraseña debe tener maximo 12 números',
      'en': 'The password must have a maximum of 12 numbers',
    },
    'pdqiph0k': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
    '9ag9gk5y': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'og5cgfbr': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
    't3tjl2ka': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // menu
  {
    'bt628trt': {
      'es': '¿Qué vas a ordenar hoy?',
      'en': 'What are you going to order today?',
    },
    'ze0e9616': {
      'es': 'Bebidas',
      'en': 'Drinks',
    },
    'fny0ce3t': {
      'es': 'Koreana',
      'en': 'Korean',
    },
    '6p26vkb9': {
      'es': 'Japonesa',
      'en': 'Japanese',
    },
    'd7d6x9xl': {
      'es': 'Promociones para ti',
      'en': 'Promotions for you',
    },
    'ngot4w22': {
      'es': 'Ordenar en Uber Eats',
      'en': 'Order on Uber Eats',
    },
    'hegl1lpr': {
      'es': 'Mishi Mimi',
      'en': 'Mishi Mimi',
    },
    'yfsspe3k': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // editarPerfil
  {
    'xa5jmb2j': {
      'es': 'Cambiar foto',
      'en': 'Change photo',
    },
    'yiv0he53': {
      'es': 'Tu nombre',
      'en': 'Your name',
    },
    'qze3orn9': {
      'es': 'Tu nombre',
      'en': 'Your name',
    },
    '9gdf67bu': {
      'es': 'Tu dirección',
      'en': 'Your address',
    },
    'tl1e35eo': {
      'es': 'Tu dirección',
      'en': 'Your address',
    },
    'qzotdjhi': {
      'es': 'Tu email',
      'en': 'Your email',
    },
    'lj5e587x': {
      'es': 'Tu dirección',
      'en': 'Your address',
    },
    'ivg0xe9s': {
      'es': 'Tu número de teléfono',
      'en': 'Your phone number',
    },
    'bc2w4bic': {
      'es': 'Tu dirección',
      'en': 'Your address',
    },
    'i9q7b9uv': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    '8782pyxl': {
      'es': 'Atrás',
      'en': 'Back',
    },
    'r96alemr': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
  },
  // perfil
  {
    '4adxgme7': {
      'es': 'Cambiar a modo oscuro o claro',
      'en': 'Switch to dark or light mode',
    },
    'www7h1cg': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    'lfvy7isy': {
      'es': 'Cerrar sesión',
      'en': 'Sign off',
    },
  },
  // cart
  {
    'tzvzax08': {
      'es': 'Productos en esta orden: ',
      'en': 'Products in this order:',
    },
    'c3wqdmit': {
      'es': 'Resumen del pedido',
      'en': 'Order summary',
    },
    '8gmwxj9t': {
      'es': 'Subtotal',
      'en': 'Subtotal',
    },
    'jvuvxeuc': {
      'es': 'IVA',
      'en': 'IVA',
    },
    'shl64xqa': {
      'es': 'Total',
      'en': 'Total',
    },
    'za0fqjy5': {
      'es': 'Confirmar orden',
      'en': 'Confirm order',
    },
    'hl1hefo7': {
      'es': 'Atrás',
      'en': 'Back',
    },
    'stcguz9z': {
      'es': 'Detalles de la orden',
      'en': 'Order details',
    },
  },
  // itemDetail
  {
    'ukmpa464': {
      'es': 'Descripción',
      'en': 'Description',
    },
    'zy2dquvh': {
      'es': 'Sub total',
      'en': 'Subtotal',
    },
    'orduib25': {
      'es': 'Atrás',
      'en': 'Back',
    },
  },
  // AdminUsers
  {
    '66g4dbtd': {
      'es': 'Aministrador',
      'en': 'Administrator',
    },
    'avz2rgxs': {
      'es': 'Administrar Usuarios',
      'en': 'Manage Users',
    },
    'y2vhzpk1': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // AdminArea
  {
    '8x5qjylt': {
      'es': 'Área de administración',
      'en': 'Admin area',
    },
    'kix2zgno': {
      'es': 'Cerrar sesión',
      'en': 'Sign off',
    },
    'y9s09svu': {
      'es': 'Opciones administrativas',
      'en': 'Administrative options',
    },
    'a42cm5g8': {
      'es': 'Administrar usuarios',
      'en': 'Manage users',
    },
    'pvcri5hl': {
      'es': 'Administrar productos',
      'en': 'Manage products',
    },
    's084jrli': {
      'es': 'Administrar ordenes',
      'en': 'Manage orders',
    },
  },
  // editUser
  {
    'lsyksuf9': {
      'es': 'El nombre',
      'en': 'Name',
    },
    'ejn695c0': {
      'es': 'Hacer administrador',
      'en': 'Make admin',
    },
    '29juqcgh': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'qn5lycmi': {
      'es': 'Atrás',
      'en': 'Back',
    },
    '2fwl9e5w': {
      'es': 'Editar Usuario',
      'en': 'Edit User',
    },
  },
  // AdminProducts
  {
    '7p08fzrr': {
      'es': 'Administrar Productos',
      'en': 'Manage Products',
    },
    '1g4vbcfl': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // menuNoRegisterUsers
  {
    'mvrcz9ig': {
      'es': 'Mishi Mimi',
      'en': 'Mishi Mimi',
    },
    'r5zxbkub': {
      'es': 'Regístrate',
      'en': 'Sign up',
    },
    'w6dti4rf': {
      'es': '¿Qué vas a ordenar hoy?',
      'en': 'What are you going to order today?',
    },
    'skecpiyp': {
      'es': 'Ordenar en Uber Eats',
      'en': 'Order on Uber Eats',
    },
    '50glrmpt': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // editProduct
  {
    'ra0m4lu8': {
      'es': 'Nombre del producto',
      'en': 'Name of product',
    },
    'wln3hph3': {
      'es': 'Descripcion del producto',
      'en': 'Product description',
    },
    'nvwhwkuw': {
      'es': 'Precio del producto',
      'en': 'Product price',
    },
    'nz50vtus': {
      'es': 'En venta',
      'en': 'On sale',
    },
    'lghke4tj': {
      'es': 'Incluir como promoción',
      'en': 'Include as promotion',
    },
    '7b7w9hqu': {
      'es': 'Es bebida',
      'en': 'It is a Drink',
    },
    '0kjhwfpx': {
      'es': 'Es comida Japonesa',
      'en': 'It is Japanese food',
    },
    '3slgrojo': {
      'es': 'Es comida Koreana',
      'en': 'It is Korean food',
    },
    'mfytdd4s': {
      'es': 'Cambiar imagen',
      'en': 'Change image',
    },
    'w0tawrix': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'cfylmuaq': {
      'es': 'Atrás',
      'en': 'Back',
    },
    'dmgm8nma': {
      'es': 'Editar producto',
      'en': 'Edit product',
    },
  },
  // catDrink
  {
    'zeel97s2': {
      'es': '¿Qué bebida vas a ordenar hoy?',
      'en': 'What drink are you ordering today?',
    },
    'rp1bjnio': {
      'es': 'Ordenar en Uber Eats',
      'en': 'Order on Uber Eats',
    },
    'uzwj0ym1': {
      'es': 'Mishi Mimi',
      'en': 'Mishi Mimi',
    },
    'gaqx0irq': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // catJap
  {
    'zcuk61ju': {
      'es': '¿Qué comida japonesa vas a ordenar hoy?',
      'en': 'What Japanese food are you ordering today?',
    },
    'usr205oz': {
      'es': 'Ordenar en Uber Eats',
      'en': 'Order on Uber Eats',
    },
    'erltyrzo': {
      'es': 'Mishi Mimi',
      'en': 'Mishi Mimi',
    },
    '7e9wys0f': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // catKor
  {
    'p5nfjnw3': {
      'es': '¿Qué comida koreana vas a ordenar hoy?',
      'en': 'What Korean food are you ordering today?',
    },
    '5vemsgvc': {
      'es': 'Ordenar en Uber Eats',
      'en': 'Order on Uber Eats',
    },
    '1358mll9': {
      'es': 'Mishi Mimi',
      'en': 'Mishi Mimi',
    },
    'a0hy5ntp': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // adminOrders
  {
    'ouprt0gr': {
      'es': 'Administrar ordenes',
      'en': 'Manage Orders',
    },
    '71k74x0w': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // editOrder
  {
    'no7o9cw8': {
      'es': 'Creador de la orden:',
      'en': 'Order creator:',
    },
    'z54guby7': {
      'es': 'La orden está completada?',
      'en': 'Is order Completed?',
    },
    'ubidn5lw': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    '9r08wezn': {
      'es': 'Atrás',
      'en': 'Back',
    },
    '04ctb3aj': {
      'es': 'Editar Orden',
      'en': 'Edit Order',
    },
  },
  // btCreateUser
  {
    'iau6ckm5': {
      'es': 'Crear usuario',
      'en': 'Create user',
    },
    'qzle83o5': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'x3p7bvq2': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'zruozihk': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'vnbo323u': {
      'es': 'Dirección',
      'en': 'Address',
    },
    'oqpvqlqa': {
      'es': 'Número telefónico',
      'en': 'Phone number',
    },
    'i1agd51a': {
      'es': 'Agregar usuario',
      'en': 'Add user',
    },
  },
  // btCreateProduct
  {
    'utldio73': {
      'es': 'Agregar producto',
      'en': 'Add product',
    },
    '1qkw7g4y': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'j6us5naw': {
      'es': 'Descripción',
      'en': 'Description',
    },
    '5gfdi84l': {
      'es': 'Precio',
      'en': 'Price',
    },
    'ojz34r2r': {
      'es': 'Subir imagen',
      'en': 'Upload image',
    },
    'afytkfsd': {
      'es': 'En venta',
      'en': 'On sale',
    },
    '6jdbrmut': {
      'es': 'Es Bebida',
      'en': 'Drink',
    },
    'rng7s98m': {
      'es': 'Es Comida Japonesa',
      'en': 'Japanese food',
    },
    'p32me5th': {
      'es': 'Es Comida Koreana',
      'en': 'Korean Food',
    },
    '1niszn4y': {
      'es': 'Incluir como promoción',
      'en': 'Include as promotion',
    },
    'mejmn0ef': {
      'es': 'Agregar producto',
      'en': 'Add product',
    },
    '6z6kvltt': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    '4i81zkik': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
    '6914nd7f': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'q90mghns': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
    '7o9159va': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'k4xmf7o2': {
      'es': 'Por favor elija una opción presentada',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // Miscellaneous
  {
    'i96527dk': {
      'es': 'Mishi-Mimi desea acceder a la cámara',
      'en': 'Mishi-Mimi wants to access the camera',
    },
    'm7828rvr': {
      'es': 'Mishi-Mimi desea acceder a tu galería',
      'en': 'Mishi-Mimi wants to access your gallery',
    },
    'upadxlk1': {
      'es': 'Mishi-Mimi desea saber tu ubicación',
      'en': 'Mishi-Mimi wants to know your location',
    },
    'eucqsg57': {
      'es': '',
      'en': '',
    },
    'zmg4q7fa': {
      'es': '',
      'en': '',
    },
    'xhiin3du': {
      'es': '',
      'en': '',
    },
    '8c63vif9': {
      'es': '',
      'en': '',
    },
    'g7fb0gid': {
      'es': '',
      'en': '',
    },
    'z20m2l2p': {
      'es': '',
      'en': '',
    },
    'lmbl1p1g': {
      'es': '',
      'en': '',
    },
    '44mlp08a': {
      'es': '',
      'en': '',
    },
    '7tun4fdk': {
      'es': '',
      'en': '',
    },
    't6eomdmw': {
      'es': '',
      'en': '',
    },
    'tp83zj5t': {
      'es': '',
      'en': '',
    },
    '1es571uc': {
      'es': '',
      'en': '',
    },
    'ta3slpe7': {
      'es': '',
      'en': '',
    },
    'pnwyvef8': {
      'es': '',
      'en': '',
    },
    'ldtl7yga': {
      'es': '',
      'en': '',
    },
    '6td4ok5e': {
      'es': '',
      'en': '',
    },
    'hlkofe5l': {
      'es': '',
      'en': '',
    },
    'g8wkgbmu': {
      'es': '',
      'en': '',
    },
    'tcmttta1': {
      'es': '',
      'en': '',
    },
    '1otevop4': {
      'es': '',
      'en': '',
    },
    '88w3jjkt': {
      'es': '',
      'en': '',
    },
    'xlsipg5m': {
      'es': '',
      'en': '',
    },
    '6gumtj2d': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
