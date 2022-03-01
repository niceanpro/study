This is test application for SQLite4Delphi project.

Dirs/Files:
.\source - directory with components.
    SLEngine.pas  -\ 
    SLDB.pas        - engine interface, components...
    SLDataSet.pas -/ 
    SLTypes.pas - constants, types.
    SLFunAgr.pas - functions, aggregations (future ;)
    Note that DLL is defined as ..\sqlite.dll if you want to place it in
  search path change this definition.
    SLDef.inc - file with definitions. It is better not to add it into
  package. After changing this file app / package have to be rebuilded
  to use new precompiler directives.

.\test - test project directory

.\help - help files - generated with pasdoc

.\packages - directory with packages.

  Create your own if you need. Add files, without SLDef.inc, which contains 
only definition.

.\
  pasdoc* - pasdoc information - bat-file, log, ...
    place compiled pasdoc.exe file in this dir and run pasdoc.bat to get
    your own help docs. You can get pasdoc from 
    http://pasdoc.sourceforge.net/phpwiki/
  sqlite.dll - yes, it is engine library. 

License:
  http://www.opensource.org/licenses/lgpl-license.php
In short - you can create apps but changes in library mast be public.

Changes (2003.11.16):
  Stability, specially under IDE,
  May other updates (some done by Paul),
  
Changes (2003.10.17):
  Dir structure,
  Package - right now only Delphi5, 
  Glyphs for IDE added, I have something strange with them... Perheps it's my
    machine...
  Some AVs removed,
  Default values added,
  DB uses SQLite_GetTable for quering internal data,
  Tables, fields, indices - all available from TSLDB component.
  
  