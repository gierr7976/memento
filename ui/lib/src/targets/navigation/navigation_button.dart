import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/tabler_icons.dart';

/// Навигационная кнопка со стрелкой.
class MementoNavigationButton extends StatelessWidget
    with MementoColorThemeUserMixin {
  /// Заголовок кнопки.
  final String title;

  /// Описание кнопки. Если равно [null], отражающие его виджеты внутри кнопки
  /// не создаются.
  final String? description;

  /// То, что произойдёт, когда пользователь коснётся кнопки.
  final GestureTapCallback? onTap;

  /// Цвет заголовка и стрелки, по умолчанию — приглушённый цвет текста
  /// темы.
  final Color? titleColor;

  /// Цвет описания, по умолчанию — полузаглушённый цвет текста темы.
  final Color? descriptionColor;

  /// Цвет подложки, по умолчанию — фоновый цвет темы.
  final Color? groundColor;

  /// Доступность кнопки для пользовательских взаимодействий.
  final bool enabled;

  /// Базовый конструктор.
  MementoNavigationButton({
    Key? key,
    required this.title,
    this.description,
    this.onTap,
    this.titleColor,
    this.descriptionColor,
    this.groundColor,
    this.enabled = true,
  }) : super(key: key);

  Color _getContentColor(BuildContext context, Color enabledColor) =>
      enabled ? enabledColor : colorTheme(context).dimmedText;

  Color _getTitleColor(BuildContext context) => _getContentColor(
      context, titleColor ?? colorTheme(context).semiDimmedText);

  Color _getDescriptionColor(BuildContext context) => _getContentColor(
      context, descriptionColor ?? colorTheme(context).almostDimmedText);

  @override
  Widget build(BuildContext context) => FlatClickable(
        color: groundColor,
        onTap: onTap,
        enabled: enabled,
        child: _content(context),
      );

  Widget _content(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
        child: Row(
          children: [
            _text(context),
            _icon(context),
          ],
        ),
      );

  Padding _icon(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 16),
        child: Icon(
          TablerIcons.chevron_right,
          color: _getTitleColor(context),
          size: 32,
        ),
      );

  Widget _text(BuildContext context) => Expanded(
        child: description != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _title(context),
                  _description(context),
                ],
              )
            : _title(context),
      );

  Padding _description(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          description!,
          style:
              MementoText.small.copyWith(color: _getDescriptionColor(context)),
          softWrap: true,
        ),
      );

  Widget _title(BuildContext context) => Text(
        title,
        style: MementoText.mediumLabel.copyWith(color: _getTitleColor(context)),
        softWrap: true,
      );
}
