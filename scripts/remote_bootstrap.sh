#! /usr/bin/env bash

IP="${1}";
OS="${2}";
REMOTE_USER="${3}";

if [[ -z "${IP}" || -z "${OS}" ]]; then
	echo;
	echo "Usage:";
	echo;
	echo "./scripts/remote_bootstrap.sh REMOTE_IP debian [REMOTE_USER]";
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
scp "./scripts/${OS}_bootstrap.sh" "${SSH_STRING}:bootstrap";
echo;
echo "Bootstrap Script Uploaded!";

echo
echo "Running Bootstrap Script:"
ssh "${SSH_STRING}" "./bootstrap";
echo
echo "Bootstrap Script Completed!";
