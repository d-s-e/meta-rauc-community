**DISCLAIMER: This fork is work in progress and may not work as expected!**
===========================================================================


This README file contains information on the contents of the meta-rauc-ti layer.

Please see the corresponding sections below for details.

Dependencies
============

* URI: git://git.openembedded.org/openembedded-core
* URI: https://github.com/rauc/meta-rauc
* URI: https://git.yoctoproject.org/meta-arm
* URI: https://git.yoctoproject.org/meta-ti/meta-ti-bsp

Patches
=======

Please submit any patches against the meta-rauc-ti layer via GitHub
pull request on https://github.com/rauc/meta-rauc-community.


Disclaimer
==========

Note that this is just an example layer that shows a few possible configuration
options how RAUC can be used.
Actual requirements may differ from project to project and will probably need
a much different RAUC/bootloader/system configuration.

Also note that this layer is for demo purpose only and does not care about
migratability between different layer revision.


I. Building The Demo System
===========================

The easiest way to build the system is to use the ``kas`` tool::

  $ git clone https://github.com/rauc/meta-rauc-community.git
  $ kas build meta-rauc-community/meta-rauc-ti/kas.yml

  % bitbake core-bundle-minimal

These commands checkout all necessary code and setup and build an image base
on ``core-image-minimal`` as well as an example rauc update bundle. You can find
the images after the build in the folder ``build/tmp/deploy/images/j721e-evm``.


II. Flash & Run The Demo System
===============================

**TODO:** document, how to get the generated wic image onto the target ...

To see that RAUC is configured correctly and can interact with the bootloader,
run::

  # rauc status


III. Build and Install The Demo Bundle
======================================

To build the bundle, run::

  $ bitbake update-bundle

Copy the generated bundle to the target system via nc, scp or an attached USB stick.

On the target, you can then install the bundle::

  # rauc install /path/to/update-bundle-j721e-evm.raucb



X. TODO
=======

- **TODO:** document, how to get the generated wic image onto the target
- **TODO:** remove disclaimer in README
- **TODO:** fix repo path in kas config
