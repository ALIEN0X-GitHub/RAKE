# RAKE

This script provides a simple way to perform a ping sweep to identify live hosts on a local network segment. However, it's worth noting that some hosts may have ICMP echo requests (ping) disabled, so they may not respond even if they are live.

## Instructions

1. Open Command Prompt.
2. Use the `ipconfig` command to find out your IP address.
3. Run the script and follow the prompts to enter the first three octets of your IP address and a filename for saving the output.

## Usage

1. Run the script by executing the batch file (`rake.bat`).
2. Enter the first three octets of your IP address when prompted.
3. Enter a filename for saving the output (without extension).
4. The script will ping each IP address in the range and display which hosts are live.
5. The output will be saved to a text file with the provided filename.

## Example

'''To find out your IP Address, use the ipconfig command in Command Prompt.

Enter the first three octets of your IP Address (e.g., 192.168.0): 192.168.1
Enter the file name for saving the output (without extension): output

The following hosts are live:

Pinging 192.168.1.1
192.168.1.1 is live.
Pinging 192.168.1.2
192.168.1.2 is live.

Output:
The following hosts are live:

192.168.1.1 is live.
192.168.1.2 is live.'''



