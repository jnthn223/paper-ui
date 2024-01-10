// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:paper_ui/components/forms/button.dart' as _i2;
import 'package:paper_ui/components/forms/checkbox.dart' as _i3;
import 'package:paper_ui/components/forms/editable.dart' as _i4;
import 'package:paper_ui/components/forms/input.dart' as _i5;
import 'package:paper_ui/components/forms/select.dart' as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'forms',
        children: [
          _i1.WidgetbookComponent(
            name: 'Button',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Button',
                builder: _i2.defaultButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'Button with Icon',
                builder: _i2.buttonWithIcon,
              ),
              _i1.WidgetbookUseCase(
                name: 'Icon Button',
                builder: _i2.iconButton,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'CheckBox',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default Checkbox',
              builder: _i3.defaultCheckBox,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Editable',
            useCase: _i1.WidgetbookUseCase(
              name: 'Editable',
              builder: _i4.defaultEditable,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'InputText',
            useCase: _i1.WidgetbookUseCase(
              name: 'InputText',
              builder: _i5.defaultInputText,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Select',
            useCase: _i1.WidgetbookUseCase(
              name: 'Select',
              builder: _i6.defaultSelect,
            ),
          ),
        ],
      )
    ],
  )
];
