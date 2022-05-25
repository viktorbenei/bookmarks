# Remote Dev Env

## Connect to a temporary (build) VM to debug things

- Use Visual Studio Code "Remote Development" extension pack https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
- Connect to the VM
- Then set up the env via a script, so you can reproduce the same setup again if you'd have to do multiple sessions (e.g. temp VM times out and you have to connect to a new one, or you just want to continue working on it tomorrow)
- For this, write a script file on your own Mac, so it's not lost when the temp VM is destroyed
- Then, in VSCode connected to the temporary VM, save the script by clicking "New File" and saving it at `~/setup.sh`

Example script file for a step, when you want to debug a specific Bitrise step, where you **already prepared everything for the test**
on your own mac, you ran it on your own mac, but want to debug it on the build VM, or benchmark / profile how it runs:

```bash
#!/usr/bin/env bash
set -ex

# get the code and checkout the working branch
mkdir -p ~/temp
cd ~/temp
git clone https://github.com/bitrise-steplib/steps-deploy-to-bitrise-io.git
cd steps-deploy-to-bitrise-io
git checkout bins-515-xcresult-to-junit-conversion-takes-too-long
# prepare the test data
mkdir -p ./_tmp/xcresults
rsync -avhP /tmp/xcresults/Large-Tests.xcresult ./_tmp/xcresults

# Install some tools for debugging
brew update 
brew install htop
brew install go

# Open VSCode in the code dir
code .
```

Now that the `setup.sh` file is available on the temporary VM, open a Terminal in VSCode connected to the temp remote VM, and run:

```
bash ~/setup.sh
```

### Tricks

- Keep the Bitrise VM alive for longer: add a `Script` step at the end of the workflow with `sleep 1800` to keep it running for half an hour.
- Run a new build with Remote Access enabled.
- Note: you can drag and drop files and folders into VSCode and it'll copy that over to the Remote VM. Depending on what you're doing it might be easier to just drag and drop your whole folder than to recreate via script what you have in local, e.g. if you depend on uncommitted or special test files which aren't in the repo.
