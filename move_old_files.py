import os, time

MAX_AGE = 5
SOURCE_DIR = "source"
DESTINATION_DIR = "destination"


def move_old_files(
	max_age = MAX_AGE,
	source_dir = SOURCE_DIR,
	destination_dir = DESTINATION_DIR
):
	for file in os.listdir(source_dir):
		file_path = os.path.join(source_dir, file)
		if os.stat(file_path).st_mtime + max_age < time.time():
			try:
				os.rename(file_path, os.path.join(destination_dir, file))
			except:
				pass

while True:
	move_old_files()
	time.sleep(1)