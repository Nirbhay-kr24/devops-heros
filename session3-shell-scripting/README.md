# Shell Scripting Homework

## 1. System Information Shell Script

### Objective

Create a shell script that:

* Prints the current date.
* Prints the hostname.
* Prints the username.
* Displays disk usage.
* Displays running processes.
* Uses variables to store and use data.
* Takes user input using `read -p`.
* Creates a directory using `mkdir`.
* Creates a file using `touch`.
* Stores running process information using `>` output redirection.

---

### Shell Script

```bash
#!/bin/bash

# Store information in variables
current_date=$(date)
hostname=$(hostname)
username=$(whoami)
disk_usage=$(df -h)

# Take user input
read -p "Enter directory name: " directory

# Create directory
mkdir -p "$directory"

# Create file
touch "$directory/processes.txt"

# Store running processes in the file
ps > "$directory/processes.txt"

# Display system information
echo "Current Date: $current_date"
echo "Hostname: $hostname"
echo "Username: $username"

echo "Disk Usage:"
echo "$disk_usage"

echo "Running Processes:"
ps

echo "Process information has been stored in $directory/processes.txt"
```

---

## Commands Used

```bash
mkdir -p ~/shell_scripting
cd ~/shell_scripting
pwd
touch system_info.sh
nano system_info.sh
chmod +x system_info.sh
ls -l system_info.sh
./system_info.sh
```

---

## Script Execution

The script was executed using:

```bash
./system_info.sh
```

The directory name entered was:

```text
system_data
```

### Script Output

<img width="950" height="786" alt="image" src="https://github.com/user-attachments/assets/dbf25a75-0bea-4282-be47-49b3e08963ec" />


---

## Created Directory and Process File

The script created a directory and file using `mkdir` and `touch`.

Commands used:

```bash
ls -l system_data
cat system_data/processes.txt
```

### Created File and Process Information
<img width="944" height="839" alt="image" src="https://github.com/user-attachments/assets/ca1fc4a3-a9f3-4127-b98c-5a11ef4ee042" />


---

## Commands and Concepts Used

| Command / Concept | Purpose                                      |
| ----------------- | -------------------------------------------- |
| `date`            | Displays the current date and time           |
| `hostname`        | Displays the system hostname                 |
| `whoami`          | Displays the current username                |
| `df -h`           | Displays disk usage in human-readable format |
| `ps`              | Displays running processes                   |
| `read -p`         | Takes input from the user                    |
| `mkdir`           | Creates a directory                          |
| `touch`           | Creates a file                               |
| `echo`            | Displays text and variable values            |
| `>`               | Redirects command output into a file         |
| Variables         | Store and reuse information                  |

---

## Variables Used

The script uses variables to store system information:

```bash
current_date=$(date)
hostname=$(hostname)
username=$(whoami)
disk_usage=$(df -h)
```

The user input is stored in:

```bash
read -p "Enter directory name: " directory
```

The `$directory` variable is then used to create the directory and file.

---

## Output Redirection

The running process information is stored in `processes.txt` using the `>` operator:

```bash
ps > "$directory/processes.txt"
```

This redirects the output of the `ps` command into the file.

---

## Result

The shell script was successfully created and executed. It displays the current date, hostname, username, disk usage, and running processes. It also accepts user input, creates a directory and file, and stores the running process information in the file using output redirection.
