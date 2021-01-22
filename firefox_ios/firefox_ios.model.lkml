connection: "telemetry"
label: "Firefox for iOS"

include: "//looker-hub/firefox_ios/*.view.lkml"
include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: usage {
  always_filter: {
    filters: [
      submission_date: "1 year",
    ]
  }
}
explore: growth {
  always_filter: {
    filters: [
      submission_date: "1 year",
    ]
  }
}

# Counters
explore: metrics_sample {
  from: metrics
  sql_always_where: DATE(submission_timestamp) = DATE_SUB(CURRENT_DATE, INTERVAL 2 DAYS)
    AND sample_id = 0;;
  hidden: yes
}

explore: column_field_paths {
  hidden: yes
}

explore: metrics_counters {
  hidden: yes
}

explore: counters {
  always_filter: {
    filters: [
      submission_date: "1 year",
      metric: "",
    ]
  }
}
