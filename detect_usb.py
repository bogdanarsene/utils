#!/usr/bin/env python3

import pyudev
import subprocess
import time

def main():
	context = pyudev.Context()
	monitor = pyudev.Monitor.from_netlink(context)
	monitor.filter_by(subsystem='usb')
	monitor.start()

	t_last = 0

	for device in iter(monitor.poll, None):
		# I can add more logic here, to run different scripts for different devices.
		#subprocess.call(['/home/foo/foobar.sh', '--foo', '--bar'])
		if	device.action == "add" and \
			device.driver == "usbhid" and \
			device.device_type == "usb_interface":

			t_new = time.perf_counter()
			if (t_new - t_last) > 10:
				t_last = t_new

				print("Enabling ScrollLock...")
				subprocess.call(['bash', 'enable_scroll_lock.sh'])
				time.sleep(2)


if __name__ == '__main__':
	main()
