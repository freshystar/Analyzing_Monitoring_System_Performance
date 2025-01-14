#!/bin/bash

# Set the log directory
LOG_DIR="logs"

# Create the log directory if it doesn't exist
 mkdir -p "$LOG_DIR"

# Function to display system resource consumption
display_resource_consumption() {
  echo "### System Resource Consumption ###"
  echo ""

  # Display CPU usage
  echo "## CPU Usage"
  top -b -n 1 | head -n 10 > "$LOG_DIR/cpu_usage.log"

  # Display memory usage
  echo -e "\n## Memory Usage"
  free -m | head -n 2 > "$LOG_DIR/memory_usage.log"

  # Display disk usage
  echo -e "\n## Disk Usage"
  df -h | head -n 6 > "$LOG_DIR/disk_usage.log"

  # Display network usage
  echo -e "\n## Network Usage"
  netstat -an | head -n 10 > "$LOG_DIR/network_usage.log"

  # Display process list with htop
  #echo -e "\n## Process List (htop)"
  #htop -d 10 > "$LOG_DIR/htop.log"
}

# Function to analyze system resource consumption using vmstat
analyze_resource_consumption_vmstat() {
  echo "### System Resource Consumption (vmstat) ###"
  echo ""

  # Display vmstat output
  echo "## vmstat Output"
  vmstat -s > "$LOG_DIR/vmstat.log"

  # Display vmstat output with disk I/O
  echo -e "\n## vmstat Output (Disk I/O)"
  vmstat -d > "$LOG_DIR/vmstat_disk_io.log"

  # Display vmstat output with network I/O
  echo -e "\n## vmstat Output (Network I/O)"
  vmstat -n > "$LOG_DIR/vmstat_network_io.log"
}


# Function to log output to JSON files
 log_to_json() {
  # Log CPU usage to JSON
  cpu_usage=$(top -b -n 1 | head -n 10)
  echo "{\"cpu_usage\": [$cpu_usage]}" > "$LOG_DIR/cpu_usage.json"

  # Log memory usage to JSON
  memory_usage=$(free -m | head -n 2)
  echo "{\"memory_usage\": [$memory_usage]}" > "$LOG_DIR/memory_usage.json"

  # Log disk usage to JSON
  disk_usage=$(df -h | head -n 6)
  echo "{\"disk_usage\": [$disk_usage]}" > "$LOG_DIR/disk_usage.json"

  # Log network usage to JSON
   network_usage=$(netstat -an | head -n 10)
   echo "{\"network_usage\": [$network_usage]}" > "$LOG_DIR/network_usage.json"
  # Log htop output to JSON
  #htop_output=$(htop -d 10)
  #echo "{\"htop\": [$htop_output]}" > "$LOG_DIR/htop.json"

  # Log vmstat output to JSON
   vmstat_output=$(vmstat -s)
   echo "{\"vmstat\": [$vmstat_output]}" > "$LOG_DIR/vmstat.json"

  # Log iotop output to JSON
  #iotop_output=$(iotop -b -n 1)
  #echo "{\"iotop\": [$iotop_output]}" > "$LOG_DIR/iotop.json"

}

# Main function
main() {
  display_resource_consumption
  analyze_resource_consumption_vmstat
  log_to_json
}

# Call the main function
main
