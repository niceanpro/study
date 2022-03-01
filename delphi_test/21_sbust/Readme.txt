SourceBuster!TM README File - Unregistered Beta Version 
0.03 (October, 1995)
---------------------------------------------------------------------------

Please see the file "Readme.1st for information about installing 
from the downloaded ZIP file.

Thanks for agreeing to beta test the SourceBuster!TM.  This is 
an unregistered version (i.e. sorry, no Forms Printing).

This file provides the following information:

* How SourceBuster!TM differs from other Bibliographic software
   packages
* New features in the current version
* Installing SourceBuster!TM application
* Borland Database Engine (BDE) required support files
  and adding an IDAPI alias entry for SourceBuster!TM
* Borland ReportSmith required support Files
  (Registered Version Only)
* Adding OLE automation support (for Export to WINWORD/WPWIN)
* Running SourceBuster!TM for the first time.  Conceptual overview.
* Resgistering your copy of SourceBuster!TM

NOTE:  For more information on how to use the program, including
rules for entering data, refer to the on-line help.  (Beta 
version of Help is incomplete.)

How SourceBuster!TM differs from other bibliographic software packages
------------------------------------------------------------------------------------------

SourceBuster!TM is unlike the majority of basic bibliographic software 
packages in several respects:

1.   Most basic bibliographic software packages are "flat-file" databases.  That
means, among other things, that there is only one table of information 
"behind the scenes" to hold your data, and no connecting tables to act as lists 
from which you can call on to make data entry easier.  SourceBuster!TM is, on
the contrary, a full-blown "relational database", meaning that -- in addition to 
having no such limitation -- it can professionally regulate the data
you enter, so that you: 

a)  have to think carefully in advance about the information that you store, 
b)  are reminded if you have left out any information that is crucial to any given
       record, and
c)  can perform more sophisticated searches and print more relevant reports than
       the average program of this kind. 
 
New Features incorporated in this version
---------------------------------------------------
* Filtering by letter on browse & main titles form

* Right mouse button click popup menus

* In all forms, cut & paste to/from any windows application

* Export to Word for Windows (WPWIN support to be implemented soon)

* For all appropriate fields, dropdown data lists and 
  "Quicken" style search for lookup

* Quick entry tabbing to required entry fields

* Ctrl-key shortcuts for most primary functions

* Mouse oriented show help for key fields

* Specific and global searching for records

* Browse form for easy view of all references

* Sophisticated searching for records using any lookup field

* Reporting, including standard bibliography
  (Registered version only)


Installing and setting up SourceBuster!TM
----------------------------------------------------

Installing and setting up SourceBuster!TM requires:

1.  The application .EXE and .HLP files located in the /SBUSTER
    sub-directory, which were added to the Windows Program Group
    of your choice (SourceBuster!TM by default).

2.  The Borland Database Engine (BDE).  NB:  Run the 
    BDE Redistribution Program (SETUP.EXE) on the disk labeled 
    "BDE Runtime Installation" before/after installing 
    SourceBuster!TM.  Then run the BDE Configuration program 
    (BDECFG.EXE) in the (default) /IDAPI, and follow the 
    following steps: 

	* Click the 'Aliases' page 
	* Click on 'New Alias'
	* Type 'Academic' for New Alias Name
	* Leave Alias Type 'Standard'
	* Click 'OK', which will bring you to the Parameters 
          section
	* Leave everything the same except the PATH entry, which
	  you must change to point to the x:\SBUSTER\DATA 
          directory, where 'x' is the install drive (e.g. C:\SBUSTER\DATA by 
          default).    

5.  ReportSmith Redistribution program (Registered Versions 
    only).  Run the setup file on the disk labeled "ReportSmith Installation".
 

BDE Redistributable Support Files
------------------------------------------

To access the Paradox 5.0 tables, the following files must be
installed:

File name       Required For...         Approx. Size
------------       ------------------         ----------------
IDAPI01.DLL     ALL DELPHI DATABASE     470 KB total
IDR10009.DLL    APPLICATIONS
ILD01.DLL       "               "
IDAPI.CFG       "               "

IDQRY01.DLL     SQL queries             400 KB  Must also include
                                                IDPDX01.DLL
IDBAT01.DLL     SQL queries and         105 KB
                Batch Move operations

IDPDX01.DLL     Paradox access          250 KB

BDECFG.EXE      BDE Config Utility/Help 430 KB
BDECFG.HLP      Required to redefine
                aliases (optional)

NB: SourceBuster!TM does not require all of the BDE files, 
only the ones to support for Paradox tables.  The following is a
list of all the files you will need for the Paradox tables.
You may delete any/all of the other files/drivers (if you do not
require them for another program, of course).
 

