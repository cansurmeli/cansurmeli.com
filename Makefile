

copyFLAGS = -ve --progress
copyFILES = 
syncFLAGS = -ravz --progress --delete
sshALIAS = mt
currentDIR = /Users/can/Documents/Development/Web/cansurmeli.com/public/
remoteDIR = /var/www/html/cansurmeli.com/public_html/

sync:
	rm -rf public
	hugo
	rsync ${syncFLAGS} ${currentDIR} ${sshALIAS}:${remoteDIR}

#syncLR:
	#rsync ${syncFLAGS} ${currentDIR} ${sshALIAS}:${remoteDIR}

#syncRL:
	#rsync ${syncFLAGS} ${sshALIAS}:${remoteDIR} ${currentDIR}

download:
	rsync ${copyFLAGS} ${sshALIAS}:${remoteDIR}/${copyFILES} ${currentDIR} 

upload:
	rsync ${copyFLAGS} ${currentDIR} ${sshALIAS}:${remoteDIR}/

properlyNameImage:
	for f in *.jpeg; do
		mv "$f" "$f.jpg"
	done

# -r: recurse into directories
# -a: archive mode
# -v: verbose
# -e: specify ssh as remote shell
# -z: compress file data
# --progress: show progress
# --delete: delete extraneous files from destination directories

# https://stackoverflow.com/questions/2826029/passing-additional-variables-from-command-line-to-make
# https://www.cyberciti.biz/tips/linux-use-rsync-transfer-mirror-files-directories.html
