# Session 01 – Linux Processes & Services

## Objective
Learn how Linux manages running programs, monitor system health, and manage services using systemd.

---

# Processes

A process is a running instance of a program.

Important terms:
- PID (Process ID)
- PPID (Parent Process ID)
- Foreground process
- Background process
- Daemon

Useful commands:

```bash
ps aux
ps -ef
top
htop
```

---

# Load Average

Shows how busy the system is.

Interpretation:

- 1-core CPU
    - 0.50 → Light load
    - 1.00 → Fully utilized
    - 2.00 → Overloaded

---

# Memory

```bash
free -h
```

Shows:

- Total
- Used
- Free
- Buffers/cache
- Available

---

# Disk

```bash
df -h
```

Shows filesystem usage.

---

# Uptime

```bash
uptime
```

Displays:

- Current time
- Uptime
- Logged-in users
- Load average

---

# Process Priority

Nice value:

- -20 → Highest priority
- 19 → Lowest priority

Commands:

```bash
nice
renice
```

---

# Signals

Graceful stop:

```bash
kill PID
```

Force kill:

```bash
kill -9 PID
```

Common signals:

- SIGTERM (15)
- SIGKILL (9)

---

# systemd

systemd is PID 1.

Responsible for:

- Starting services
- Stopping services
- Restarting services
- Logging
- Boot process

---

# systemctl

Check service:

```bash
systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

Reload:

```bash
sudo systemctl reload nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

Disable:

```bash
sudo systemctl disable nginx
```

Mask:

```bash
sudo systemctl mask nginx
```

Unmask:

```bash
sudo systemctl unmask nginx
```

---

# journalctl

Logs of services.

```bash
journalctl -u nginx
```

Follow logs:

```bash
journalctl -fu nginx
```

---

# Health Check Script

Created:

```
scripts/health_check.sh
```

Reports:

- Uptime
- Memory
- Disk
- Processes
- Failed services

---

# Interview Questions

1. What is a process?
2. What is a daemon?
3. Difference between SIGTERM and SIGKILL?
4. Difference between restart and reload?
5. Difference between enable and start?
6. What is PID 1?
7. What is systemd?
8. What is load average?
9. What does `journalctl` do?
10. Why use `systemctl`?

---

# Commands to Remember

```bash
ps aux
top
htop
uptime
free -h
df -h
kill
kill -9
nice
renice
systemctl status
systemctl start
systemctl stop
systemctl restart
systemctl reload
systemctl enable
systemctl disable
systemctl mask
systemctl unmask
journalctl -u
journalctl -fu
```

---

# Interview Line

"I've written Bash health-check scripts and used systemd to manage and troubleshoot Linux services using systemctl and journalctl."
