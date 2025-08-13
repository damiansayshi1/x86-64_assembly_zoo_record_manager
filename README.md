<h1>x86-64_assembly_zoo_record_manager</h1>

<h2>Description</h2>
<p>A complete record management system for badgers and zookeepers, written in x86-64 Assembly. Implements static memory allocation, array-based records, custom search, display, add, and delete functions — all without dynamic memory. </p>
<br />

<p>This project was undertaken to build a deep, foundational understanding of how software interacts with hardware at the most fundamental level. By bypassing modern programming languages and their abstractions, I was forced to manage memory, control the CPU, and handle data structures manually, which provides invaluable insight into system performance, efficiency, and security. </p>

<h2>Goals and Purpose</h2>


<ul>
<li><b>Master Low-Level Operations: </b>The primary goal was to implement a complete application using only x86-64 assembly instructions, demonstrating proficiency in core computing concepts.</li>
<li><b>Manual Memory Management</b>To design and manage a data storage system within a fixed memory block (.bss section), using pointer arithmetic to navigate records without relying on any operating system or library functions for memory allocation.</li>
<li><b>Build from Scratch: </b>To create all core application logic—including user input/output, string comparison, and data validation—from the ground up.</li>
</ul>
<br />


<h2>Features</h2>

<p><b>Two record types: Badgers and Zookeepers</b></p> 
<ul>
<li>Fixed-size memory allocation for maximum efficiency</li>
<li>Custom record sizes based on realistic constraints</li>
<li>Low-level data manipulation using register-based operations</li>
<li>Search and validation of IDs with custom string comparison</li>
<li>Record deletion with memory shift for efficiency</li>
<li>Display functions with calculated values</li>
</ul>
<br />

<h2>Data Structure Overview</h2>

<table>
  <thead>
    <tr>
      <th>Record Type</th><th>Max Entries</th><th>Record Size</th><th>Total Memory</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Badger</td><td>500</td><td>214 bytes</td><td>~107 KB</td></tr>
    <tr><td>Zookeeper</td><td>100</td><td>271 bytes</td><td>~27 KB</td></tr>
  </tbody>
</table>

<p><b>Memory is allocated in the `.bss` section and indexed manually by multiplying record size by entry index</b></p>

<h2>Technical Highlights</h2>

<ul>
<li>Static `.bss` arrays for all record storage</li>
<li>Pointer arithmetic for record navigation</li>
<li>Register-based loops for record display & deletion</li>
<li>Manual string handling, including null-terminated, custom copy & compare</li>
<li>Validation checks for IDs and constrained inputs</li>
<li>Deterministic memory usage</li>
</ul>

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
