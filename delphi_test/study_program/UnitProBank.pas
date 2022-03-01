unit UnitProBank;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Data.DBXMSSQL, Data.FMTBcd, Data.SqlExpr, Data.DB;
const
maxCnt = 10000;

type
    TRecord = record
        check : Integer;
        num : Integer;
        rtype : String;
        pattern : String;
        engsnt : String;
        korsnt : String;
        book : String;
        chapter : String;
        qstcnt : Integer;
        succnt : Integer;
        exclude : Integer;
        procedure Clear;
        procedure UpdateDB(aissuc: Integer; const SQLQuery_pro: TSQLQuery);
        procedure UpdateExceptDB(sel: Integer; const SQLQuery_pro: TSQLQuery);
        procedure UpdateRecordDB(rrtype, rpattern, rengsnt, rkorsnt, rbook, rchapter : String; const SQLQuery_pro: TSQLQuery);
    end;

    TBank = record
        SQLQuery_pro: TSQLQuery;

        typeCnt : Integer;  // 문제유형총갯수
        seqOrRatioType : Boolean;
        mixType : Boolean;  // Rank(false)/Mix(true)
//        typeStr : String;   // 문제유형문제

        typeSql : String;
        patternSql : String;
        searchSql : String;
        isexcludeSql : String;

        totCnt : Integer;   // 출제문제총수
        idxCnt : Integer;   // 진행Index
        sucCnt : Integer;   // 진행성공갯수

        questions : array of TRecord;
        procedure Init(const aSQLQuery_pro: TSQLQuery);
        procedure SetValue(cnt: Integer; aSeqOrRatioType: Boolean; amixType: Boolean; aisexcludeSql, atypeSql, apatternSql, asearchSql : String);
        procedure ReSet;
        procedure Clear;
        procedure UpdateDB(aissuc: Integer);
        procedure UpdateExceptDB(sel: Integer);
        procedure UpdateRecordDB(sel : Integer; rtype, rpattern, rengsnt, rkorsnt, rbook, rchpater : String);

        procedure ChangeRecord(one, two : Integer);
        function  OneQuestion : Integer;
    end;


implementation

procedure TRecord.Clear;
begin
        check := 0;
        num := 0;
        rtype := '';
        pattern := '';
        engsnt := '';
        korsnt := '';
        book := '';
        chapter := '';
        qstcnt := 0;
        succnt := 0;
end;


procedure TRecord.UpdateDB(aissuc: Integer; const SQLQuery_pro: TSQLQuery);
var
    tsuccnt, issuc : Integer;
    sql : String;
begin
    issuc := aissuc;
    tsuccnt := succnt;
    if issuc = 1 then
        Inc(tsuccnt);

    sql := 'update study_master set qstcnt = ' + IntToStr(qstcnt+1);
    sql := sql + ', succnt = ' + IntToStr(tsuccnt);
    sql := sql + ' where num = ' + IntToStr(num);
    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := sql;
    SQLQuery_pro.ExecSQL;
    SQLQuery_pro.Close;
end;


procedure TRecord.UpdateExceptDB(sel: Integer; const SQLQuery_pro: TSQLQuery);
var
    sql : String;
begin
    sql := 'update study_master set exclude = ' + IntToStr(sel);
    sql := sql + ' where num = ' + IntToStr(num);
    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := sql;
    SQLQuery_pro.ExecSQL;
    SQLQuery_pro.Close;
end;

procedure TRecord.UpdateRecordDB(rrtype, rpattern, rengsnt, rkorsnt, rbook, rchapter : String;  const SQLQuery_pro: TSQLQuery);
var
    sql : String;
