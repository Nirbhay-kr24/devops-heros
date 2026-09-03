# Task 1: Soft Link & Hard Link

### Difference between Hard Link and Soft Link

A **Hard Link** is another name for the same inode as the original file. Both files share the same inode and data. If the original file is deleted, the hard link can still access the data.

A **Soft Link (Symbolic Link)** is a shortcut that points to the path of the original file. It has a different inode. If the original file is deleted or moved, the soft link becomes a broken link.

### Commands Used

```bash
# Create a hard link
ln original.txt hard_link.txt

# Create a soft link
ln -s original.txt soft_link.txt

# Check inode numbers
ls -li original.txt hard_link.txt soft_link.txt
```

### Output

```text
2111 -rw-r--r-- 2 nirbhay nirbhay 12 Sep  3 18:35 hard_link.txt
2111 -rw-r--r-- 2 nirbhay nirbhay 12 Sep  3 18:35 original.txt
2113 lrwxrwxrwx 1 nirbhay nirbhay 12 Sep  3 18:37 soft_link.txt -> original.txt
```

### Observation

The original file and hard link have the same inode number **2111**, while the soft link has a different inode number **2113**.

After deleting the original file:

```bash
rm original.txt
```

The hard link still displayed the file contents:

```text
Hello Linux
```

using:

```bash
cat hard_link.txt
```

But the soft link failed:

```text
cat: soft_link.txt: No such file or directory
```

### Conclusion

A hard link shares the same inode as the original file and continues to work after the original filename is deleted. A soft link has a separate inode and becomes broken when its target is deleted.





# Task 2: adduser vs useradd

### Difference between adduser and useradd

**useradd** is a low-level Linux command used to create users. It is non-interactive and requires options to configure additional settings such as the home directory and login shell.

**adduser** is a higher-level and more user-friendly command commonly used on Ubuntu/Debian. It interactively creates the user and automatically handles common settings such as the home directory, user group, password, and default configuration files.

### Which command is preferred on Ubuntu?

`adduser` is generally preferred on Ubuntu/Debian because it is easier to use and automatically handles common user-account setup.

### Creating a user using adduser

Command used:

```bash
sudo adduser testuser
```

The command successfully created the user and group:

```text
Adding new group `testuser' (1002) ...
Adding new user `testuser' (1001) with group `testuser' ...
Creating home directory `/home/testuser' ...
Copying files from `/etc/skel' ...
passwd: password updated successfully
```

### Verifying the user

Command:

```bash
id testuser
```

Output:

```text
uid=1001(testuser) gid=1002(testuser) groups=1002(testuser)
```

The home directory was also created:

```bash
ls -ld /home/testuser
```

Output:

```text
drwxr-x--- 2 testuser testuser 4096 Sep  3 18:44 /home/testuser
```

The `/etc/passwd` entry was:

```text
testuser:x:1001:1002:,,,:/home/testuser:/bin/bash
```

### Comparing with useradd

Command:

```bash
sudo useradd testuser2
```

Verification:

```bash
id testuser2
```

Output:

```text
uid=1002(testuser2) gid=1003(testuser2) groups=1003(testuser2)
```

The `/etc/passwd` entry was:

```text
testuser2:x:1002:1003::/home/testuser2:/bin/sh
```

### Observation

`adduser` automatically created the home directory and provided an interactive setup. Basic `useradd` created the user with fewer automatic configurations.

### Conclusion

On Ubuntu/Debian, `adduser` is generally preferred for manually creating users because it provides a simpler and more user-friendly setup process.

### Interview Answer

**Q: What is the difference between adduser and useradd?**

`useradd` is a low-level, non-interactive user creation command, while `adduser` is a higher-level, interactive utility that simplifies user creation and automatically handles common account settings.




# 3. journalctl

* `journalctl` is the query and display tool for `systemd-journald`, the service responsible for collecting and storing logging data in binary format on modern Linux distributions. It aggregates kernel logs, system daemon outputs, and standard error/output from services managed by systemd.
* Key Usage:

  * View all logs: `journalctl`
  * View logs for a specific service: `journalctl -u <service>`
  * Follow logs in real-time: `journalctl -f`
  * View logs since boot: `journalctl -b`

### Commands & Expected Output

```bash
# Check journalctl location
which journalctl

# Check journalctl version
journalctl --version

# View recent system logs
journalctl -n 20

# List currently running services
systemctl list-units --type=service --state=running

# Check the status of a specific service
systemctl status systemd-resolved

