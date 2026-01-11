# Ultimate-System-Master-v1
A powerful all-in-one Windows maintenance, optimization, and repair tool.

# 🛠️ ULTIMATE SYSTEM MASTER (Batch Edition)

**Ultimate System Master** is an advanced, menu-driven Windows system maintenance and optimization tool written entirely in **Batch (.bat)** with selective **PowerShell integration**.
Designed for **power users**, **IT technicians**, and **advanced Windows users** who want **full control**, **transparency**, and **no bloat**.

> ⚠️ This is NOT a “one-click magic optimizer”.
> This tool exposes real Windows maintenance operations and assumes the user understands what they are doing.

---

## ✨ Features Overview

### 🧹 Cleaning & Maintenance

* **Quick Clean**

  * Temp folders (User + Windows)
  * Windows log files
  * Recycle Bin
  * DNS cache flush

* **Deep Clean / Refresh**

  * All Quick Clean operations
  * Browser cache cleanup (Chrome, Edge, Firefox)
  * Windows Error Reports
  * SoftwareDistribution cache
  * Icon & thumbnail cache rebuild
  * Explorer refresh
  * IP release / renew
  * DISM component cleanup

---

### 🌐 Network & Performance

* **Network Boost**

  * TCP/IP stack reset
  * Winsock reset
  * TCP autotuning optimization

* **DNS Switcher & Benchmark**

  * Latency testing (Google, Cloudflare, AdGuard)
  * Apply static DNS
  * Reset to DHCP
  * Automatic DNS cache flush

* **Ultimate Performance Power Plan**

  * Unlocks hidden Windows Ultimate Performance scheme

---

### 🧠 System Optimization

* **Registry Optimizer**

  * UI responsiveness tweaks
  * App shutdown delay optimization

* **RAM Optimizer**

  * .NET garbage collection
  * Process working set trimming
  * Standby memory list flushing
    *(PowerShell assisted)*

---

### 🧩 System Repair & Health

* **System Repair**

  * SFC /scannow
  * DISM restore health

* **PC Health Check**

  * Disk SMART status
  * System uptime
  * Battery health report (HTML)

* **Detailed System Information**

  * OS, CPU, motherboard
  * RAM capacity and slots
  * Disk health
  * Boot uptime

---

### 🧼 Debloating & Utilities

* **Windows Debloater**

  * Removes selected built-in apps (News, Weather, GetHelp)

* **Winget App Updater**

  * Updates all installed apps via winget

* **Wi-Fi Password Viewer**

  * Displays saved Wi-Fi SSIDs and passwords

---

### 🔧 Power Tools

* **Chris Titus Tech WinUtil Launcher**
* **Microsoft Activation Script Launcher**
* **Windows Run Commands Menu**

  * Centralized launcher for:

    * Administrative tools
    * Control Panel applets
    * Disk utilities
    * Hardware diagnostics
    * Network tools

---

## 🔐 Security & Permissions

* Automatic **Administrator elevation** via UAC
* No persistence
* No background services
* No telemetry
* No registry writes without explicit action
* No obfuscation

> Everything executed is visible, inspectable, and editable.

---

## 📝 Logging

* Generates `Maintenance_Log.txt` on the Desktop
* Logs:

  * Maintenance start/end
  * DNS changes
  * Repair and utility executions

---

## ⚙️ Requirements

* Windows 10 / 11
* Administrator privileges
* PowerShell available (default on modern Windows)
* Winget installed (for updater feature)

---

## 🚀 Usage

1. Download the `.bat` file
2. Right-click → **Run as Administrator**
3. Navigate using numeric or letter-based menus
4. Read prompts carefully before executing actions

---

## ⚠️ Disclaimer

This tool performs **real system-level operations** such as:

* File deletion
* Registry modification
* Network stack reset
* App removal

Use at your own risk.
The author is **not responsible for data loss or system instability caused by misuse**.

> Recommended for advanced users only.

---

## 👨‍💻 Author

**Jerom Requillo**
Independent developer
Batch + PowerShell hybrid tooling enthusiast

---

## 📌 Philosophy

> Simple tools.
> No magic.
> Full transparency.
> User in control.

---

