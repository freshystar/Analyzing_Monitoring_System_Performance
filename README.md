# Analyzing and Monitoring System Performance under Load

#### Group Members
 - Joel Nathan
 - Franck-Sorel
 - Ange Fresnelle

## Solution to Exercise 1

`Stress` testing is a crucial aspect of ensuring the reliability and performance of your systems. By simulating heavy loads and stress conditions, you can identify potential vulnerabilities, and performance issues before they impact your system. In the steps below, we are going to guide you in to simulating heavy CPU, memory, and I/O usage using Docker and the stress utility.

### Prerequisites

- Docker installed on your system
- Basic understanding of Docker concepts
- Basic command-line skills

### Step 1: Creating a docker container

> - *Building a container* = *Building an image* + *running a container with that image*
  
Thus, let's build our image and run our container.
Move to the directory where your **Dockerfile** is found and type:
```sh
$ docker build -t test_image .
$ docker run -itd --name test test_image
```
You can run `docker images` to view the image we just built and `docker ps` to view running containers.
```sh
$ docker exec -it test bash
```

### Step 2: Stressing CPU, Memory,I/O and Analyzing System Performance
Now that we are in the container, let us move to `/home/ubuntu` and source the file, `source.sh`:
```sh
$ cd /home/ubuntu 
$ source source.sh
```
Our container is now under stress(overload), due to the `CMD` that was executed from the **Dockerfile**. Here is a detail of what was passed to the `CMD` variable in the **Dockerfile**:

 ```sh
 $ stress --cpu 2 --io 2 --vm 2 --vm-bytes 128M --timeout 180s 
 ```

  - `--cpu 2`: generates two CPU stressor process.
  - `--io 2`: generates two I/O stressor process.
  - `--vm 2`:  generates two virtual memory stressor process.
  - `--vm-bytes 128M`: Allocates 128 megabytes of memory per virtual       memory stressor process.
  - `--timeout 180s`: Limits the stress test duration to 90 seconds.
  
    
 ```sh
  top -b -n 1
  ```
Run `top` with the (-b ) *batch mode*(useful for sending output from top to other programs or to a file) and with just one iteration(-n 1).

   Let's move to our log files and view the logs:
   
   ```sh
   $ cd /home/ubuntu/logs
   $ ls 
   ```
   You can `cat` any file of your choice to view the logs. 
   > :memo: **Note:** In case of any *critical* situation, the file *report.txt* will contain a summarized report of the logs, else it contains irrelevant information.

   ### Step 3:
   We created a cronfile for you for the script `source.sh` to be executed at a particular time. You can go to `/etc/cron.d/cronfile` in your container to view or change it.


   ## Why it should work

   **vmstat command**
  Is used to report virtual memory information on devices.

  **netsat command**
  Serve as a monitoring tool for connections over the network.

 > :bulb: **Tip:** *TO SEE ALL THE SCRIPT REFER TO THE FILE:*

> resource_consumption.sh

**SCRIPT GENERATING THE LOGS**

> resource_consumption_output.sh

**SCRIPT GENERATING REPORT**

> resource_consumption_output_report.sh



  