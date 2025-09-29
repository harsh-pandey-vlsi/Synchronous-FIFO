# Synchronous FIFO (First-In-First-Out) in Verilog

## 📌 Project Overview

This project implements a **Synchronous FIFO (First-In-First-Out) buffer** in Verilog. The FIFO is **parameterizable**, allowing configurable **data width** and **depth**, which makes it reusable across different digital systems. It ensures safe **read and write operations** synchronized to a single clock domain while preventing invalid conditions like overflow and underflow.

---

## ⚙️ Features

* Parameterizable **DATA_WIDTH** and **DEPTH**
* Synchronous **read and write operations**
* **Full** and **Empty** status flags
* Safe handling of **overflow** and **underflow**
* Synthesizable design compatible with industry EDA tools
* Verified through an extensive **testbench**

---


## 🧩 Design Description

The FIFO uses:

* **Write pointer** and **Read pointer** to track positions in memory.
* **Counter** to maintain the number of elements stored.
* **Full** flag when count = DEPTH.
* **Empty** flag when count = 0.

Memory is implemented as a Verilog **register array**, supporting simultaneous read and write under safe conditions.

---

## 🧪 Verification

A **testbench** is provided to verify the FIFO functionality. The following cases are tested:

1. **Normal Operation** – sequential writes and reads.
2. **Overflow Condition** – attempting to write when FIFO is full.
3. **Underflow Condition** – attempting to read when FIFO is empty.
4. **Mixed Operations** – simultaneous read/write scenarios.

Simulation can be run in tools like **ModelSim**, **Vivado Simulator**, or **Icarus Verilog**. The testbench prints activity logs and can be observed in waveform viewers (VCD/GTKWave).

---

## 🛠️ Synthesis

The design is written in **synthesizable Verilog** and can be synthesized using tools such as:

* **Xilinx Vivado**
* **Intel Quartus**
* **Synopsys Design Compiler**

Since the FIFO is parameterizable, it can be scaled for different use-cases without modifying the RTL code.

---


## 📖 Learning Outcomes

* Understanding of **memory modeling** in Verilog
* Pointer management and **circular buffer design**
* Importance of handling **overflow and underflow conditions**
* Practical verification of synchronous digital circuits

---


