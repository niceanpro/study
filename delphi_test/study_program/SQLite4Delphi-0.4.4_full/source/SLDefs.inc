{ This file is simply included to all SL units. Be sure to rebuild project
  and / or packages... }

{ Allows search memory leaks based on TRecData - Data fileds. Shuld be active
  for most cases. }
{$DEFINE COUNT_DATA_ALLOC}

{ Only one directive should be active. It allows programer to define propper
  action when exception occured.}
{ $DEFINE SHOWMSG_INSTEAD_RAISE}
{ $DEFINE SHOWMSG_AND_RAISE}
{$DEFINE ONLY_RAISE}

{ MZa / DGP 2003.10.25 - If defined only default engine works. TSLDatabase don't
  have property Engine etc. When dissabled, I think, functions shuld be
  dissallowed - for sipmlicity in that part...
  You can dissable it for converting database files.
}
{$DEFINE SINGLE_ENGINE}

// compiler version releated directives
{$IFDEF VER80}
  {$DEFINE DELPHI}

  {$DEFINE D1}
{$ENDIF}

{$IFDEF VER90}
  {$DEFINE DELPHI}

  {$DEFINE D2}
  {$DEFINE D1}
{$ENDIF}

{$IFDEF VER93}  { Borland C++Builder 1.x }
  {$DEFINE CBUILDER}

  {$DEFINE BCB1}
{$ENDIF}

{$IFDEF VER100} { Borland Delphi 3.x }
  {$DEFINE DELPHI}

  {$DEFINE D3}
  {$DEFINE D2}
  {$DEFINE D1}
{$ENDIF}

{$IFDEF VER110} { Borland C++Builder 3.x }
  {$DEFINE CBUILDER}

  {$DEFINE BCB3}
  {$DEFINE BCB1}
{$ENDIF}

{$IFDEF VER120} { Borland Delphi 4.x }
  {$DEFINE DELPHI}

  {$DEFINE D4}
  {$DEFINE D3}
  {$DEFINE D2}
  {$DEFINE D1}
{$ENDIF}

{$IFDEF VER125} { Borland C++Builder 4.x }
  {$DEFINE CBUILDER}

  {$DEFINE BCB4}
  {$DEFINE BCB3}
  {$DEFINE BCB1}
{$ENDIF}

{$IFDEF VER130}
  {$IFDEF BCB}  { Borland C++Builder 5.x }
    {$DEFINE CBUILDER}

    {$DEFINE BCB5}
    {$DEFINE BCB4}
    {$DEFINE BCB3}
    {$DEFINE BCB1}
  {$ELSE}       { Borland Delphi 5.x }
    {$DEFINE DELPHI}

    {$DEFINE D5}
    {$DEFINE D4}
    {$DEFINE D3}
    {$DEFINE D2}
    {$DEFINE D1}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER140}
  {$DEFINE CMP6_UP}

  {$IFDEF BCB} { Borland C++Builder 6.x }
    {$DEFINE CBUILDER}

    {$DEFINE BCB6}
    {$DEFINE BCB5}
    {$DEFINE BCB4}
    {$DEFINE BCB3}
    {$DEFINE BCB1}
  {$ELSE}      { Borland Delphi 6.x }
    {$DEFINE DELPHI}

    {$DEFINE D6}
    {$DEFINE D5}
    {$DEFINE D4}
    {$DEFINE D3}
    {$DEFINE D2}
    {$DEFINE D1}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER150}
  {$DEFINE CMP6_UP}
  {$IFDEF BCB} { ??? }
  {$ELSE}      { Borland Delphi 7.x }
    {$DEFINE DELPHI}

    {$DEFINE D7}
    {$DEFINE D6}
    {$DEFINE D5}
    {$DEFINE D4}
    {$DEFINE D3}
    {$DEFINE D2}
    {$DEFINE D1}
  {$ENDIF}
{$ENDIF}

{$IFDEF CMP6_UP}
  {$WARN UNIT_PLATFORM OFF}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

