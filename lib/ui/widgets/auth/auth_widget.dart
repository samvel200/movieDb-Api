import 'package:flutter/material.dart';
import 'package:moviedb/ui/Theme/app_button_style.dart';
import 'package:moviedb/ui/widgets/auth/auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Войти в свою учётную запись',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView(
        children: [_HeaterWidget()],
      ),
    );
  }
}

class _HeaterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации',
            style: textStyle,
          ),
          Text(
            'необходимо войти в свою учётную запись. Если у вас нет учётной записи',
            style: textStyle,
          ),
          Text(
            'её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text('Pегистрация')),
          SizedBox(
            height: 20,
          ),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
            style: textStyle,
          ),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text(
                'Pегистрироваться Email',
              ))
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    final textFiledDecorator = const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);

    final textStyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        Text('Имя пользователя', style: textStyle),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: model?.loginTextController,
          decoration: textFiledDecorator,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Пароль',
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFiledDecorator,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const _AuthButtonWidget(),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: () {},
                style: AppButtonStyle.linkButton,
                child: Text('сбросить пароль'))
          ],
        )
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final color = const Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : const Text('Войти');
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
            backgroundColor: WidgetStatePropertyAll(color),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
        child: child);
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: TextStyle(
          color: Colors.red,
          fontSize: 17,
        ),
      ),
    );
  }
}
