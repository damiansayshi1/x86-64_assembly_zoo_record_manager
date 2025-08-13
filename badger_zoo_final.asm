%include "/home/malware/asm/joey_lib_io_v9_release.asm"  ;Here is the library for many of our function calls, such as call print_string_new
global main
section .data  ;This is initialised data

          
        ;Here below are the various strings that will be printed throughout this program. This is initialised data so it goes under the section .data
        ;Below are the strings that are used in the introduction of the program and the menu select
        string_enter_current_year: db "Hello and welcome to the Johny's Nocturnal Zoo!",10,"Please enter what year it currently is:",10,0
        string_main_intro: db "Please enter one of the corresponding numbers to access one of the following options in this menu:",10,10,0
        string_main_options: db "    1. Add a new member of staff to the system. ",10, "    2. Add a new badger to the system.",10,"    3. Delete a staff member from the system.",10,"    4. Delete a badger from the system.",10,"    5. Display all entered information, years of service and annual salary of all staff members in the system.",10,"    6. Display all entered information, age and stipiness of all badgers in the system.",10,"    7. Search for a staff member with an ID number and display their file contents.",10,"    8. Search for a badger with an ID number and display their file contents.",10,"    9. Exit the program.",10,0       
        string_invalid_input: db "Sorry, but this input is outside the accepted range (1-9). You will be prompted again",10,10,10,0
        
        ;Below strings that are used in functions 1 and 2 to add staff members and badgers
        string_add_staff_intro: db "You have chosen option 1: adding a new staff member to the system.",10,10,10, "Please enter the Surname first of staff being added.",10,0
        string_add_staff_firstname: db "Please enter the first name of the staff member being added.",10,0
        string_add_staff_id: db "Please enter the staff members ID. You will have to enter p followed by a 7 digit ID number.",10,"Your input will be validated to ensure it's got the correct format.",10,"Please enter the staff ID here: ",0
        string_add_staff_id_incorrect: db "Sorry but the input you have entered is not in the correct format. Please try again.",10,0 
        string_add_id_validated: db "Thank you, this is a valid ID number and it has been validated.",10,0
        string_add_staff_department: db "Please enter the corresponding number to the staff members department: ",10,10,"    1. Park Keeper.",10,"    2. Gift Shop",10,"    3. Cafe",10,0
        string_add_staff_department_incorrect_input: db "Sorry, but you have not entered a value between (1-3). You will be prompted to enter their corresponding department number again.",10,0
        string_add_staff_department1: db "This staff member currently works as a Park Keeper",10,0
        string_add_staff_department2: db "This staff member currently works in the Gift Shop",10,0
        string_add_staff_department3: db "This staff member currently works in the Cafe",10,0
        string_add_staff_start_sal: db "Please enter the staff members starting salary to the nearest whole pound.",10,0 
        string_add_staff_join_year: db "Please enter when the staff member joined.",10,0
        string_add_staff_email: db "Please enter the staff members email.",10,0
        string_add_badger_intro: db "You have chosen option 2: adding a new badger to the system.",10, "You will have to enter b followed by a 6 digit ID number.",10,"Your input will be validated to ensure it's got the correct format.",10,"Please enter the badger ID here: ",0
        string_add_badger_id_incorrect: db "Sorry but the input you have entered is not in the correct format. Please try again.",10,10,10,0       
        string_add_badger_name: db "Please enter the badgers name.",10,0
        string_add_badger_home_sett: db "Please enter the badgers home settlment by entering the corresponding digit below.",10,10,"    1. Settfield.",10,"    2. Badgerton.",10,"    3. Stripeville.",10,0
        string_home_sett_input_1: db "This badgers home settlement is inside Settfield",0
        string_home_sett_input_2: db "This badgers home settlement is inside Badgerton",0
        string_home_sett_input_3: db "This badgers home settlement is inside Stripeville",0
        string_add_badger_home_set_incorrect_input: db "I am sorry, but this input is invalid, and you have to enter a value between (1-3). Please try again.",10,10,0
        string_add_badger_mass: db "Please enter the badgers weight to the nearest kg (highest accepted value is 255kg).",10,0
        string_add_badger_stripes: db "Please enter the amount of stripes on the badger (0-255).",10,0
        string_add_badger_gender: db "Please enter the corresponding number to select the badgers gender (default will be set to female if not correct input is put in).",10,10,"    M for Male.",10,"    F for Female.",10,0
        string_add_badger_male: db "This badger was identified as a male, based on their records",0
        string_add_badger_female: db "This badger was identified as a female, based on their records",0
        string_add_badger_birth_month: db "Please enter the corresponding digit to select the month of the badgers birth.",10,10,"    1. January",10,"    2. February",10,"    3. March",10,"    4. April",10,"    5. May",10,"    6. June",10,"    7. July",10,"    8. August",10,"    9. September",10,"    10. October",10,"    11. November",10,"    12. December",10,0
        string_add_badger_birth_year: db "Please enter the year that the badger was born in.",10,0
        string_add_badger_zookeeper_id: db "Please enter a p followed by the 7 digit ID of the staff member assigned to this badger.",10,10,0
        
        ;Below are the strings that are used in function 3 and 4, to deleted staff members and badgers. Both use the same function with different passed parameters (location of first memory address of array, amount of records, length of an individual record)       
        string_delete_intro: db "You have chosen option 3: deleting a staff member from the system.",10,0
        string_delete_record_option: db "Please specify which staff record number you want to delete by entering its record number (eg second badger record on system corresponds to 2).",10,0
        string_delete_record_num_invalid: db "Sorry, but this record number has not been inputted into our system. You will be returned to the main menu.",10,10,10,0
        string_delete_record_success: db "This record has been successfully deleted from the system. You will be taken back to the main menu.",10,10,0
        
        ;Below is the section to use functions 5 and 6 to display information on the staff and badgers based on the entered inputs
        string_display_staff_intro: db "You have chosen option 5: display the entered information, as well as years of service and annual salary of all staff members in the system.",10,0       
        string_display_staff_record_number: db "This is the record for staff member number ",0
        string_display_staff_surname: db "This staff members surname is ",0
        string_display_staff_first_name: db "This staff members first name is ",0
        string_display_staff_id: db "This staff member has the ID number ",0
        string_display_staff_starting_sal: db "The starting salary for this staff member was £",0
        string_display_staff_years_start: db "This staff member started working in the year ",0
        string_display_staff_email: db "The entered email for this staff member is ",0                
        string_display_staff_years_service: db "Therefore, the number of years this staff member has served is ",0
        string_display_staff_annual_salary: db "The annual salary has been increased by £200 per year. Therefore, the after working for the amount of years specified above, this staff member will now be anually earning £",0 
        string_display_staff_finished_outtro: db "This is all the records we have. You will be taken back to the main menu now.",10,10,0
        string_display_staff_no_records: db "Sorry, but there are no current staff records in our system yet. You will be moved to main menu, where you can add a staff record if you want.",10,10,0
        string_display_badger_intro: db "You have chosen option 6: display all the entered information, as well as age and stipiness of all badgers in the system.",10,0
        string_display_badger_record_num: db "This is the record for badger record number ",0 
        string_display_badger_ID_num: db "This badgers ID number is ",0
        string_display_badger_name: db "This badgers name is ",0
        string_display_badger_mass: db "This badgers weight in kg is ",0
        string_display_badger_stripes: db "The number of stripes this badger has is ",0
        string_display_badger_month_birth: db "Here are the corresponding months to their numbers. Check the printed below to see which month is in the system as this badgers birthday",10,"    1. January",10,"    2. February",10,"    3. March",10,"    4. April",10,"    5. May",10,"    6. June",10,"    7. July",10,"    8. August",10,"    9. September",10,"    10. October",10,"    11. November",10,"    12. December",10, "This badger was born in the month number that corresponds to the decimal number above: ",0
        string_display_badger_year_birth: db "This badger was born in the year ",0
        string_display_badgers_staff_ID: db "This badgers assigned staff member ID is  ",0
        string_display_badger_current_month: db "Please enter the current month, this will be used to calculate the age of the badger later on in this program." ,10,10,"    1. January",10,"    2. February",10,"    3. March",10,"    4. April",10,"    5. May",10,"    6. June",10,"    7. July",10,"    8. August",10,"    9. September",10,"    10. October",10,"    11. November",10,"    12. December",10,0
        string_display_badger_age: db "The current age of this badger is ",0
        string_display_badger_stripiness: db "The Stripiness of the badger was calculated by multiplying the mass of it by the amount of stripes it has.",10,"The badger was calculated to have a stripiness level of ",0
        string_display_badger_no_records: db "Sorry, but there are no current badger records in our system yet. You will be moved to main menu, where you can add a staff record if you want.",10,10,0
        
        ;Below are the strings to display the functions 7 and 8, searching badgers and staff based on the ID numbers entered, as well as option 9, which jumps to a return statement and quits the program
        string_search_staff_intro: db "You have chosen option 7: search for a staff member with an ID number.",10,"Please enter the 7 digit ID of the staff member you want to search for",10,0
        string_search_staff_found_years: db "There is a staff member with the following ID number in our system.",10," Here is the amount of years the staff member has served this zoo: ",0
        string_search_staff_found_annual_salary: db "The annual salary has been increased by £200 per year. Therefore, the after working for the amount of years specified above, this staff member will now be anually earning £",0
        string_search_staff_missing: db "Sorry, but there is no staff member in this system with your entered ID number. You will be taken back to the menu prompt.",10,10,10,0       
        string_search_badger_intro: db "You have chosen option 8: search for a badger with an ID number.",10,"Please enter the 6 digit ID of the badger you want to search for",10,0
        string_search_badger_missing: db "Sorry, but there is no badger in this system with your entered ID number. You will be taken back to the menu prompt.",10,10,10,0
        string_search_badger_age: db "The current age of the badger is ",0
        string_search_badger_stripiness_level: db "The Stripiness of the badger was calculated by multiplying the mass of it by the amount of stripes it has.",10,"The badger was calculated to have a stripiness level of ",0
        string_exit_intro: db "You have chosen to exit.  Goodbye and have a great day!",10,0


        
