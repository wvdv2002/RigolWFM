Changelog
=================================================

v0.8.0
------
*    significantly speed parsing of large .wfm files
*    fix bug with selection of channels in DS1000Z files

v0.7.4
------
*    fix versions in conf.py and setup.cfg

v0.7.3
------
*    fix hyperlinks for colab in docs at https://readthedocs.io

v0.7.2
------
*    fix bug with selecting channels
*    fix bug with autoscaling
*    add links to google colaboratory to documentation
*    describe parameters for a few functions
*    modify message to install RigolWFM when missing

v0.7.1
------
*    add support for selecting channels
*    add autoscaling support for .wav files
*    improve help message for wfmconvert

v0.7.0
------
*    add basic support for DS1000CA files
*    add new model D (untested) out of the E model list

v0.6.7
------
*    add vcsv conversion (just volts, not µV or mV)
*    add support for sigrok exporting (requires sigrok-cli)

v0.6.6
------
*    use probe scaling with DS1000E files

v0.6.5
------
*    fix DS2000 to convert CSV files
*    add more testing to tox

v0.6.4
------
*    fix DS4000 to work with two channels
*    fix DS2000 to work with recent DS2072A firmware
*    add DS2072A test files to repository

v0.6.3
------
*    use sphinx for documentation
*    host docs on https://rigolwfm.readthedocs.io
*    remove unneeded files from pip installation
*    start using tox for testing

v0.6.2
------
*    trying to get console_scripts right

v0.6.1
------
*    use portable install for console_scripts

v0.6.0
------
*    add support for DS2000
*    add command-line utility wfmconvert
*    improve support for DS1000Z
*    fix DS4000
*    add .csv export
*    add .wav export

v0.4.1
------
*    fix requirement for enum by just requiring python > 3.4

v0.4.0
------
*    huge change.  Now using kaitai struct exclusively
*    added support for 1000C, 4000, 6000 .wfm formats
*    much more testing
*    many api changes.

v0.3.0
------
*    fix exception handling, support parsing URLs

v0.2.0
------
*    improve README.md and long_description in setup.py

v0.1.3
------
*    fix setup.py classifiers

v0.1.2
------
*    fix URL and other infelicities

v0.1.1
------
*    add missing files needed for release

v0.1.0
------
*    initial commit
