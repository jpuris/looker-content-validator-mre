- name: add_a_unique_name_1659461682
  title: Untitled Visualization
  model: example_content_validator
  explore: example
  type: looker_grid
  fields: [example.count, example.dim__datetime_year, row_count_pk_between_400_700,
    row_count_pk_between_500_800]
  fill_fields: [example.dim__datetime_year]
  sorts: [example.dim__datetime_year desc]
  limit: 500
  dynamic_fields:
  - category: measure
    expression:
    label: Row Count, PK Between [400, 700]
    value_format:
    value_format_name:
    based_on: example.count
    _kind_hint: measure
    measure: row_count_pk_between_400_700
    type: count
    _type_hint: number
    filters:
      example.dim__pk: "[400,700]"
  - args:
    - example.count
    calculation_type: percent_of_column_sum
    category: table_calculation
    based_on: example.count
    label: Percent of Example Row Count
    source_field: example.count
    table_calculation: percent_of_example_row_count
    value_format:
    value_format_name: percent_0
    _kind_hint: measure
    _type_hint: number
  - category: measure
    expression: |-
      ${example.dim__pk} >= 500 AND
      ${example.dim__pk} <= 800
    label: Row Count, PK Between [500, 800]
    value_format:
    value_format_name:
    based_on: example.count
    filter_expression: |-
      ${example.dim__pk} >= 500 AND
      ${example.dim__pk} <= 800
    _kind_hint: measure
    measure: row_count_pk_between_500_800
    type: count
    _type_hint: number
    filters: {}
  show_view_names: false
  show_row_numbers: true
  transpose: false
  truncate_text: true
  hide_totals: false
  hide_row_totals: false
  size_to_fit: true
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: 12
  rows_font_size: 12
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  defaults_version: 1
