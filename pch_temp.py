import subprocess
import time

def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        return result.stdout.strip()
    else:
        return 55

isOverheat = False
while True:
    output = int(run_command('sudo ec_probe read 179 | egrep -o "[0-9]+" | head -1'))

    if output >= 65:
        isOverheat = True

    if output < 65 and isOverheat:
        isOverheat = False
        run_command('sudo ec_probe write 179 55')
    
    time.sleep(1)
