#!/bin/bash

# Set the log directory
LOG_DIR="logs"

# Create the report file
REPORT_FILE="report.txt"

# Function to generate the report
generate_report() {
  echo "### System Resource Consumption Report ###" > "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"

  # Filter CPU usage warnings
  cpu_usage_warnings=$(grep -i "warning" "$LOG_DIR/cpu_usage.log")
  if [ -n "$cpu_usage_warnings" ]; then
    echo "## CPU Usage Warnings" >> "$REPORT_FILE"
    echo "$cpu_usage_warnings" >> "$REPORT_FILE"
  fi

  # Filter memory usage warnings
  memory_usage_warnings=$(grep -i "warning" "$LOG_DIR/memory_usage.log")
  if [ -n "$memory_usage_warnings" ]; then
    echo -e "\n## Memory Usage Warnings" >> "$REPORT_FILE"
    echo "$memory_usage_warnings" >> "$REPORT_FILE"
  fi

  # Filter disk usage warnings
  disk_usage_warnings=$(grep -i "warning" "$LOG_DIR/disk_usage.log")
  if [ -n "$disk_usage_warnings" ]; then
    echo -e "\n## Disk Usage Warnings" >> "$REPORT_FILE"
    echo "$disk_usage_warnings" >> "$REPORT_FILE"
  fi

  # Filter network usage warnings
  network_usage_warnings=$(grep -i "warning" "$LOG_DIR/network_usage.log")
  if [ -n "$network_usage_warnings" ]; then
    echo -e "\n## Network Usage Warnings" >> "$REPORT_FILE"
    echo "$network_usage_warnings" >> "$REPORT_FILE"
  fi

  # Filter vmstat output warnings
  vmstat_output_warnings=$(grep -i "warning" "$LOG_DIR/vmstat.log")
  if [ -n "$vmstat_output_warnings" ]; then
    echo -e "\n## Vmstat Output Warnings" >> "$REPORT_FILE"
    echo "$vmstat_output_warnings" >> "$REPORT_FILE"
  fi

  #Summarize the findings
  echo -e "\n## Summary" >> "$REPORT_FILE"
  echo "The system resource consumption report has identified the following warnings:" >> "$REPORT_FILE"
  if [ -n "$cpu_usage_warnings" ]; then
    echo "- CPU usage warnings" >> "$REPORT_FILE"
  fi
  if [ -n "$memory_usage_warnings" ]; then
    echo "- Memory usage warnings" >> "$REPORT_FILE"
  fi
  if [ -n "$disk_usage_warnings" ]; then
    echo "- Disk usage warnings" >> "$REPORT_FILE"
  fi
  if [ -n "$network_usage_warnings" ]; then
    echo "- Network usage warnings" >> "$REPORT_FILE"
  fi
  if [ -n "$vmstat_output_warnings" ]; then
    echo "- Vmstat output warnings" >> "$REPORT_FILE"
  fi
  }

# Main function
main() {
  generate_report
}

# Call the main function
main