ReportSmith Redistribution Support (Registered Version only)
---------------------------------------------------------------------------

The following files must be installed:

RED110.DLL              DRVACCSS.HLP            BTRV110.DLL
DRVBTRV.HLP             RCS0.RST-RCS8.RST       RSCTSFMT.RST
DRVDBASE.HLP            XBS110.DLL              RS_DBLIB.DLL
XLSISAM.DLL             DRVEXCEL.HLP            DRVFOX.HLP
RS_GUP.DLL              RS_INGR.DLL             B4RPT.MAC
DONDFMT.MAC             DATE.MAC                DISABLE.MAC
ENABLE.MAC              GREETING.MAC            ID2NAME.MAC
LOADREP.MAC             LOADREPS.MAC            RECNO.MAC
THETIME.MAC             CTL3D.DLL               MSJETDSP.DLL
ODBC.DLL                ODBCADM.EXE             ODBCINST.DLL
SIMADMIN.DLL            SIMBA.DLL               ODBCINST.HLP
COPOBJ.DLL              STDOLE.TLD              DRVTEXT.HLP
RS_ORA6.DLL             RS_ORA7.DLL             BIBAS04.DLL
BIFLT04.DLL             BIMDS04.DLL             BIUTL04.DL
ODBCCURS.DLL            PXENGCFG.EXE            PXENGWIN.DLL
BIPDX04.DLL             BIPDX04.HLP             QEBI.LIC
README.TXT              BC30RTL.DLL             DATALIB2.DLL
DLOLE2.DLL              IMAGEMAN.DLL            IMGPCX.DIL
IMGTIFF.DIL             RSSQLIF.TXT             RS_FMT.DLL
RS_IDABP.DLL            RS_ODBC.DLL             RS_OGLWL.DLL
RS_OLE2C.DLL            RS_OLE2U.DLL            RS_OWL31.DLL
RS_SIFUT.DLL            RS_SQLIF.DLL            RS_SYS.DLL
RS_SYS.DLL              RS_TBP1.DLL             RS_TBP2.DLL
RS_TCL31.DLL            RS_TKRIB.DLL            RS_DFWEN.DLL
RS_TKSTB.DLL            RS_TKTB.DLL             RS_UTIL.DLL
SSMRTHEAP.DLL           REPVAR.FRM              REPVAR.MAK
RSR_CTAB.DLL            RSR_DBAC.DLL            RSR_DBUI.DLL
RSR_MAIN.DLL            RSR_RPT.DLL             RSR_RUTL.DLL
RSR_XPRT.DLL            RSTEST.FRM              RSTEST.FRM
RS_RUN.EXE              RS_RUN.HLP              RUN_TEST.EXE
RS_SQLIF.INI            CTL3DV2.DLL             TXTISAM.DLL


If you would like the ability to modify the reports or create new 
ones, you will need to purchase copies of ReportSmith PC or 
ReportSmith SQL.

OLE Automation Support
-------------------------------
BOLE16D.DLL is Borland's OLE2 Support DLL. This DLL must be
installed to WINDOWS\SYSTEM. You must also have the
Microsoft OLE DLLs installed to WINDOWS\SYSTEM:

OLE2.DLL
OLE2.REG
OLE2CONV.DLL
OLE2DISP.DLL
OLE2NLS.DLL
OLE2PROX.DLL
OLECLI.DLL
OLESVR.DLL
STORAGE.DLL
TYPELIB.DLL
COMPOBJ.DLL


Running The SourceBuster! TM for the First Time
-------------------------------------------------------------

The SourceBuster! TM is a detailed way of keeping track of all kinds
of notes and data.  It's useful to students, teachers,
writers, lawyers, business people -- anyone, actually, who wants 
to use a PC to clarify and organize the information that's important
to their work.  (Think of it as a replacement for the old 
fashioned 3x5 cards that you use for writing reports.)  
It is centered on the idea of a standard bibliography, 
but goes a lot further by requiring you to enter all the essential 
information and keep tract of it in a conceptually meaningful way.  
In addition to the standard reference page (which you see when you 
start the program), you have direct access to various subsidiary 
forms, including a form to add Questions about the work you're 
doing, one to input Quotations from books and other resources, 
and a space to record your own Ideas as well 
(use this area to record your actual writing).

SourceBuster!TM and The Chicago Manual of Style
---------------------------------------------------------------

SourceBuster!TM has been designed in accordance with the 
Author-Date Text Citation scheme of the The Chicago Manual 
of Style.  This means that there is a facility for inserting 
the author's last, or family, name and the year of publication 
of the work into the running text of a word processing document, 
for example:  (Farnsworth 1987).  Furthermore, the standard 
printed bibliography report follows the same format, namely, 
for example,

