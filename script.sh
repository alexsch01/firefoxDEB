if [ $(arch) = 'x86_64' ]
then
  wget -qO - https://packages.mozilla.org/apt/repo-signing-key.gpg | gpg --dearmor | sudo dd of=/etc/apt/keyrings/packages.mozilla.org.gpg
  echo 'deb [ signed-by=/etc/apt/keyrings/packages.mozilla.org.gpg ] https://packages.mozilla.org/apt mozilla main' | sudo tee /etc/apt/sources.list.d/mozilla.list
  
  echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla
  
  sudo apt update
  sudo apt install firefox -y
else
  echo 'Architecture not x86_64, install skipped'
fi
