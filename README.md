# Ubuntu-FreeNX-AMI
An Amazon EC2 Machine Image that supports remote desktop via the NX protocol. Intended use case is to support a Cloud-hosted personal workspace accessible from any computer.

-----

# Status

Working:

- AMI is packaged correctly
- FreeNX Server is installed

Not Working:

- Unable to verify client connection
- Needs some thought on authentication methods

TODOs:

- How should AMIs be distributed?
- Provide AMIs for every desktop variant (KDE, LXDE, etc)
- Troubleshooting guides

-----

# Usage

## Launching your personal server

TODO: Write instructions for using AWS web console to launch one of a selection of released AMIs.

1. Create a Security Group
2. Launch Instance with Security Group

## Client Setup

1. [Download and Install **NoMachine Client**](https://www.nomachine.com/download) ((Mac/Windows/Linux/Android/iOS)
    - On OS X with [Homebrew](http://brew.sh/) you can install using [Caskroom](http://caskroom.io/): `brew cask install nomachine`
2. Profit? To be verified.

-----

# Development

1. Install [AWS Command Line Interface](http://aws.amazon.com/cli/) (i.e. `awscli`)
2. Install [Packer](https://www.packer.io/)
3. Fork this repo
4. Contribute Pull Requests

# References

- https://help.ubuntu.com/community/FreeNX
- http://www.ubuntu.com/download/desktop/install-ubuntu-desktop
- http://cloud-images.ubuntu.com/locator/ec2/
- http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

# License

[GNU GENERAL PUBLIC LICENSE](https://github.com/anthonywu/Ubuntu-FreeNX-AMI/blob/master/LICENSE)