begin
    sql := 'update study_master set type = ''' + rrtype + '''';
    sql := sql + ', pattern = ''' + rpattern + '''';
    sql := sql + ', engsnt = ''' + rengsnt + '''';
    sql := sql + ', korsnt = ''' + rkorsnt + '''';
    sql := sql + ', book = ''' + rbook + '''';
    sql := sql + ', chapter = ''' + rchapter + '''';
    sql := sql + ' where num = ' + IntToStr(num);
    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := sql;
    SQLQuery_pro.ExecSQL;
    SQLQuery_pro.Close;
end;


procedure TBank.Init(const aSQLQuery_pro: TSQLQuery);
begin
    Clear;
    SQLQuery_pro := aSQLQuery_pro;

    Randomize;
end;

procedure TBank.SetValue(cnt: Integer; aSeqOrRatioType: Boolean; amixType: Boolean; aisexcludeSql, atypeSql, apatternSql, asearchSql: String);
begin
    typeCnt := cnt;
    seqOrRatioType := aSeqOrRatioType;
    mixType := amixType;
    isexcludeSql := aisexcludeSql;
    typeSql := atypeSql;
    patternSql := apatternSql;
    searchSql := asearchSql;
end;

procedure TBank.Clear;
var
    i: Integer;
begin
    totCnt := 0;
    idxCnt := -1;
    sucCnt := 0;

    for i := 0 to Length(questions) - 1  do
    begin
        questions[i].Clear;
    end;
end;

procedure TBank.ReSet;
var
    sql : String;
    idx : Integer;
    count : Integer;
    FHandle : HWND;
    I, randnum: Integer;
begin
    // 자료 가져오고

    if typeCnt > maxCnt then
        typeCnt := maxCnt;

    sql := 'select top ' + IntToStr(typeCnt) + ' * from ( ';
    sql := sql + '( select *, (0) as ratio from study_master';
    sql := sql + isexcludeSql + ' and qstcnt = 0 ' + typeSql + patternSql + searchSql ;
    sql := sql + ' ) union all ';
    sql := sql + '( select top ' + IntToStr(typeCnt);
    sql := sql + ' *, (succnt*10000/qstcnt) as ratio';
    sql := sql + ' from study_master ' + isexcludeSql + ' and qstcnt != 0 ' + typeSql + patternSql + searchSql ;
    sql := sql + ' ) ) as b ';
    if seqOrRatioType = False then // true then ratio     false then seq
    begin
      sql := sql + 'order by num';
    end
    else
    begin
      sql := sql + 'order by ratio';
    end;

//    MessageBox(0, PWideChar(sql), 'sql', MB_OK);

    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := sql;
    SQLQuery_pro.Open;

    count := 0;
    SQLQuery_pro.First;
    while not SQLQuery_pro.Eof do
    begin
        Inc(count);
        SQLQuery_pro.Next;
    end;

    SetLength(questions, count);
    SQLQuery_pro.First;
    Clear;
    idx := 0;
    while not SQLQuery_pro.Eof do
    begin
        questions[idx].check := 0;
        questions[idx].num := SQLQuery_pro.FieldByName('num').AsInteger;
        questions[idx].rtype := SQLQuery_pro.FieldByName('type').AsString;
        questions[idx].pattern := SQLQuery_pro.FieldByName('pattern').AsString;
        questions[idx].engsnt := SQLQuery_pro.FieldByName('engsnt').AsString;
        questions[idx].korsnt := SQLQuery_pro.FieldByName('korsnt').AsString;
        questions[idx].book := SQLQuery_pro.FieldByName('book').AsString;
        questions[idx].chapter := SQLQuery_pro.FieldByName('chapter').AsString;
        questions[idx].qstcnt := SQLQuery_pro.FieldByName('qstcnt').AsInteger;
        questions[idx].succnt := SQLQuery_pro.FieldByName('succnt').AsInteger;
        questions[idx].exclude := SQLQuery_pro.FieldByName('exclude').AsInteger;
        Inc(idx);
        SQLQuery_pro.Next;
    end;
    SQLQuery_pro.Close;


    // mixtype이면 섞는다.
    if mixType = True then
    begin
        for I := 0 to idx do
        begin
            randnum := Random(idx);
            if randnum <> I then
                ChangeRecord(I, randnum);
        end;

    end;


    totCnt := idx;
end;

procedure TBank.UpdateDB(aissuc: Integer);
begin
    if aissuc = 1 then
        Inc(sucCnt);

    questions[idxCnt].UpdateDB(aissuc, SQLQuery_pro);
end;


procedure TBank.UpdateExceptDB(sel: Integer);
begin
    questions[idxCnt].UpdateExceptDB(sel, SQLQuery_pro);
end;


procedure TBank.UpdateRecordDB(sel : Integer; rtype, rpattern, rengsnt, rkorsnt, rbook, rchpater : String);
begin
    questions[sel].UpdateRecordDB(rtype, rpattern, rengsnt, rkorsnt, rbook, rchpater, SQLQuery_pro);
end;


procedure TBank.ChangeRecord(one, two : Integer);
var
    temp : TRecord;
begin
    temp.check := questions[one].check;
    temp.num := questions[one].num;
    temp.rtype := questions[one].rtype;
    temp.pattern := questions[one].pattern;
    temp.engsnt := questions[one].engsnt;
    temp.korsnt := questions[one].korsnt;
    temp.book := questions[one].book;
    temp.chapter := questions[one].chapter;
    temp.qstcnt := questions[one].qstcnt;
    temp.succnt := questions[one].succnt;

    questions[one].check := questions[two].check;
    questions[one].num := questions[two].num;
    questions[one].rtype := questions[two].rtype;
    questions[one].pattern := questions[two].pattern;
    questions[one].engsnt := questions[two].engsnt;
    questions[one].korsnt := questions[two].korsnt;
    questions[one].book := questions[two].book;
    questions[one].chapter := questions[two].chapter;
    questions[one].qstcnt := questions[two].qstcnt;
    questions[one].succnt := questions[two].succnt;

    questions[two].check := temp.check;
    questions[two].num := temp.num;
    questions[two].rtype := temp.rtype;
    questions[two].pattern := temp.pattern;
    questions[two].engsnt := temp.engsnt;
    questions[two].korsnt := temp.korsnt;
    questions[two].book := temp.book;
    questions[two].chapter := temp.chapter;
    questions[two].qstcnt := temp.qstcnt;
    questions[two].succnt := temp.succnt;
end;


function TBank.OneQuestion : Integer;
begin
    if ( idxCnt + 1 < totCnt) then
    begin
        Inc(idxCnt);
        Result := 1;
    end
    else
    begin
        Result := 0;
    end;
end;
end.