section .bss  ;Here is the unitialised data, which we will put values into as the program runs and user enters inputs

        ;Below are the different amounts of unitialised data in bytes that will get allocated to storing the different user input sections for the staff record. With this, we can calculate and assign space of unitialized data. equ is a constant, so whenever we call that name, we will be inserting the int associated with it into the program
        Size_Badger_Id equ 8  ;1 char 6 nums and a null to make 8 bytes
        Size_Badger_Name equ 64   ;this stuff is all explained in my report. Please refer to it if you want
        Size_Badger_Home equ 64   ;long string as user input may be long
        Size_Badger_Mass equ 1    ;badger wont be heavier than 255 kg
        Size_Badger_stripes equ 1       ;255 stripes means 1 uint byte
        Size_Badger_Gender equ 64         ;long string as user input may be long    
        Size_Badger_Month_Birth equ 1    ;12 months fit in 1 byte    
        Size_Badger_Year_Birth equ 2     ;2000s is fittable in 2 bytes 
        Size_Badger_Zookeeper_Id equ 9  ;with the null terminator         
        
        ;Below we are adding various individual input sections to create the size of an individual record, and then the size of the entire memory array
        Size_Whole_Badger_Record equ Size_Badger_Zookeeper_Id + Size_Badger_Year_Birth + Size_Badger_Month_Birth + Size_Badger_Mass + Size_Badger_stripes + Size_Badger_Gender + Size_Badger_Home + Size_Badger_Name + Size_Badger_Id
        Max_Num_Badger equ 500  ;Max number of badgers that we will support being recorded
        Memory_Total_Badger equ Max_Num_Badger*Size_Whole_Badger_Record
        Badger_Array: resb Memory_Total_Badger  ;This is the total array size
        
        ;Below are the different amounts of unitialised data in bytes that will get allocated to storing the different user input sections. With this, we can calculate and assign space of unitialized data. equ is a constant, so whenever we call that name, we will be inserting the int associated with it into the program
        Size_Zookeeper_Surname equ 64    ;long string as user input may be long
        Size_Zookeeper_Firstname equ 64     ;long string as user input may be long
        Size_Zookeeper_ID equ 9  ;With the null terminator, 7 digits and 1 char at front    
        Size_Zookeeper_Department equ 64   ;long string as user input may be long
        Size_Zookeeper_Start_Sal equ 4   ; 4 bytes to handle salaries up to ~4 billion
        Size_Zookeeper_Start_Year equ 2      ;2000s is fittable in 2 bytes          
        Size_Zookeeper_Email equ 64   ;long string for email
        
        ;Below we are adding various individual input sections to create the size of an individual record, and then the size of the entire memory array                                
        Size_Whole_Zookeeper_Record equ Size_Zookeeper_Email + Size_Zookeeper_Start_Year + Size_Zookeeper_Start_Sal + Size_Zookeeper_Department + Size_Zookeeper_ID + Size_Zookeeper_Firstname + Size_Zookeeper_Surname
        Max_Num_Zookeeper equ 100
        Memory_Total_Zookeeper equ Max_Num_Zookeeper*Size_Whole_Zookeeper_Record
        Zookeeper_Array: resb Memory_Total_Zookeeper

        ;Some unitialised memory arrays, that we will allocate memory to during the programs execution.  
        Current_Year: resw 1  ;User will input current year
        Current_Month: resb 1  ;User input the current month        
        
        ;In these memory address, we will write down how many records the user has decided to add
        Num_badger_record_iterations: resq 1  ;The reason I made this 8 bytes long is because I will be moving this value into registers a lot, almost in every function, so using 8 bytes means that it will be formatted correctly for the register
        Num_staff_record_iterations: resq 1        
        
                  
