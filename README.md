# x86-64_assembly_zoo_record_manager

<h2>Description</h2>
A complete record management system for badgers and zookeepers, written in x86-64 Assembly. Implements static memory allocation, array-based records, custom search, display, add, and delete functions — all without dynamic memory.
<br />

<h2>Features</h2>

- <b>**Two record types: Badgers and Zookeepers**</b> 
- <b>**Fixed-size memory allocation for maximum efficiency**</b>
- <b>**Custom record sizes based on realistic constraints**</b>
- <b>**Low-level data manipulation using register-based operations**</b>
- <b>**Search and validation of IDs with custom string comparison**</b>
- <b>**Record deletion with memory shift for efficiency**</b>
- <b>**Display functions with calculated values**</b>

<h2>Data Structure Overview</h2>

| Record Type | Max Entries | Record Size | Total Memory |
| --- | ---: | --- | --- |
| Badger      | 500        | 214 bytes   | ~107 KB      |
| Zookeeper   | 100        | 271 bytes   | ~27 KB       |

- <b>**Memory is allocated in the `.bss` section and indexed manually by multiplying record size with entry index**</b>

<h2>**Technical Highlights**</h2>

- <b>**Static `.bss` arrays for all record storage**</b>
- <b>**Pointer arithmetic for record navigation**</b>
- <b>**Register-based loops for record display & deletion**</b>
- <b>**Manual string handling, including null-terminated, custom copy & compare**</b>
- <b>**Validation checks for IDs and constrained inputs**</b>
- <b>**Deterministic memory usage**</b>

<p align="center">
Starting the program and adding staff member 1: <br/>
<img src="https://i.imgur.com/aIYdUdd.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Adding a staff member in the program: <br/>
<img src="https://i.imgur.com/RnmIYLn.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Adding a badger in the program: <br/>
<img src="https://i.imgur.com/GbciVua.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Searching up a staff member: <br/>
<img src="https://i.imgur.com/YjvctbP.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Searching up a badger:  <br/>
<img src="https://i.imgur.com/B9wWZdB.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Showing all staff records:  <br/>
<img src="https://i.imgur.com/2TPUWLA.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />
Deleting a staff record:  <br/>
<img src="https://i.imgur.com/ObSd08T.png" height="80%" width="80%" alt="Assembly_Program_Runtime"/>
<br />
<br />

</p>