Farnsworth, Roger. 1987. Testing the limits. Oxford:  Overhill Press.
 
N.B.  There is no need to include terminal punctuation marks (periods) 
either at the end of a title in the Title field or when using initials, abbreviating 
places, etc. (e.g. enter 'E' and 'M' only for the author J. J. Jones).  (With
the exception of initialisation for double-barrelled names which fall in
one field, for instance, the first initials for the name 'E.-H. Smith' should be 
entered as 'E.-H'. The Export and Report facilities automatically includes 
all the necessary formatting.  

Running SourceBuster!TM for the first time.  Conceptual overview.
----------------------------------------------------------------------------------  

To enter a reference, you must first enter various details.  
You do this by selecting the relevant forms, either by the main
menu at the top of the form or via the speed buttons located 
in a row just below the main menu (some form specific speed 
buttons are located directly on the form).  You can also use the
right mouse button to access some of the form specific commands.
Most of the forms (or, to be more precise, database tables) have 
at least one record already added, in order to make it easier to 
see what a typical record might look like.  Some fields are required; 
the text for these are in a red font colour.  The other fields are 
optional; these have a black font colour. Also note that the main
titles form has several user-defined fields which you can assign
names to via the Settings/Configuration form.  Access these by
clicking the speed button that looks like a card file (next to the record 
navigator). The user-defined fields have the following properties:

#s 1-2  50 characters (text)
#    3 100 characters (text)
#    4 240 characters (text)  
#    4 memo field

You must input the necessary details in (more or less) the following order:

1.    Begin by entering at least six basic terms in the Terms/Definitions/
Translations form.  These should correspond to the terms you wish to use
for your Domains/Keywords combinations (see 2-3 and "Basic Terms" below).  
The three languages you chose for translations can be changed in the 
Configuration Settings form.  Add definitions for the terms if you would like as well;

2.  In the Domains/Keywords form, enter at least one Domain of work/study 
combination (Field, Topic and Subtopic); and 

3.    Enter at least one Keyword combination (Keyword, Secondary and Tertiary
Keywords);

4.    Enter at least one Location (e.g. Central Library), Source (e.g. institutional 
acquisition), and Type (e.g. Brief, Thesis, ect.) in the form of the same name;

5.    Enter the details for at least one Publisher;

6.    Enter the details for at least one Journal/Series/Newspaper;

7.    Enter the details for at least one Author (and/or Editor and/or Translator).
Note that the Type field for Authors derives from the entries on the Location/
Source/Type form.  Therefore, you must enter a relevant type for that person,
i.e. personal, professional, academic; 

Now you are ready to enter your first title entry.

1.  Enter the title of the Book, Newspaper or journal article, etc.  Double click 
on the title field to see the full page view;

2.  Use the tab key to move to the next required field, namely Author(s).  Click
the first Author field area and a alphabetised listing of all the authors you have
entered will appear.  Either scroll through the list or quickly type the first few 
character for the name you wish to use.  If you make a mistake, click on the 
eraser icon to clear the field;

3.   Tab to the other fields and enter data accordingly.  

You should find most of the above to be self-guiding/explanatory.

A word or two, however, is required to further explain the choice/entry 
of the Domain and Keyword combinations.  


Basic Terms
---------------

As explained in the SourceBuster! TM On-line Help, when entering 
a Reference, Quotation, Question or Idea, you will be required to 
chose six terms that best represent the subject matter and 
content of the information.  It is basically up to you to determine 
what terms satisfy this requirement, but try to use ones that 
relate explicitly to the data at hand.  In general, think carefully 
about the area of study in which you are working to choose the 
Domain terms, and simply use relevant words in the title for the 
three Keywords.  (NB:  If you find one of the terms is irrelevant 
or that you need another while you are entering a reference, you 
can always bring up the terms page without losing your work.)

One important thing to keep in mind as you use The SourceBuster!,
especially when you're just getting familiar with the system, is
that a little work now will save a lot of time later!  In other
words, it may take some time and effort to enter all the data
and think carefully about the terms you use to categorize your
work, but it will pay off in the end by making it easier to 
locate and utilize your important data. 


Resgistering your copy of SourceBuster!TM
-----------------------------------------------------

When you decide to register your copy of SourceBuster!TM,
and receive your registration ID in the mail,
Click on the 'About' Item in the Main Menu and choose the
Item 'SOurceBuster!TM Temporary Validation.  Follow the
instuctions on how to temporarily enable Forms Printing
while your registered version update is being shipped. 


Thanks for using SourceBuster! TM  
	

Copyright 1995 (C) Organising Concepts, Inc. 

"Organising your conceptual world."
 