section .text  ;This is the actual part of the code that has instructions on it. It can call data from above where needed
        
                                          
          
    Add_Staff:  ;Below is the first function (1), which is used to add staff members to the program 
        mov rax, QWORD [Num_staff_record_iterations]  ;Here, we are moving the value held at [Num_staff_record_iterations], which will initialised to 0 at the top of main, and increment it by 1 each time to increase the record holder
        inc rax
        mov QWORD [Num_staff_record_iterations], rax  ;after increasing rax by 1, we move it back into the memory address (so it will go from 0 to 1)
        mov r8, rax  ;now we move the numer of staff iterations into rax, it will be needed to write to the correct address in the massive array
        dec r8   ;Its important to decrement r8, as this record is 0 indexed, whereas humans use 1 index. For 1st record will be stored at memory address 0, this compensates for this
        mov rdx, Size_Whole_Zookeeper_Record  ;have the size of 1 indivudual record, we will increment the records by this amount       
        imul r8, rdx  ;multiply record index by record size to figure out the total offset to write our new record in (first record will have a 0 offset, so it will be multiplied by 0 here)
        lea r9, [Zookeeper_Array]  ;load first address into r9
        add r9, r8  ;add offset calculated 2 lines above to the first address in the memory
        
        ;Here is the introduction to this menu option chosen, and we will ask for the first staff user input, which will be the staffs Surname
        mov rdi, string_add_staff_intro  ;asking to input a value
        call print_string_new
        call read_string_new  ;read value, which will be in rax now
        mov rsi, rax  
        mov rdi, r9
        call copy_string  ;this function copies the contents from rsi to rdi. In this case, rsi has user input and rdi contains the address we are copying to
        
        ;Here is the add first name to this menu option chosen, and we will ask for the staff user input, which will be the staff members first name
        add r9,Size_Zookeeper_Surname  ;Here, we are incrementing the pointer (r9) of the memory block we are writing to by the total size of that unitialised data memory block we just wrote to (we used equ for this)
        mov rdi, string_add_staff_firstname  ;asking to input a value
        call print_string_new
        call read_string_new  ;read value, which will be in rax now
        mov rsi, rax
        mov rdi, r9
        call copy_string    ;this function copies the contents from rsi to rdi. In this case, rsi has user input and rdi contains the address we are copying to
        
        add r9, Size_Zookeeper_Firstname   ;Here, we are incrementing the pointer (r9) of the memory block we are writing to by the total size of that unitialised data memory block we just wrote to (we used equ for this)
    .loop_for_checking_staff_correct_input_char:      
        mov rdi, string_add_staff_id
        call print_string_new
        call read_string_new
        mov rsi, rax  ;Here, we will validate that the user ID is correct. Move user input into rsi and r14, and make rcx 0
        mov r14, rax 
        xor rcx, rcx       
    .check_staff_id_length:  ;first part of validation is ensuring the string is 8 in length (1 char and 7 int)
        cmp BYTE[r14+rcx], 0  ;0 in this instance is the null terminator
        je .check_staff_id_length_complete  ;basically we are incrementing the byte being compared in the r14 register by 1 until we hit the null, then we jump outside
        inc rcx
        jmp .check_staff_id_length
        
    .check_staff_id_length_complete:
        cmp rcx, 8  ;Now we check if the total amount of incrementations to reach null is 8 (1 char and 7 int). If it is not this value, length is wrong and we ask user to try again
        jne .incorrect_staff_id_input_char
               
                 
        mov al, BYTE [rsi]    ;if the length is correct, next we check if the individual characters entered are correct. 
        cmp al, 'p'  ;this is comparing a byte to ascii p, if it is not p, this id is invalid
        jne .incorrect_staff_id_input_char ;jump if not equal
        mov rcx, 6  ;this is the number of iterations we will decrement in the loop to compare of entered chars are in correct ascii num range (so will execute 7 times)
     .staff_input_num_loop:
        inc rsi  ;move to the next byte
        mov al, BYTE [rsi]  ;move byte into 8 bit register
        cmp rcx, 0  ;check if loop has been ran enough times
        je .success_staff_id_validation  ;if we reach here, everything is good
        cmp al, '9'  ;this is comparing a byte to ascii 9, jump if greater, where we are looking for nums
        jg .incorrect_staff_id_input_char
        cmp al, '0' 
        jl .incorrect_staff_id_input_char  
        dec rcx  ;decrement counter, will exit when 0
        jmp .staff_input_num_loop
        
    .incorrect_staff_id_input_char:
        call print_nl_new
        call print_nl_new
        mov rdi, string_add_staff_id_incorrect  ;explain that input is invalid. Restart the id collection
        call print_string_new
        jmp .loop_for_checking_staff_correct_input_char 
        
    .success_staff_id_validation:
        mov rdi, string_add_id_validated  ;ID is good, we will now copy the string using exactly the same steps as above (go above to see them)
        call print_string_new       
        mov rax, r14
        mov rsi, rax
        mov rdi, r9
        call copy_string   ;used to copy string to memory
        
        add r9, Size_Zookeeper_ID
     .department_loop:
        mov rdi, string_add_staff_department
        call print_string_new
        call read_uint_new

        cmp al, 1  ;we will put the department they work in by using their numeric input to enter a memory address of a string, stating their department
        je .department_input_1
        cmp al, 2
        je .department_input_2
        cmp al, 3
        je .department_input_3         
        mov rdi, string_add_staff_department_incorrect_input  ;validation to make sure a correct num is entered
        call print_string_new
        call print_nl_new
        jmp .department_loop  ;if incorrect, repeat this loop until correct input is entered
        
     .department_input_1:
        mov rsi, string_add_staff_department1   ;each of these options will write a different string to memory, which will be read out to the user if they request it
        jmp .copy_department_string
        
     .department_input_2:
        mov rsi, string_add_staff_department2       
        jmp .copy_department_string
        
    .department_input_3:
        mov rsi, string_add_staff_department3      
        jmp .copy_department_string
        
     .copy_department_string:   ;each of the 3 sections will jump here
        mov rdi, r9
        call copy_string        
                       
    .starting_salary_section:
        add r9, Size_Zookeeper_Department
        mov rdi, string_add_staff_start_sal 
        call print_string_new
        call read_uint_new
        mov DWORD [r9], eax  ;as salary is pretty big, we are using 4 bytes, which can give a max salary of 4.294 billion. This is probably succifient for an annual salary
        
        add r9, Size_Zookeeper_Start_Sal
        mov rdi, string_add_staff_join_year
        call print_string_new
        call read_uint_new
        mov WORD [r9], ax  ;we use 2 bytes for year, as max value is around 65000, which is succifient
        
        add r9, Size_Zookeeper_Start_Year
        mov rdi, string_add_staff_email        
        call print_string_new
        call read_string_new
        mov rsi, rax
        mov rdi, r9
        call copy_string  ;same as above, rsi is being copied into rdi, so input being copied into the location pointed to at r9 (memory array)                                             
        ret    
        
    Add_Badger:   ;Below is the first function (2), which is used to add badgers to the program 
        mov rax, QWORD [Num_badger_record_iterations]   ;Here, we are moving the value held at [Num_staff_badger_iterations], which will initialised to 0 at the top of main, and increment it by 1 each time to increase the record holder
        inc rax
        mov QWORD [Num_badger_record_iterations],rax  ;after increasing rax by 1, we move it back into the memory address (so it will go from 0 to 1)
        mov r8, rax  ;now we move the numer of staff iterations into rax, it will be needed to write to the correct address in the massive array
        dec r8    ;Its important to decrement r8, as this record is 0 indexed, whereas humans use 1 index. For 1st record will be stored at memory address 0, this compensates for this
        mov rdx, Size_Whole_Badger_Record      ;have the size of 1 indivudual record, we will increment the records by this amount     
        imul r8, rdx      ;multiply record index by record size to figure out the total offset to write our new record in (first record will have a 0 offset, so it will be multiplied by 0 here)
        lea r9, [Badger_Array]   ;load first address into r9
        add r9, r8         ;add offset calculated 2 lines above to the first address in the memory
        call print_nl_new
        
     .loop_for_checking_badger_correct_input_char:      
        mov rdi, string_add_badger_intro
        call print_string_new
        call read_string_new
        mov rsi, rax
        mov r14, rax            
        xor rcx, rcx   ;counter for loop
              
     .check_badger_id_length:  ;first part of validation is ensuring the string is 7 in length (1 char and 6 int)
        cmp BYTE[r14+rcx], 0   ;0 in this instance is the null terminator
        je .check_badger_id_length_complete   ;basically we are incrementing the byte being compared in the r14 register by 1 until we hit the null, then we jump outside
        inc rcx   
        jmp .check_badger_id_length 
        
    .check_badger_id_length_complete:
        cmp rcx, 7    ;Now we check if the total amount of incrementations to reach null is 7 (1 char and 6 int). If it is not this value, length is wrong and we ask user to try again
        jne .incorrect_badger_id_input_char  
              
        mov al, BYTE [rsi]  ;if the length is correct, next we check if the individual characters entered are correct. 
        cmp al, 'b'  ;this is comparing a byte to ascii b, if it is not b, this id is invalid 
        jne .incorrect_badger_id_input_char ;jump if not equal to b
        mov rcx, 5   ;this is the number of iterations we will decrement in the loop to compare of entered chars are in correct ascii num range (so will execute 6 times)
    .badger_input_num_loop:
        inc rsi  ;move to the next byte
        mov al, BYTE [rsi]  ;move byte into 8 bit register
        cmp rcx, 0  ;check if loop has been ran enough times
        je .success_badger_id_validation  ;if we reach here, everything is good
        cmp al, '9'  ;this is comparing a byte to ascii 9, jump if greater, where we are looking for nums
        jg .incorrect_badger_id_input_char
        cmp al, '0' 
        jl .incorrect_badger_id_input_char
        dec rcx
        jmp .badger_input_num_loop
        
     .incorrect_badger_id_input_char:
        call print_nl_new
        call print_nl_new
        mov rdi, string_add_badger_id_incorrect   ;explain that input is invalid. Restart the id collection
        call print_string_new
        jmp .loop_for_checking_badger_correct_input_char 
        
     .success_badger_id_validation:
        mov rdi, string_add_id_validated   ;ID is good, we will now copy the string using exactly the same steps as above (go above to see them)
        call print_string_new       
        mov rax, r14
        mov rsi, rax
        mov rdi, r9
        call copy_string   ;same as above, value of rsi goes to rdi
               
        add r9, Size_Badger_Id   ;Here, we are incrementing the pointer (r9) of the memory block we are writing to by the total size of that unitialised data memory block we just wrote to (we used equ for this) 
        mov rdi, string_add_badger_name
        call print_string_new
        call read_string_new
        mov rsi, rax
        mov rdi, r9
        call copy_string                     
        add r9, Size_Badger_Name
         
     .home_sett_loop:
        mov rdi, string_add_badger_home_sett
        call print_string_new
        call read_uint_new

        cmp al, 1  ;we will put the department they work in by using their numeric input to enter a memory address of a string, stating their department
        je .home_sett_input_1
        cmp al, 2
        je .home_sett_input_2
        cmp al, 3
        je .home_sett_input_3         
        mov rdi, string_add_badger_home_set_incorrect_input  ;validation to make sure a correct num is entered
        call print_string_new
        call print_nl_new
        jmp .home_sett_loop  ;if incorrect, repeat this loop until correct input is entered
        
     .home_sett_input_1:     ;each of these options will print a different string into the memory
        mov rsi, string_home_sett_input_1
        jmp .copy_home_sett_string
        
    .home_sett_input_2:
        mov rsi, string_home_sett_input_2    
        jmp .copy_home_sett_string
        
    .home_sett_input_3:
        mov rsi, string_home_sett_input_3     
        jmp .copy_home_sett_string
        
    .copy_home_sett_string:
        mov rdi, r9
        call copy_string        
             
     .starting_badger_mass:
        add r9, Size_Badger_Home
        mov rdi, string_add_badger_mass
        call print_string_new
        call read_uint_new
        mov BYTE [r9], al  ;1 byte is needed, as badgers are not above 255 kg~ in general
        
        add r9, Size_Badger_stripes
        mov rdi, string_add_badger_stripes
        call print_string_new
        call read_uint_new
        mov BYTE [r9], al  ;stripes limited to 255 unsigned, so 1 byte is sufficient
        
        add r9, Size_Badger_stripes
        mov rdi, string_add_badger_gender
        call print_string_new
        call read_string_new
        cmp BYTE [rax], 'm';if unput is m, OR M, I will enter 0 as a flag to indicate this. 
        je .badger_male
        cmp BYTE [rax], 'M';this will also check if the user entered an uppercase M
        je .badger_male         
        jmp .badger_female  ;if no m/M is entered, we will default to a female badger
        
    .badger_male:
        mov rdi, r9
        mov rsi, string_add_badger_male   ;same as above, copying a prewritten string into memory that can be called upon
        call copy_string      
        jmp .badger_gender_valid
     .badger_female:        
        mov rdi, r9
        mov rsi, string_add_badger_female
        call copy_string
        jmp .badger_gender_valid
        
     .badger_gender_valid:  
        add r9, Size_Badger_Gender
        mov rdi, string_add_badger_birth_month
        call print_string_new
        call read_uint_new
        mov BYTE [r9], al  ; byte is enough, since there are 12 months
        
        add r9, Size_Badger_Month_Birth
        mov rdi, string_add_badger_birth_year
        call print_string_new
        call read_uint_new
        mov WORD [r9], ax  ;using 2 bytes, as year will be in the 2000s
        
        add r9, Size_Badger_Year_Birth
        mov rdi, string_add_badger_zookeeper_id
        call print_string_new
        call read_string_new               
        mov rsi, rax
        mov rdi, r9
        call copy_string         
        ret
        
    Delete_Record:   ;works for both function 3 and 4. Address locations and other needed variables passed as parameters here   
        mov rdi, string_delete_record_option  ;we ask the user what the record number they want to delete is
        call print_string_new
        call read_int_new  ;this is the users input
        mov rcx, rax  ;Inside rcx, we will have the amount of times that we shift through the memory arrays, aka users input
        mov r15, rcx  ;Also storing user input inside the r15 register, so we can use it later on when figuring out how much to left shift
        ;mov rdx, QWORD [Num_staff_record_iterations]  ;this is the total amount of records that the user has put in for the staff
        cmp r15, r11  ;Here is a validation check to see that user does not enter a record number higher than how many records they wrote in this program, as otherwise it would not work. Will have an else statement. R11 contains QWORD [Num_record_iterations]
        jg .invalid_delete_record_number
        cmp r15, 0  ;here is OR logic. If user entered record number 0 or a negative number, they will also be prompted out
        jle .invalid_delete_record_number
        sub rcx, 1  ;Since our records are starting at record number 0, and for us humans this would correspond to 1. So if human wants to delete first record, this would correspond to code number 0
       ; lea r9, [Zookeeper_Array]  ;We are loading the first effective address of the zookeeper_array into r9 register
        mov r12, r9  ;Here we are backing up the value held inside of r9 (start address of array), as we will need it later on as well
     .loop_to_find_and_delete_record:
        cmp rcx, 0  ;comparing what address of the record we need to find. Once we find it, rcx will be 0
        jle .found_record_to_delete  ;once is met, we will have the correct address in r9 for the record to be deleted
        add r12, r10  ;adding the size of each record for each iteration, basically increasing the record number by 1
        dec rcx  ;Here we decrement rcx because each decrementation is 1 record closer to record that needs to be deleted, as we add the length of a record to the pointer
        jmp .loop_to_find_and_delete_record  ;keep looping until rcx is 0
        
        
     .found_record_to_delete:
        cmp r11, r15  ;comparing the record that user entered to the amount of total records of staff entered. If its the same, we dont have to do a left shift, and can just delete it, as its easier
        je .no_shift_needed  ;this means record delete request is the last record in the array
        jmp .shift_needed
        
     .no_shift_needed:
        mov rax, QWORD r11  ;Here, we dont even need to delete the record, as it is the last one, we just decrement the unitialised array by one, so whenever we are calling or printing a record, it will not be shown or included again. This will get overwritten if we add another record
        dec rax
        mov QWORD r11, rax
                       
        mov rdi, string_delete_record_success
        call print_string_new
        jmp .exit_delete_record
        
    .shift_needed:
        mov rcx, r11
        sub rcx, r15  ;take away what record num user wants to delete from the total amount of records
        imul rcx, r10  ;mutiply rcx by size of 1 record. This way, rep will know how many bytes to move        
        lea rsi, [r9+r10]  ;loading the beginning address of the record we want to delete and whole size of a single record into rsi, which will be the next record in the array. This is the source 
        mov rdi, r9  ;load address of beginning of record to be deleted into rdi, which is the destination, so basically the adjacent record will be copied into its spot, alongside all records further up as well
     .loop_for_shifting_record:
        mov al, [rsi]  ;moves individual byte from 
        mov [rdi], al
        inc rsi
        inc rdi
        loop .loop_for_shifting_record
        mov rax, r11  ;since we left shifted by the whole size of a record array, now we will decrease the number of staff records by 1 
        dec rax
        mov r11, rax
        mov rdi, string_delete_record_success  ;feedback for successful deletion
        call print_string_new
        jmp .exit_delete_record
        
     .invalid_delete_record_number:  ;local label to explain that the record could not be located, due to not being a correct number iteration
        mov rdi, string_delete_record_num_invalid
        call print_string_new
        jmp .exit_delete_record  ;will just go back to main menu
           
    .exit_delete_record:
        ret  ;will just go back to main menu
                   
    Display_Staff:     ;Here is the function to display the staff information, on the years they worked there and the amount of salary increase they should get for their time
        mov rcx, QWORD [Num_staff_record_iterations]  ;Here, we load the amount of total staff inputs that the user entered into the rcx, which will serve as a counter and ensure we go through all the records in the allocated memory array
        cmp rcx, 0
        je .no_staff_records_to_display
        xor r11, r11  ;r11 will be used for 2 purposes, to print what record number is being printed, and to multiply length of an individual staff record by how many records the user entered in a loop, so each time we print a new record, we iterate to the next record in the memory array
        lea r9, [Zookeeper_Array]  ;First memory address of the array will get loaded into r9, and we will increment this to access whatever data we want
        mov rdi, string_display_staff_intro  ;explain what option this is and what it will perform
        call print_string_new    
     .display_loop:  ;start of loop that will go through every user entered record
        cmp rcx, 0  ;we will compare if we have iterated the loop the same amount of times as the user entered individual staff records
        je .finished_display_loop_completly  ;exit this function once all records entered have been printed
        lea r9, [Zookeeper_Array]  ;First memory address of the array will get loaded into r9, and we will increment this to access whatever data we want
        call print_nl_new
        call print_nl_new           

        inc r11  ;we temporarily increment this value, so it will print the correct iteration for humans (record 0 in array needs to be shows as record 1 to a human using program)
        mov rdi, string_display_staff_id
        call print_string_new
        mov rdi, r11  ;print the record number (eg will print record 1 for the values stored at memory address 0)
        call print_int_new
        call print_nl_new
        mov rdi, string_display_staff_surname
        call print_string_new
        
        mov rdx, Size_Whole_Zookeeper_Record  ;This is the total size of 1 complete record
        dec r11  ;Since we are starting with record 0, we will dec r11 to 0 to be correctly readable for machine memory address       
        imul rdx, r11  ;we multiply the size of 1 record by the iterations (starting with 0), so the machine knows how many memory addresses to add to the pointer of the first memory address to get to the correct corresponding memory location
        ;sub rdx, Size_Whole_Zookeeper_Record
        ;lea r10, [r9]  ;we load address r9 is pointing to to r10, so r9 will only be used for pointing to the begging of the whole memory array, and r10 will point to the exact memory address we want to access
        add r9, rdx
        ;add r10, r14  ;now r10 has the correct memory address of the starting year for the corresponding record number        
        
        lea rdi, [r9]
        call print_string_new
        call print_nl_new 
        
        add r9, Size_Zookeeper_Surname
        mov rdi, string_display_staff_first_name
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new
        
        add r9, Size_Zookeeper_Firstname
        mov rdi, string_display_staff_id
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new        
        
        add r9, Size_Zookeeper_ID        
        lea rdi, [r9]
        call print_string_new  
        
        add r9, Size_Zookeeper_Department       
        mov rdi, string_display_staff_starting_sal
        call print_string_new
        movsx r12, DWORD [r9]   ;we will use r12 later on to calculate how many years the staff member has worked at the zoo                  
        movsx rdi, DWORD [r9]
        call print_uint_new
        call print_nl_new      
        
        add r9, Size_Zookeeper_Start_Sal       
        mov rdi, string_display_staff_years_start 
        call print_string_new
        movzx r13, WORD [r9]   ;we will use r13 later on to calculate how many years the staff member has worked at the zoo          
        movzx rdi, WORD [r9]
        call print_uint_new
        call print_nl_new      
               
        add r9, Size_Zookeeper_Start_Year          
        mov rdi, string_display_staff_email
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new                                   
                                     
        mov rdi, string_display_staff_years_service  ;introduction string to total amount of years the staff member has worked
        call print_string_new
        movzx rdi, WORD [Current_Year]  ;This is the current year that the user entered at the beginning of the program         
        sub rdi, r13  ;Here, we subtract the current year from the year the staff joined. This gives us the amount of years that they have worked at the zoo 
        mov r15, rdi  ;Here I am storing the value of rdi, which is years worked. I am storing it in a seperate register so that I can use the value to calculate the salary increase below
        call print_uint_new  ;Printing the years worked at the zoo
        call print_nl_new
                  
        mov rdi, string_display_staff_annual_salary  ;intro to the salary increase over the years
        call print_string_new      
        ;movsx r12, DWORD [r10]  ;[R10] will store the value of the base salary,  so r11 will contain the value itself as we dereferenced it
     .loop_for_salary_increase:
        cmp r15, 0  ;Compare how many more iterations we have based on how many years the staff worked. Once we hit the years we worked, we will exit
        je .finished_display_loop_iteration
        add r12, 200  ;add 200 to the base salary for every yearly iteration here
        dec r15
        jmp .loop_for_salary_increase  ;repeat. Once we iterate the amount of years the staff worked, we will exit at the top of the loop
             
    .finished_display_loop_iteration:
        mov rdi, r12
        call print_int_new
        call print_nl_new
        ;inc r11  ;We increment r11, so the counter increases by 1, and we increase the record being pointed to, as well as printing for the user
        dec rcx ;decrement the rcx counter until it is 0. We will repeat this step until all the records entered for staff have been printed
        inc r11
        jmp .display_loop
        
     .finished_display_loop_completly:  ;here, we completly finished the display loop, and will return to main
        mov rdi, string_display_staff_finished_outtro
        call print_string_new
        ret
        
     .no_staff_records_to_display:
        mov rdi, string_display_staff_no_records
        call print_string_new
        ret        
        
        
    Display_Badger:
        mov rcx, QWORD [Num_badger_record_iterations] ;Here, we load the amount of total staff inputs that the user entered into the rcx, which will serve as a counter and ensure we go through all the records in the allocated memory array
        cmp rcx, 0
        je .no_badger_records_exit_to_main
        xor r11, r11  ;r11 will be used for 2 purposes, to print what record number is being printed, and to multiply length of an individual staff record by how many records the user entered in a loop, so each time we print a new record, we iterate to the next record in the memory array             
        mov rdi, string_display_badger_intro  ;explain what option this is and what it will perform
        call print_string_new                   
     .display_loop_badger:  ;start of loop that will go through every user entered record
        movzx r8, WORD [Current_Year] 
        lea r9, [Badger_Array]  ;First memory address of the array will get loaded into r9, and we will increment this to access whatever data we want                    
        cmp rcx, 0  ;we will compare if we have iterated the loop the same amount of times as the user entered individual staff records
        je .finished_display_loop_completly_badger  ;exit this function once all records entered have been printed
        mov rdx, Size_Whole_Badger_Record  ;This is the total size of 1 complete record
        imul rdx, r11  ;we multiply the size of 1 record by the iterations (starting with 0), so the machine knows how many memory addresses to add to the pointer of the first memory address to get to the correct corresponding memory location    
        inc r11
        mov rdi, string_display_badger_record_num
        call print_string_new
        mov rdi, r11  ;print the record number (eg will print record 1 for the values stored at memory address 0)
        call print_int_new
        call print_nl_new          
  
        add r9, rdx   ;here we are just iterating though the records, moving an intro to what value is being printed, loading value into rdi, printing it, printing new line and moving to new memory thing
        mov rdi, string_display_badger_ID_num
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new 
        
        add r9, Size_Badger_Id
        mov rdi, string_display_badger_name
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new        
                                                                  
        add r9, Size_Badger_Name
        lea rdi, [r9]
        call print_string_new
        call print_nl_new      
                                                                                  
        add r9, Size_Badger_Home
        mov rdi, string_display_badger_mass
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new                                                                                                                                                    
        movzx r12, BYTE [r9]                                                                                                                                                                                                                  
       
         add r9, Size_Badger_Mass
        mov rdi, string_display_badger_stripes
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new 
        movzx r10, BYTE [r9]                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                                                                       
        add r9, Size_Badger_stripes
        lea rdi, [r9]
        call print_string_new
        call print_nl_new   
        
        add r9, Size_Badger_Gender
        mov rdi, string_display_badger_month_birth
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new   
        movzx r13, BYTE [r9]  ;Here, we move the value of the month of the Badgers birth into r13. The month is represented by a decimal int                                                                                                                      
        mov r14, [Current_Month]  ;current year, will be user in the calculation of badger age                                                                                                                                                                                                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        add r9, Size_Badger_Month_Birth
        mov rdi, string_display_badger_year_birth
        call print_string_new
        movzx rdi, WORD [r9]
        call print_uint_new
        call print_nl_new    
        movzx r15, WORD [r9]  ;Here will be the value of the year entered for badgers birth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

        add r9, Size_Badger_Year_Birth
        mov rdi, string_display_badgers_staff_ID
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new         
        cmp r14, r13   ;using equation to determine years alive, as outline in ruberic
        jge .current_month_greater_equal1                                                                                                                                                
        jmp .current_month_less2                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                          
     .current_month_greater_equal1:                                                                                                                                                                                                                                                                                                       
        sub r8, r15  ;here we are performing the current year (r8) - year of badger birth (r15). Age will be stored in r8
        jmp .print_badger_age1
                                                                                                                                                                                                                                                                                                                                               
     .current_month_less2:                                                                                                                                                                                                                                                                                                                                                                                                                        
        sub r8, r15                                                    
        sub r8, 1  ;same as above, but we take 1 more away, as shown in the ruberic                                                                           
        jmp .print_badger_age1                
                                
     .print_badger_age1:
        mov rdi, string_display_badger_age
        call print_string_new
        mov rdi, r8
        call print_uint_new
        call print_nl_new
        mov rdi, string_display_badger_stripiness
        call print_string_new        
        imul r10, r12
        mov rdi, r10
        call print_uint_new
        call print_nl_new
        call print_nl_new
                                                                                             
    .finished_display_loop_iteration:
        dec rcx ;decrement the rcx counter until it is 0. We will repeat this step until all the records entered for staff have been printed
        call print_nl_new
        jmp .display_loop_badger
    
    .no_badger_records_exit_to_main:
    mov rbp, rsp; for correct debugging
        mov rdi, string_display_badger_no_records
        call print_string_new
        call print_nl_new
        ret
    
    .finished_display_loop_completly_badger:  
         ret                                            
 
        
    Compare_Strings_Function:   
       .comparison_loop:
        mov al, BYTE [rsi]  ;moving bytes from rsi and rdi, which are conserved between function calls
        mov bl, BYTE [rdi]
        cmp al, bl    ;comparing if same value
        jne .strings_not_equal   ;if not same value, we will exit the program
        cmp al, 0   ;if null reached and we had no problems, we will escape successfully
        je .strings_equal
        inc rdi    ;incrementing the char that rsi and rdi are pointing at
        inc rsi
        jmp .comparison_loop
          
    .strings_not_equal:
        mov rax, 1
        ret
    .strings_equal:  
        mov rax, 0
        ret
                                                                                              
        
    Lookup_Staff:
        xor r15, r15  ;This will be the counter for the iterations
        mov r11, 1 ;used to print records for humans
        mov rcx, QWORD [Num_staff_record_iterations]  ;Here, we load the amount of total staff inputs that the user entered into the rcx, which will serve as a counter and ensure we go through all the records in the allocated memory array   
        cmp rcx, 0
        je .no_staff_records_to_display
        
        mov rdi, string_search_staff_intro  ;intro into looking up staff members
        call print_string_new
        call read_string_new  ;Take user input
        mov rbx, rax  ;here, the ID of the staff entered by the user is stored in rbx
    .loop_for_staff_id_iteration:
        cmp rcx, 0
        je .no_staff_records_to_display  ;loop until rcx is 0    
        mov rdx, Size_Whole_Zookeeper_Record ; Size_Whole_Zookeeper_Record
        imul rdx, r15  ;we multiply the size of 1 record by the iterations (starting with 0), so the machine knows how many memory addresses to add to the pointer of the first memory address to get to the correct corresponding memory location
        lea r9, [Zookeeper_Array]  ;loading the starting memory address of the array containing all staff information into into r9                   
        lea r12, [r9+rdx+Size_Zookeeper_Surname+Size_Zookeeper_Firstname]  ;move r9 into r12, which will be a dedicated register for moving to different memory addresses in the array. keep r9 as a kind of base pointer to the first address of array
        mov rdi, r12  ;moving the value held at mem address pointed to by r12 into r13       
        mov rsi, rbx        
        call Compare_Strings_Function
        cmp rax, 0  ;comparing if the entered user input matched the ID number on the staffs ID section
        je .matching_record  ;will exit loop prematurely if condition is met
        inc r11
        inc r15
        dec rcx
        jmp .loop_for_staff_id_iteration
        mov rdi, string_search_staff_missing  ;if rcx is 0 and we still did not find the corresponding ID num, we will print a sorry message and exit out of this function to main menu again
        call print_string_new
        call print_nl_new
        jmp .finished_staff_lookup
        
    .matching_record:
        lea r9, [r9+rdx]  ;loading the starting memory address of the array containing all staff information into into r9
        call print_nl_new
        call print_nl_new           

        mov rdi, string_display_staff_id
        call print_string_new
        mov rdi, r11  ;print the record number (eg will print record 1 for the values stored at memory address 0)
        call print_int_new
        call print_nl_new
        mov rdi, string_display_staff_surname
        call print_string_new               
        
        lea rdi, [r9]   ;will print entrie record for this thing, one variable at a time
        call print_string_new
        call print_nl_new 
        
        add r9, Size_Zookeeper_Surname
        mov rdi, string_display_staff_first_name
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new
        
        add r9, Size_Zookeeper_Firstname
        mov rdi, string_display_staff_id
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new        
        
        add r9, Size_Zookeeper_ID        
        lea rdi, [r9]
        call print_string_new  
        
        add r9, Size_Zookeeper_Department       
        mov rdi, string_display_staff_starting_sal
        call print_string_new
        movsx r12, DWORD [r9]   ;we will use r12 later on to calculate how many years the staff member has worked at the zoo                  
        movsx rdi, DWORD [r9]
        call print_uint_new
        call print_nl_new      
        
        add r9, Size_Zookeeper_Start_Sal       
        mov rdi, string_display_staff_years_start 
        call print_string_new
        movzx r13, WORD [r9]   ;we will use r13 later on to calculate how many years the staff member has worked at the zoo          
        movzx rdi, WORD [r9]
        call print_uint_new
        call print_nl_new      
               
        add r9, Size_Zookeeper_Start_Year          
        mov rdi, string_display_staff_email
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new                                   
                                     
        mov rdi, string_display_staff_years_service  ;introduction string to total amount of years the staff member has worked
        call print_string_new
        movzx rdi, WORD [Current_Year]  ;This is the current year that the user entered at the beginning of the program         
        sub rdi, r13  ;Here, we subtract the current year from the year the staff joined. This gives us the amount of years that they have worked at the zoo 
        mov r15, rdi  ;Here I am storing the value of rdi, which is years worked. I am storing it in a seperate register so that I can use the value to calculate the salary increase below
        call print_uint_new  ;Printing the years worked at the zoo
        call print_nl_new
                  
        mov rdi, string_display_staff_annual_salary  ;intro to the salary increase over the years
        call print_string_new      
        ;movsx r12, DWORD [r10]  ;[R10] will store the value of the base salary,  so r11 will contain the value itself as we dereferenced it
    .loop_for_salary_increase:
        cmp r15, 0  ;Compare how many more iterations we have based on how many years the staff worked. Once we hit the years we worked, we will exit
        je .finished_display_loop_iteration
        add r12, 200  ;add 200 to the base salary for every yearly iteration here
        dec r15
        jmp .loop_for_salary_increase  ;repeat. Once we iterate the amount of years the staff worked, we will exit at the top of the loop
             
    .finished_display_loop_iteration:
        mov rdi, r12
        call print_int_new
        call print_nl_new

        ret
        
    .no_staff_records_to_display:
        mov rdi, string_display_staff_no_records
        call print_string_new
        ret        
        
    .finished_staff_lookup:  ;here, we completly finished the display loop, or not finding matching record, and will return to main       
        ret 
                
     Lookup_Badger:
        xor r15, r15  ;This will be the counter for the iterations
        mov r11, 1 ;used to print records for humans
        mov rcx, QWORD [Num_badger_record_iterations]  ;Here, we load the amount of total staff inputs that the user entered into the rcx, which will serve as a counter and ensure we go through all the records in the allocated memory array   
        cmp rcx, 0
        je .no_badger_records_to_display_search
        
        mov rdi, string_search_badger_intro  ;intro into looking up staff members
        call print_string_new
        call read_string_new  ;Take user input
        mov rbx, rax  ;here, the ID of the staff entered by the user is stored in rbx
    .loop_for_badger_id_iteration:
        cmp rcx, 0
        je .no_badger_records_to_display_search  ;loop until rcx is 0    
        mov rdx, Size_Whole_Badger_Record ; Size_Whole_Zookeeper_Record
        imul rdx, r15  ;we multiply the size of 1 record by the iterations (starting with 0), so the machine knows how many memory addresses to add to the pointer of the first memory address to get to the correct corresponding memory location
        lea r9, [Badger_Array]  ;loading the starting memory address of the array containing all staff information into into r9                   
        lea r12, [r9+rdx]  ;move r9 into r12, which will be a dedicated register for moving to different memory addresses in the array. keep r9 as a kind of base pointer to the first address of array
        mov rdi, r12  ;moving the value held at mem address pointed to by r12 into r13
        mov rsi, rbx
        call Compare_Strings_Function
        cmp rax, 0  ;comparing if the entered user input matched the ID number on the staffs ID section
        je .matching_record_badger  ;will exit loop prematurely if condition is met
        inc r11
        inc r15
        dec rcx
        jmp .loop_for_badger_id_iteration
        mov rdi, string_search_badger_missing  ;if rcx is 0 and we still did not find the corresponding ID num, we will print a sorry message and exit out of this function to main menu again
        call print_string_new
        call print_nl_new
        jmp .loop_for_badger_id_iteration
        
    .matching_record_badger:
        lea r9, [r9+rdx]  ;loading the starting memory address of the array containing all staff information into into r9
        call print_nl_new
        call print_nl_new   
        movzx r8, WORD [Current_Year]   ;for badger age        

        mov rdi, string_display_badger_record_num
        call print_string_new
        mov rdi, r11  ;print the record number (eg will print record 1 for the values stored at memory address 0)
        call print_int_new
        call print_nl_new          
  
        add r9, rdx
        mov rdi, string_display_badger_ID_num
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new 
        
        add r9, Size_Badger_Id
        mov rdi, string_display_badger_name
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new        
                                                                  
        add r9, Size_Badger_Name
        lea rdi, [r9]
        call print_string_new
        call print_nl_new      
                                                                                  
        add r9, Size_Badger_Home
        mov rdi, string_display_badger_mass
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new                                                                                                                                                    
        movzx r12, BYTE [r9]                                                                                                                                                                                                                  
       
         add r9, Size_Badger_Mass
        mov rdi, string_display_badger_stripes
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new 
        movzx r10, BYTE [r9]                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                                                                       
        add r9, Size_Badger_stripes
        lea rdi, [r9]
        call print_string_new
        call print_nl_new   
        
        add r9, Size_Badger_Gender
        mov rdi, string_display_badger_month_birth
        call print_string_new
        movzx rdi, BYTE [r9]
        call print_uint_new
        call print_nl_new   
        movzx r13, BYTE [r9]  ;Here, we move the value of the month of the Badgers birth into r13. The month is represented by a decimal int                                                                                                                      
        mov r14, [Current_Month]  ;current year, will be user in the calculation of badger age                                                                                                                                                                                                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        add r9, Size_Badger_Month_Birth
        mov rdi, string_display_badger_year_birth
        call print_string_new
        movzx rdi, WORD [r9]
        call print_uint_new
        call print_nl_new    
        movzx r15, WORD [r9]  ;Here will be the value of the year entered for badgers birth                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

        add r9, Size_Badger_Year_Birth
        mov rdi, string_display_badgers_staff_ID
        call print_string_new
        lea rdi, [r9]
        call print_string_new
        call print_nl_new         
        cmp r14, r13
        jge .current_month_greater_equal2                                                                                                                                                
        jmp .current_month_less3                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                                          
     .current_month_greater_equal2:                                                                                                                                                                                                                                                                                                       
        sub r8, r15  ;here we are performing the current year (r8) - year of badger birth (r15). Age will be stored in r8
        jmp .print_badger_age2
                                                                                                                                                                                                                                                                                                                                               
      .current_month_less3:                                                                                                                                                                                                                                                                                                                                                                                                                        
        sub r8, r15                                                    
        sub r8, 1  ;same as above, but we take 1 more away, as shown in the ruberic                                                                           
        jmp .print_badger_age2                
                                
     .print_badger_age2:
        mov rdi, string_display_badger_age
        call print_string_new
        mov rdi, r8
        call print_uint_new
        call print_nl_new
        mov rdi, string_display_badger_stripiness
        call print_string_new        
        imul r10, r12
        mov rdi, r10
        call print_uint_new
        call print_nl_new
        call print_nl_new
        jmp .finished_display_loop_completly_badger_search                                                                                     
    
    .no_badger_records_to_display_search:
        mov rdi, string_display_badger_no_records
        call print_string_new
        call print_nl_new
        ret
    
    .finished_display_loop_completly_badger_search:  
         ret    
                     
        
    Exit_Program:
        mov rdi, string_exit_intro
        call print_string_new                                                          
        ret       
    main: 
        mov rbp, rsp  ;setting up stack for the main function
        push rbp
        mov rbp, rsp
        sub rsp,32
            
        mov rdi, string_enter_current_year
        call print_string_new
        call read_uint_new  ;taking in the current year. We write this to memory, as it will be used by various functions throughout the program
        mov WORD [Current_Year], ax  ;2 bytes sufficient
        mov QWORD [Num_badger_record_iterations],0  ;setting current record iterations to 0. We will be incrementing this throughout the program
        mov QWORD [Num_staff_record_iterations],0 
        mov rdi, string_display_badger_current_month  ;also, we will take in the current month. This is used for calculating badger age in 2 functions (search and display)
        call print_string_new
        call read_uint_new
        mov BYTE [Current_Month], al   ;moving month to memory address as 1 byte        
    .menu_options_loop:
        ;.menu_loop:       
        mov rdi, string_main_intro  ;we introduce the users to the menus options 
        call print_string_new
        mov rdi, string_main_options
        call print_string_new
        call read_int_new      
        mov r8, rax ;we will temporarily store the user input into register R8, and compare it to a number of conditions
        cmp r8, 1
        je .call_function_1    ;comparing user input to here, we will go to different function calls depending on what number corresponds to the below options   
        cmp r8, 2 
        je .call_function_2  
        cmp r8, 3 
        je .call_function_3               
        cmp r8, 4 
        je .call_function_4               
        cmp r8, 5 
        je .call_function_5             
        cmp r8, 6
        je .call_function_6                 
        cmp r8, 7 
        je .call_function_7                
        cmp r8, 8
        je .call_function_8         
        cmp r8, 9
        je .exit_program  ;Here, we are jumping instead of calling like with the other options above. This is because since its still part of the same function and we don't add a return address onto the stack, so when we ret from this option, it exits the program         
        mov rdi, string_invalid_input
        call print_string_new     
        jmp .menu_options_loop
        
        ;Below, we can call the different functions, depending on what the user wants to do.
     .call_function_1:
        call Add_Staff
        jmp .menu_options_loop

     .call_function_2:
        call Add_Badger
        jmp .menu_options_loop
        
     .call_function_3:  
        mov rdi, string_delete_intro  ;this is the intro for this function
        call print_string_new
        mov r11, QWORD [Num_staff_record_iterations]  ;this is the total amount of records that the user has put in for the staff
        lea r9, [Zookeeper_Array]  ;We are loading the first effective address of the zookeeper_array into r9 register
        mov r10, Size_Whole_Zookeeper_Record  ;adding the size of each record for each iteration, basically increasing the record number by 1
        call Delete_Record  ;In order to save space and make code cleaner, both delete staff and badger options will use the same function, and we will pass the parameters of array size, memory address location and number of records as parameters into this function
        mov QWORD [Num_staff_record_iterations], r11
        jmp .menu_options_loop                       
                                      
     .call_function_4:  ;we are being more efficient by having 2 functions using the same function. We pass everything thats relevant to the question passed as parameters
        mov rdi, string_delete_intro  ;this is the intro for this function
        call print_string_new
        mov r11, QWORD [Num_badger_record_iterations]  ;this is the total amount of records that the user has put in for the staff
        lea r9, [Badger_Array]  ;We are loading the first effective address of the zookeeper_array into r9 register
        mov r10, Size_Whole_Badger_Record  ;adding the size of each record for each iteration, basically increasing the record number by 1
        call Delete_Record  ;In order to save space and make code cleaner, both delete staff and badger options will use the same function, and we will pass the parameters of array size, memory address location and number of records as parameters into this function
        mov QWORD [Num_staff_record_iterations], r11
        jmp .menu_options_loop                                                    
                                                                                                                                                      
      .call_function_5:
        call Display_Staff
        jmp .menu_options_loop    
                
     .call_function_6:
        call Display_Badger
        jmp .menu_options_loop
        
     .call_function_7:
        call Lookup_Staff
        jmp .menu_options_loop
        
     .call_function_8:
        call Lookup_Badger
        jmp .menu_options_loop
                                                                                                                  
     .exit_program:
        mov rdi, string_exit_intro
        call print_nl_new
        call print_string_new
        add rsp, 32  ;unload the stack
        pop rbp
        ret  ;exit the program