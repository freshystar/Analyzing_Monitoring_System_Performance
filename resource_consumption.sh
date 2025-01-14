#!/bin/bash

# Function to display system resource consumption
display_resource_consumption() {
  echo "### System Resource Consumption ###"
  echo ""

  # Display CPU usage
  echo "## CPU Usage"
  top -b -n 1 | head -n 10

  # Display memory usage
  echo -e "\n## Memory Usage"
  free -m | head -n 2

  # Display disk usage
  echo -e "\n## Disk Usage"
  df -h | head -n 6

  # Display network usage
  echo -e "\n## Network Usage"
  netstat -an | head -n 10

 }

# Function to analyze system resource consumption using vmstat
analyze_resource_consumption_vmstat() {
  echo "### System Resource Consumption (vmstat) ###"
  echo ""

  # Display vmstat output
  echo "## vmstat Output"
  vmstat -s

  # Display vmstat output with disk I/O
  echo -e "\n## vmstat Output (Disk I/O)"
  vmstat -d

  # Display vmstat output with network I/O
  echo -e "\n## vmstat Output (Network I/O)"
  vmstat -n
}


# Main function
main() {
  display_resource_consumption
  analyze_resource_consumption_vmstat
  }

# Call the main function
main
