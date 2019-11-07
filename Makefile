

copyFLAGS = -ve --progress
copyFILES = 
syncFLAGS = -ravz --progress --delete --omit-dir-times
sshALIAS = vps
currentDIR = /Users/can/Documents/Development/Web/cansurmeli.com/public/
remoteDIR = /var/www/cansurmeli.com/public_html/

publish:
	rm -rf public
	hugo
	rsync ${syncFLAGS} ${currentDIR} ${sshALIAS}:${remoteDIR}
	rm -rf public
	./versioning/incrementBuildNumber.sh
	git add *
	$(eval buildNumber := $(shell ./versioning/getBuildNumber.sh))
	git commit -m "Publish commit(build: $(buildNumber))"
	git push

updateTheme:
	git submodule update --remote themes/minimal
	git add *
	git commit -m "Submodule update."
	git push

templateMetrics:
	hugo --templateMetrics --templateMetricsHints

properlyNameImage:
	for f in *.jpeg; do
		mv "$f" "$f.jpg"
	done

cleanupImages:
	hugo --gc
# Cleaning up unused images after image settings change(s)
# http://gohugo.io/content-management/image-processing/

# -r: recurse into directories
# -a: archive mode
# -v: verbose
# -e: specify ssh as remote shell
# -z: compress file data
# --progress: show progress
# --delete: delete extraneous files from destination directories
# --omit-dir-times: rsync doesn't try to sync the directory times in between the source and the host. Due to the fact that macOS's file system isn't compatible with CentOS's.

# https://stackoverflow.com/questions/2826029/passing-additional-variables-from-command-line-to-make
# https://www.cyberciti.biz/tips/linux-use-rsync-transfer-mirror-files-directories.html
