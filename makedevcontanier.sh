#!/bin/bash

# Create the .devcontainer directory if it doesn't exist
mkdir -p .devcontainer

# Write the JSON code to the devcontainer.json file
cat <<'EOF' > .devcontainer/devcontainer.json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/java
{
	"name": "Java",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	"image": "mcr.microsoft.com/devcontainers/java:1-21-bullseye",

	"features": {
		"ghcr.io/devcontainers/features/java:1": {
			"version": "none",
			"installMaven": "false",
			"installGradle": "false"
		}
	},

	// Use 'postCreateCommand' to run commands after the container is created.
	"postCreateCommand": "chmod 777 grade_asm3 && chmod 777 mips_checker.pl && echo 'Both grade_asm3 and mips_checker.pl are now runable. Please use ./grade_asm3 to check tests.'",

	// Configure tool-specific properties.
	// "customizations": {},

	// Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
	// "remoteUser": "root"
}

EOF
