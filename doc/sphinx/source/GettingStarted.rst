###############
Getting Started
###############

The NIST Pluggable modules depend on several installed software packages and third party products.  Several important setup steps must be performed. If these are not performed properly, you will get one or more error messeges.

Matlab
======
Some of the module plugins depend on MatLab.  Matlahb was chosen over NI Mathscropt for several reasons, mainlyhaving to do with portability and version control.  NI Mathscript does not support all Matlab functions but at present, non of these functions are known to be used so a user could create alternative plugins using NI Mathscript if so desired.  

NI MathScript
=============
Mathscript is required for some of the module plugins.  Future plans include converting these over to Matlab dependency.

Labview Dependencies
====================
A number of Labview packages are needed to run the PARTF.  You can download them and install them with `VI Package Manager (VIPM)`_ (which comes bundled with labview after 2014).

	.. _`VI Package Manager (VIPM)`: https://vipm.jki.net/get
	
	
All Modules
+++++++++++

All of the NIST Pluggagble Modules are dependent on a set of base classes which are freely available on GitHub:

BaseClasses Library
~~~~~~~~~~~~~~~~~~~
Download and install BaseClasses_.

	.. _BaseClasses: LV_Packages/packages/nist_lib_nistbaseclasses/nist_lib_nistbaseclasses-1.1.0.3.vip
	
All classes in PARTF inheret from the BaseObject class.  All Plugin classes inheret from BasePlugin class.  All of the Plugin modules have a Base Plugin class for that module which all the plugin classes inheret from.

ModuleAdmin Library
~~~~~~~~~~~~~~~~~~~
Download and install ModuleAdmin_.

	.. _ModuleAdmin: LV_Packages/packages/nist_lib_nistbaseclasses/nist_lib_nistbaseclasses-1.1.0.3.vip

The administrative library and classes for the Cloneable, Pluggable modules used in the PARTF.  Provides a ModuleAdmin class for maintining module properties.  CloneRegistration providing properties and methods for adding, removing and accounting for instantiated clones, and VIs for synchronizing module clones and their calling applications.

OpenG Variant Configuration File Library
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Download and install either from the VI Package Network using VIPM by going to the the `OpenG Variant Configuration Library`_

	.. _`OpenG Variant Configuration Library`: https://vipm.jki.net/package/oglib_variantconfig
		
The OpenG Variant Configuration File Library package contains tools for writing and reading variant data to and from INI files.  Installing this package requires a free account with JKI Software  During installation, the package will automatically download some other OpenG dependencies.

NISTErrorLib
~~~~~~~~~~~~
Download and install NISTErrorLib_.

	.. _`NISTErrorLib`: LV_Packages/packages/nist_lib_nisterrorlib/nist_lib_nisterrorlib-1.2.0.2.vip

The NIST Error Library builds upon the LabVIEW native error handler to add the ability to handle multiple errors, to prioritize errors and to assign an error severity which allws for additional error handling techniques besides a simple immediat stop or continue.  this library is at the core of the robust and informative error handling that is essential to anything but the smallest of projects.

FunctionGenerator and FGen Modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
At this time, a transition is being made from the older NISTFGen module to FGen.  The primary difference is that the FGen module and the Scope module depend on the `NI IVI Compliance Package`_

	.. _`NI IVI Compliance Package`: http://search.ni.com/nisearch/app/main/p/bot/no/ap/tech/lang/en/pg/1/sn/n8:3,ssnav:ndr/sb/-nigenso4-nigenso3/q/IVI%20Compliance%20Package/
	
The FunctionGenerator module depends on the NI Plug and Play `Agilent 3352X Series Signal Generator driver`_

	.. _`Agilent 3352X Series Signal Generator driver`: http://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=9AAF830ED6FD1947E04400144FB7D21D
	
The newer FGen module uses the NI IVI compliant specific class driver: `Keysight Technologies / Agilent Technologies ag3352x Signal Generator`_

	.. _`Keysight Technologies / Agilent Technologies ag3352x Signal Generator`: http://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=A1C02CABC2854F97E0440021287E6A9E
	
Sampler Module
~~~~~~~~~~~~~~
The Sampler module is dependent on the NI Plug and Play `Agilent 3458 driver`_

	.. _`Agilent 3458 driver`: http://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=36A7F6A5AF553389E0440003BA7CCD71
	
Similar to the FGen module, NIST plans to eventually replace the Sampler module with an IVI compliant "Digitizer" module.

Sensor Module
~~~~~~~~~~~~~
The Sensor module is dependent on the freely available 'NIST Socket Class API`_

	.. _'NIST Socket Class API`: LV_Packages/packages/nist_lib_socket_class/nist_lib_socket_class-1.3.0.9.vip
	
The NIST Socket class API simplifies some of the tasks needed when performing socket communications in LabVIEW.

Sync Module
~~~~~~~~~~~
The Sync module depends on `NI Sync`_

	.. _`NI Sync`: http://www.ni.com/product-documentation/53631/en/
	
And upon the multi device clock disciplining software `mdevClkDesc`_

	.. _`mdevClkDesc`: http://www.ni.com/download/multi-device-pxi-clk10-disciplining-1.0/2052/en/

