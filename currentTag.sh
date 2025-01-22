# Credits to https://gitlab.com/ggpack/gitless-versioning
# Retrieves the latest tag for HEAD, empty if no tag.
# Must be executed from the project root folder.

(
	cd .git
	# HEAD can contain a simple "sha" (detached mode) or "ref: refs/heads/<branch>"
	read part1 part2 < HEAD
	if [ "$part1" = "ref:" ]; then
		headSha=$(cat $part2)
	else
		headSha=$part1
	fi

	echo -n $(cd refs/tags && ls -t | xargs grep -l $headSha | head -1)
)
