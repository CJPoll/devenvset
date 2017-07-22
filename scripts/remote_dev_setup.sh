#! /usr/bin/env bash

IP="${1}";
REMOTE_USER="${2}";

if [[ -z "${IP}" ]]; then
	echo;
	echo "Usage:";
	echo;
	echo "./scripts/remote_dev_setup.sh REMOTE_IP [REMOTE_USER]";
	echo;

	exit 1;
fi

if [ -z "${REMOTE_USER}" ]; then
	SSH_STRING="${IP}"
else
	SSH_STRING="${REMOTE_USER}@${IP}"
fi

echo "Uploading bootstrap script:";
echo;
scp "./scripts/dev_setup.sh" "${SSH_STRING}:dev_setup.sh";
echo;
echo "Bootstrap Script Uploaded!";

echo
echo "Running Bootstrap Script:"
ssh "${SSH_STRING}" -A "./dev_setup.sh";
echo
echo "Bootstrap Script Completed!";
