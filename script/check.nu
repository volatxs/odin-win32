let command = [
	odin check win32
	-disallow-do
	-max-error-count:4096
	-no-entry-point
	-strict-style
	-vet
	-vet-tabs
	-vet-unused
	-vet-uninitialized
	-vet-using-param
	-warnings-as-errors
]

print $"Running (ansi light_blue)($command | str join ' ')(ansi reset)"

run-external ...$command
