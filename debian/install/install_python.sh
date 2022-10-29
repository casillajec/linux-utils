#!/bin/sh

. "./check_id.sh"

VENV_WRAPPER_INSTALL_DIR="$HOME/.local/bin"
WORKON_HOME="$HOME/.venv"

VENVWRAPPER_INSTALLER_ID="virtualenvwrapper auto-installation"

BASHRC="
# $VENVWRAPPER_INSTALLER_ID
PATH=\"$VENV_WRAPPER_INSTALL_DIR:\$PATH\"
export WORKON_HOME=\"$WORKON_HOME\"
VIRTUALENVWRAPPER_PYTHON=\"\$(which python3)\"
source $VENV_WRAPPER_INSTALL_DIR/virtualenvwrapper.sh
"

echo "Installing python3" \
	&& sudo apt install python3 \
	&& echo "Installing pip3" \
	&& sudo apt install python3-pip \
	&& echo "Installing virtualenv" \
	&& python3 -m pip install virtualenv virtualenvwrapper \
	&& echo "Configuring virtualenvwrapper" \
	&& [ -d $WORKON_HOME ] || mkdir $WORKON_HOME \
	&& (check_id "$VENVWRAPPER_INSTALLER_ID" "$HOME/.bashrc" \
		&& echo "Virtualenvwrapper has already been configured" \
		|| echo "$BASHRC" >> "$HOME/.bashrc") \
	&& echo "Done, start a new shell"
	
