# Networking Commands Practice


## 1. Ping Command

**Command Executed:**

```bash
ping -c 4 google.com
```

**Output:**

<img width="945" height="209" alt="image" src="https://github.com/user-attachments/assets/7dfcd546-5834-4fc9-90ba-aa3db5762a6a" />


**Explanation:**

The `ping` command is used to check whether a host is reachable over a network. It sends ICMP packets to the destination and shows the response time and packet loss.

In my output, all 4 packets were received with **0% packet loss**.

---

## 2. Curl Command

**Command Executed:**

```bash
curl -I https://example.com
```

**Output:**

<img width="947" height="237" alt="image" src="https://github.com/user-attachments/assets/616dd4b3-35b6-40b2-9d46-74e01ffbce41" />


**Explanation:**

The `curl` command is used to communicate with servers using protocols such as HTTP and HTTPS. The `-I` option displays only the HTTP response headers.

The `HTTP/2 200` response shows that the server responded successfully.

---

## 3. Traceroute Command

**Command Executed:**

```bash
traceroute google.com
```

**Output:**

<img width="946" height="402" alt="image" src="https://github.com/user-attachments/assets/93b1c10c-9cff-4c9a-8550-c84fe39e20f7" />


**Explanation:**

The `traceroute` command shows the network hops taken by packets from the local system to the destination. It is useful for understanding the path followed by network traffic and finding possible network delays.

Some hops displayed `*` because those routers did not respond to the traceroute probes.

---

## 4. Nslookup Command

**Command Executed:**

```bash
nslookup google.com
```

**Output:**

<img width="975" height="196" alt="image" src="https://github.com/user-attachments/assets/3e8d61d2-17d6-4ca6-b5c4-f500a6034f36" />


**Explanation:**

The `nslookup` command is used to query DNS and find the IP address associated with a domain name.

In my output, `google.com` was resolved to both an IPv4 and an IPv6 address.

---

## 5. Ifconfig Command

**Command Executed:**

```bash
ifconfig
```

**Output:**

<img width="993" height="383" alt="image" src="https://github.com/user-attachments/assets/30ad83fa-4871-4bc8-996e-66895d32519d" />


**Explanation:**

The `ifconfig` command displays information about network interfaces, including IP addresses, MAC addresses, and network statistics.

In my WSL system, the main network interface was `eth0`, with IPv4 address `172.21.127.42`. The `lo` interface is the local loopback interface with address `127.0.0.1`.

---

## 6. Netstat Command

**Command Executed:**

```bash
netstat -tuln
```

**Output:**

<img width="973" height="205" alt="image" src="https://github.com/user-attachments/assets/bb8f1521-4c64-48f0-a6d2-9e3d94070a83" />


**Explanation:**

The `netstat` command displays network connections and listening ports. The `-tuln` options show TCP and UDP listening ports using numerical addresses.

My output showed PostgreSQL listening on port `5432` and DNS services using port `53`.

---

## 7. Route Command

**Command Executed:**

```bash
route -n
```

**Output:**

<img width="980" height="103" alt="image" src="https://github.com/user-attachments/assets/7bf6d061-d0b8-4a38-abda-ede8eb575ec5" />


**Explanation:**

The `route` command displays the system's IP routing table. The routing table determines where network packets should be sent based on their destination.

In my output, the default gateway was `172.21.112.1` and the network interface was `eth0`.

---

## 8. Hostname Command

**Command Executed:**

```bash
hostname
```

**Output:**

<img width="972" height="41" alt="image" src="https://github.com/user-attachments/assets/3314e8f2-d3aa-4263-bfbe-92a5f69190c9" />


**Explanation:**

The `hostname` command displays the hostname of the current system. It is used to identify a machine on a network.

My system hostname is `NiravHPOMEN`.

---

## 9. Dig Command

**Command Executed:**

```bash
dig google.com +short
```

**Output:**

<img width="832" height="39" alt="image" src="https://github.com/user-attachments/assets/a1b19b2a-04b0-4b28-8fa6-46b4224352e1" />


**Explanation:**

The `dig` command is used to perform DNS queries. The `+short` option provides a simple output containing the resolved IP address.

In my output, `google.com` resolved to:

```text
142.250.207.174

```
---
