from google_drive_downloader import GoogleDriveDownloader as gdd
file='1iytA1n2z4go3uVCwE__vIKouTKyIDjEq'
file='1CHWAh4KQ3Mq9AJdY6a9mTSIn7HjYUtEY'
gdd.download_file_from_google_drive(file_id=file,
                                    dest_path='./data/mnist.zip',
                                    unzip=True)