# View logs for a specific service
journalctl -u systemd-resolved -n 20
```

#### Expected Output:

```text
/usr/bin/journalctl
```

```text
systemd 249 (249.11-0ubuntu3.22)
```

For recent system logs:

```text
Sep 03 18:46:16 NiravHPOMEN systemd[1]: Starting Update APT News...
Sep 03 18:46:18 NiravHPOMEN systemd[1]: Finished Update APT News.
Sep 03 18:46:49 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:47:23 NiravHPOMEN kernel: mini_init (224): drop_caches: 1
Sep 03 18:47:30 NiravHPOMEN useradd[1813]: new group: name=testuser2, GID=1003
Sep 03 18:47:30 NiravHPOMEN useradd[1813]: new user: name=testuser2, UID=1002, GID=1003
```

For the service status:

```text
systemd-resolved.service - Network Name Resolution
Active: active (running)
Main PID: 142
```

For service-specific logs:

```text
Sep 03 18:40:06 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:41:12 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:42:19 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:43:27 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:44:34 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:45:41 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:46:49 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:47:56 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:49:03 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
Sep 03 18:50:44 NiravHPOMEN systemd-resolved[142]: Clock change detected. Flushing caches.
```

**Note:** The original example uses the SSH service:

```bash
sudo journalctl -u ssh -f
```

However, SSH was not installed in my WSL environment:

```text
Unit ssh.service could not be found.
```

Therefore, `systemd-resolved` was used as the available running service for practicing service-specific logs.



# 4. Linux Command Cheat Sheet

| **Command**       | **Description**                                        |
| ----------------- | ------------------------------------------------------ |
| ls                | List directory contents.                               |
| cd                | Change directory.                                      |
| pwd               | Print working directory.                               |
| mkdir             | Make new directory.                                    |
| rm                | Remove files/directories.                              |
| touch             | Create a new file.                                     |
| cp                | Copy files.                                            |
| mv                | Move or rename files.                                  |
| cat               | View file content.                                     |
| less / more       | View large files.                                      |
| tail              | View end of file.                                      |
| head              | View top of file.                                      |
| grep              | Search inside files.                                   |
| ps                | Show processes.                                        |
| top / htop        | System resource usage.                                 |
| kill              | Kill process by PID.                                   |
| systemctl status  | Check service status.                                  |
| systemctl restart | Restart a service.                                     |
| ping              | Check connectivity.                                    |
| ip a / ifconfig   | Show IP/network config.                                |
| netstat           | Show network connections.                              |
| curl              | Fetch URL data.                                        |
| wget              | Download file.                                         |
| chmod             | Change file permissions.                               |
| chown             | Change file owner.                                     |
| apt               | Install packages (Ubuntu/Debian).                      |
| yum               | Install packages (RHEL/CentOS).                        |
| df                | Show disk usage.                                       |
| du                | Show file/folder size.                                 |
| crontab -e        | Edit cron jobs.                                        |
| nohup             | Run command in background.                             |
| adduser           | Add a new user.                                        |
| useradd           | Create user (non-interactive).                         |
| usermod           | Modify user account.                                   |
| passwd            | Change user password.                                  |
| id                | Display UID, GID, and groups.                          |
| groups            | Show groups user belongs to.                           |
| deluser / userdel | Delete a user.                                         |
| who               | List logged-in users.                                  |
| w                 | Show who is logged in and what they are doing.         |
| last              | Show login history.                                    |
| uname -a          | Kernel & system info.                                  |
| hostname          | Show system hostname.                                  |
| uptime            | Show system uptime.                                    |
| whoami            | Current logged-in username.                            |
| history           | Show command history.                                  |
| date              | Current system date/time.                              |
| clear             | Clear terminal screen.                                 |
| !! / !n           | Run last command again / Run nth command from history. |
| Ctrl+C            | Cancel running command.                                |
| Ctrl+L            | Clear terminal screen.                                 |

### Commands & Expected Output

```bash
# File, Directory, and Info Operations
pwd
mkdir -p /tmp/devops_practice
touch /tmp/devops_practice/index.html
ls -l /tmp/devops_practice
whoami
date
```

#### Expected Output:

<img width="956" height="277" alt="image" src="https://github.com/user-attachments/assets/e91722a1-00f1-4725-976c-4c524b2a6653" />


### Description of Commands

* `pwd` → Displays the current working directory.
* `mkdir -p` → Creates the specified directory.
* `touch` → Creates a new empty file.
* `ls -l` → Displays the files with detailed information such as permissions, owner, group and size.
* `whoami` → Displays the currently logged-in username.
* `date` → Displays the current system date and time.
