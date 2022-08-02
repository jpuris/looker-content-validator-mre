connection: "otovo_aws_redshift"

label: "Content Validator MRE"

include: "/content_validator_mre.dashboard"

view: example {

  derived_table: {

    # REDSHIFT
    sql: SELECT i AS pk, getdate()  - (i * interval '1 day') AS ts FROM generate_series(1, 1000) i ORDER BY 1 ;;

    # PostgreSQL
    # sql: SELECT i AS pk, now()  - (i * interval '1 day') AS ts FROM generate_series(1, 1000) i ORDER BY 1 ;;

  }

  dimension: dim__pk {
    primary_key: yes
    label: "Primary Key"
    type: number
    sql: ${TABLE}.pk ;;
  }

  dimension_group: dim__datetime {
    label: "Sample Datetime"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]

    sql: ${TABLE}.ts ;;
  }

  measure: count {
    label: "Row Count"
    type: count
  }

}

explore: example {
  label: "Example Explore"
}
