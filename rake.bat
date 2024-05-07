@echo off
setlocal EnableDelayedExpansion


rem Created by Alien0X
rem 2021
rem Basic Ping Sweep tool for Windows

rem Display instructions for finding IP address
echo To find out your IP Address, use the ipconfig command in Command Prompt.
echo.

:input_ip
rem Prompt the user to enter the first three octets of their IP address
set /p ip_address=Enter the first three octets of your IP Address (e.g., 192.168.0): 

rem Validate user input for IP address
for %%i in (!ip_address!) do (
    for %%j in (%%i) do (
        set "octet=%%j"
        if not "!octet:~0,1!" geq "0" if not "!octet:~0,1!" leq "2" (
            echo Invalid input! Please enter a valid IP address.
            goto input_ip
        )
        if not "!octet:~1,1!" geq "0" if not "!octet:~1,1!" leq "9" (
            echo Invalid input! Please enter a valid IP address.
            goto input_ip
        )
    )
)

rem Remove dot (.) from the end of the IP address, if provided
if "%ip_address:~-1%"== "." set "ip_address=%ip_address:~0,-1%"

rem Prompt the user to enter the file name for saving the output
set /p filename=Enter the file name for saving the output (without extension): 

rem Remove dot (.) from the filename, if provided
if "%filename:~-1%"== "." set "filename=%filename:~0,-1%"

rem Display the output header in the terminal
echo.
echo The following hosts are live:
echo.

rem Initialize a variable to hold the output
set "output=The following hosts are live:%\n%\n"

rem Loop through each IP address in the range and ping it
for /l %%i in (1,1,254) do (
    set "host=!ip_address!.%%i"
    rem Display progress
    echo Pinging !host!
    for /f "tokens=5 delims= " %%j in ('ping -n 1 -w 100 !host! ^| find "TTL"') do (
        echo !host! is live.
        rem Append the live host to the output variable
        set "output=!output!!host! is live.%\n"
    )
)

rem Display the output in the terminal
echo.
echo Output:
echo !output!

rem Save the output to a file in the current directory
echo !output! > "%cd%\%filename%.txt"

echo Output saved to "%cd%\%filename%.txt"

pause
