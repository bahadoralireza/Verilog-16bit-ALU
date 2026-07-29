\# 16-bit ALU in SystemVerilog



This repository contains my solution for \*\*Computer Assignment 3\*\* of the \*\*Digital Logic Design\*\* course at the University of Tehran.



\## Overview



This project implements a signed \*\*16-bit Arithmetic Logic Unit (ALU)\*\* in SystemVerilog using two different design approaches:



\- Behavioral modeling

\- Hardware-oriented (structural) modeling



Both implementations were simulated and synthesized to compare functionality, timing, and hardware utilization.



\## Supported Operations



| Opcode | Operation |

|:------:|-----------|

| 000 | Addition with Carry |

| 001 | Approximate Addition (`M + N/3`) |

| 010 | Increment |

| 011 | Multiply by 3 |

| 100 | Bitwise AND |

| 101 | Bitwise OR |

| 110 | Bitwise NOT |

| 111 | No Operation |



\## Project Structure



```

behavioral\_alu.v

behavioral\_tb.v

hardware\_alu.v

hardware\_tb.v

yosys\_behavioral\_netlist.v

yosys\_hardware\_netlist.v

yosys\_hardware\_netlist2.v```



\## Tools



\- SystemVerilog

\- ModelSim

\- Yosys

\- ABC



\## Author



\*\*Alireza Bahador\*\*  

B.Sc. Electrical Engineering  

University of Tehran

