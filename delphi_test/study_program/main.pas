unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMSSQL, Data.FMTBcd,
  Vcl.StdCtrls, Data.SqlExpr, Vcl.DBCGrids, Vcl.Grids, Vcl.DBGrids, Data.DB, UnitProBank,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.CategoryButtons, Vcl.ComCtrls;

type
    TGameState = (gsGaveOver, gsGameSubmited, gsGameShowAnsered, gsGameChecked, gsGamePaused); // user is center.


  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SQLQuery_pro: TSQLQuery;
    Memo_Qst: TMemo;
    Memo_Sol: TMemo;
    ComboBox_type: TComboBox;
    ComboBox_questNum: TComboBox;
    Memo_Sub: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button_Submit: TButton;
    Memo_Status: TMemo;
    Label10: TLabel;
    Button_Set: TButton;
    Edit_QBook: TEdit;
    Edit_QChapter: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit_QQstCnt: TEdit;
    Edit_QSucCnt: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit_type_tot: TEdit;
    Label15: TLabel;
    Edit_totCnt: TEdit;
    Edit_idxCnt: TEdit;
    Edit_sucCnt: TEdit;
    ComboBox_questMethod: TComboBox;
    Label16: TLabel;
    Button_true: TButton;
    Button_false: TButton;
    CheckBox_speed: TCheckBox;
    Label17: TLabel;
    Edit_type_suc_ratio: TEdit;
    Label18: TLabel;
    Edit_pattern: TEdit;
    ComboBox_pattern: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Edit_search: TEdit;
    Panel1: TPanel;
    CheckBox_timer: TCheckBox;
    Label21: TLabel;
    CheckBox_selectExcept: TCheckBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit_solveTime: TEdit;
    Edit_checkTime: TEdit;
    CheckBox_except: TCheckBox;
    Label25: TLabel;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Help1: TMenuItem;
    about1: TMenuItem;
    Exit1: TMenuItem;
    ool1: TMenuItem;
    ShowData1: TMenuItem;
    ShowExcludeData1: TMenuItem;
    Label26: TLabel;
    ComboBox_progMethod: TComboBox;
    ProgressBar_solve: TProgressBar;
    ProgressBar_check: TProgressBar;
    UpDown_solve: TUpDown;
    UpDown_check: TUpDown;
    Label27: TLabel;
    CheckBox_patternHide: TCheckBox;
    Label28: TLabel;
    Label29: TLabel;
    Edit_watch: TEdit;
    Edit2: TEdit;
    ProgressBar_solveColor: TProgressBar;
    ProgressBar_checkColor: TProgressBar;
    Label30: TLabel;
    CheckBox_seq: TCheckBox;
    Button1: TButton;
    Timer_watch: TTimer;
    Button_pause: TButton;
    Button_save: TButton;
    Label31: TLabel;
    Edit_QType: TEdit;
    Label32: TLabel;
    CheckBox_mix: TCheckBox;
    CheckBox_SeqOrRatio: TCheckBox;
    Label33: TLabel;

    procedure Button_SetClick(Sender: TObject);
    procedure Init(Sender: TObject);
    procedure Button_SubmitClick(Sender: TObject);
    procedure ComboBox_typeChange(Sender: TObject);
    procedure ComboBox_questMethodChange(Sender: TObject);
    procedure Button_trueClick(Sender: TObject);
    procedure Button_falseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox_timerClick(Sender: TObject);
    procedure UpDown_solveClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown_checkClick(Sender: TObject; Button: TUDBtnType);
    procedure CheckBox_exceptClick(Sender: TObject);
    procedure CheckBox_selectExceptClick(Sender: TObject);
    procedure ComboBox_progMethodChange(Sender: TObject);
    procedure ComboBox_patternChange(Sender: TObject);
    procedure Edit_searchChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer_watchTimer(Sender: TObject);
    procedure Button_pauseClick(Sender: TObject);
    procedure Button_saveClick(Sender: TObject);
    procedure CheckBox_seqClick(Sender: TObject);

  private
    { Private declarations }
    procedure progMethodInit;
    procedure progMethodSet;
    procedure typeComboInit;
    procedure typeComboSet;
    procedure patternComboInit;
    procedure patternComboSet;
    procedure questMethodInit;
    procedure selectExceptInit;
    procedure typeTotInit;
    procedure questNumInit;
    procedure oneQuestion;
    procedure timerCheck;

    function  ReplaceStr(old : String) : String;
  public
    { Public declarations }
  end;

var
    Form1: TForm1;

    progMethod : Integer;       // ????????  : 0 - ??????, 1 - ??????

    typeStr : String;           // type?? ??????
    typeSql : String;           // type?? Sql ??????

    patternStr : String;        // pattern ??????
    patternSql : String;        // pattern?? Sql ??????

    searchStr : String;         // ????????
    searchSql : String;         // ????Sql

    isexclude : Integer;        // ???? ????
    isexcludeSql : String;      // ???? ???? Query


    typeTot: Integer;         // type?? ???? ????
    typeQstTot: Integer;      // type?? ???? ??
    typeSucTot: Integer;      // type?? ???? ??
    typeRatio: Real;          // type?? ??????

    methodQst : Integer;      // ???? ???? ????
    isSpeed : Integer;        // speed???? ????

    whichBtn : Boolean;
    status : TGameState;      // ???? ????

    solveExpired : Boolean;
    checkExpired : Boolean;


    query : String;           // ??????????

    bank : TBank;             // ???? ????

    myTime :TSystemTime;

    timeSumSolve, timeSumCheck : Double;
implementation

{$R *.dfm}

// Program ?????????? : ?????? Settting?? ????
procedure TForm1.Init(Sender: TObject);
begin

    selectExceptInit;
    progMethodInit;

    questMethodInit;

    bank.Init(SQLQuery_pro);
//    bank.SetValue(typeTot, isexcludeSql, typeSql, patternSql, searchSql);

    Edit_solveTime.Enabled := False;
    Edit_checkTime.Enabled := False;

    Edit_solveTime.ReadOnly := True;
    Edit_checkTime.ReadOnly := True;

    CheckBox_except.Enabled := False;

    Button_Submit.Hide;
    Button_true.Hide;
    Button_false.Hide;
end;


// progMethod?? ?????? ????.
procedure TForm1.progMethodInit;
begin
    ComboBox_progMethod.Clear;
    ComboBox_progMethod.Items.Add('??????');
    ComboBox_progMethod.Items.Add('??????');
    ComboBox_progMethod.ItemIndex := 0;

    progMethodSet;

    typeComboInit;
end;

// progMethod?? ?????? ?????? ????.
procedure TForm1.progMethodSet;
begin
    progMethod := ComboBox_progMethod.ItemIndex;
end;

// progMethod ????
procedure TForm1.ComboBox_progMethodChange(Sender: TObject);
begin
    progMethod := ComboBox_progMethod.ItemIndex;

    typeComboInit;

    questMethodInit;
    typeTotInit;
    questNumInit;

    bank.Init(SQLQuery_pro);
//    bank.SetValue(typeTot, typeStr);

    Button_Submit.Hide;
    Button_true.Hide;
    Button_false.Hide;

    Edit_solveTime.Enabled := False;
    Edit_checkTime.Enabled := False;

    Edit_solveTime.ReadOnly := True;
    Edit_checkTime.ReadOnly := True;

    CheckBox_except.Enabled := False;

end;

// type Combo?? ?????? ????.   : db:type, visual = Question
procedure TForm1.typeComboInit;
var
    Sender: TObject;
begin
    query := '';
    if progMethod = 0 then begin // ??????
        query := 'select type from study_master' + isexcludeSql + searchSql + ' group by type ';
    end else  begin                  // ??????
        query := 'select book from study_master' + isexcludeSql + searchSql + ' group by book ';
    end;

    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := query;
    SQLQuery_pro.Open;
    SQLQuery_pro.First;

    ComboBox_type.Clear;
    while not SQLQuery_pro.Eof do
    begin
        if progMethod = 0 then  begin   // ??????
            ComboBox_type.Items.add(SQLQuery_pro.FieldByName('type').AsString);
        end else begin                  // ??????
            ComboBox_type.Items.add(SQLQuery_pro.FieldByName('book').AsString);
        end;
        SQLQuery_pro.Next;
    end;
    SQLQuery_pro.Close;

    ComboBox_type.Items.add('????');
    ComboBox_type.ItemIndex := 0;

    typeComboSet;
    patternComboInit;
end;


// type Combo?? ?????? ?????? ????.
procedure TForm1.typeComboSet;
var
subStr : String;
begin
    if ComboBox_type.Items.Count > 0 then
    begin
        typeStr := ComboBox_type.Items.strings[ComboBox_type.ItemIndex];
        subStr := ReplaceStr(typeStr);

        if CompareText('????', ComboBox_type.Items.strings[ComboBox_type.ItemIndex]) = 0 then begin
            typeSql := ' and 1 = 1 ';
        end else begin
            if progMethod = 0 then  begin   // ??????
                typeSql := ' and type = ''' +  subStr + ''' ';
            end else begin                  // ??????
                typeSql := ' and book = ''' + subStr + ''' ';
            end;
        end;
    end;
end;

procedure TForm1.ComboBox_typeChange(Sender: TObject);
begin
    typeComboSet;

    // ?????? ?????? ???? ??.
    patternComboInit;

    typeTotInit;
end;

procedure TForm1.Edit_searchChange(Sender: TObject);
var
searchQry :String;
begin
    searchStr := Edit_search.Text;

    searchQry := ReplaceStr(Edit_search.Text);

    searchSql :=  ' and num in ( ';
	searchSql := searchSql + ' select num from study_master where engsnt like ''%' + searchQry + '%'' union ';
	searchSql := searchSql + ' select num from study_master where korsnt like ''%' + searchQry + '%'' union ';
	searchSql := searchSql + ' select num from study_master where pattern like ''%' + searchQry + '%'' ) ';

    ComboBox_progMethodChange(Sender);
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
    // ??????
    ComboBox_progMethodChange(Sender);
end;

// pattern Combo?? ?????? ????.
procedure TForm1.patternComboInit;
var
    Sender: TObject;
begin
    query := '';
    if progMethod = 0 then begin // ??????
        query := 'select pattern from study_master' + isexcludeSql + typeSql + searchSql + ' group by pattern ';
    end else  begin              // ??????
        query := 'select chapter from study_master' + isexcludeSql + typeSql + searchSql + ' group by chapter ';
    end;

    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := query;
    SQLQuery_pro.Open;
    SQLQuery_pro.First;

    ComboBox_pattern.Clear;
    ComboBox_pattern.Items.add('????');
    while not SQLQuery_pro.Eof do
    begin
        if progMethod = 0 then  begin   // ??????
            ComboBox_pattern.Items.add(SQLQuery_pro.FieldByName('pattern').AsString);
        end else begin                  // ??????
            ComboBox_pattern.Items.add(SQLQuery_pro.FieldByName('chapter').AsString);
        end;
        SQLQuery_pro.Next;
    end;
    SQLQuery_pro.Close;

    ComboBox_pattern.ItemIndex := 0;

    patternComboSet;

    typeTotInit;
end;

// pattern Combo?? ?????? ?????? ????.
procedure TForm1.patternComboSet;
var
//stb, stbr : TStringBuilder;
s:String;
subStr : String;
begin
    if ComboBox_pattern.Items.Count > 0 then
    begin
        patternStr := ComboBox_pattern.Items.strings[ComboBox_pattern.ItemIndex];

        subStr := ReplaceStr(patternStr);

//        stb := TStringBuilder.Create(patternStr);
//        stbr := stb.Replace('''', '''''');
//        s := stbr.ToString;

        if CompareText('????', ComboBox_pattern.Items.strings[ComboBox_pattern.ItemIndex]) = 0 then begin
            patternSql := ' and 1 = 1 ';
        end else begin
            if progMethod = 0 then  begin   // ??????
                patternSql := ' and pattern = ''' + subStr + ''' ';
            end else begin                  // ??????
                patternSql := ' and chapter = ''' + subStr + ''' ';
            end;
        end;
    end;
end;

procedure TForm1.ComboBox_patternChange(Sender: TObject);
begin
    patternComboSet;

    typeTotInit;
end;


procedure TForm1.selectExceptInit;
begin
    if CheckBox_selectExcept.Checked then begin
      isexclude := 1;
      isexcludeSql := ' where 1 = 1';
    end else begin
      isexclude := 0;
      isexcludeSql := ' where exclude = 0';
    end;
end;

procedure TForm1.CheckBox_selectExceptClick(Sender: TObject);
begin
    if CheckBox_selectExcept.Checked then begin
      isexclude := 1;
      isexcludeSql := ' where 1 = 1';
    end else begin
      isexclude := 0;
      isexcludeSql := ' where exclude = 0';
    end;

    typeComboInit;
    typeTotInit;
    questNumInit;
end;


// ?????? ?????? ???? ???? ?????? ???????? ???????? ????????.
procedure TForm1.typeTotInit;
var
    s, Sql : string;
    idx : integer;
begin
    idx := ComboBox_type.ItemIndex;

    Sql := ' select count(*), SUM(succnt), SUM(qstcnt) from study_master ';
    Sql := Sql + isexcludeSql + typeSql + patternSql + searchSql;

    SQLQuery_pro.Close;
    SQLQuery_pro.SQL.Text := Sql;
    SQLQuery_pro.Open;
    SQLQuery_pro.First;

    Edit_type_tot.Clear;
    while not SQLQuery_pro.Eof do
    begin
        s:= SQLQuery_pro.Fields.Fields[0].AsString;
        typeTot := SQLQuery_pro.Fields.Fields[0].AsInteger;
        typeSucTot := SQLQuery_pro.Fields.Fields[1].AsInteger;
        typeQstTot := SQLQuery_pro.Fields.Fields[2].AsInteger;
        SQLQuery_pro.Next;
    end;
    SQLQuery_pro.Close;

    if typeQstTot = 0 then
    begin
        Edit_type_tot.Text := s;
        Edit_type_suc_ratio.Text := '';
    end
    else
    begin
        typeRatio := typeSucTot/typeQstTot * 100;
        Edit_type_tot.Text := s;
        Edit_type_suc_ratio.Text := FloatToStr(Round(typeRatio)) + ' %';
    end;

    Edit_type_tot.ReadOnly;
    Edit_type_suc_ratio.ReadOnly;

    bank.SetValue(typeTot, CheckBox_SeqOrRatio.Checked, CheckBox_mix.Checked, isexcludeSql, typeSql, patternSql, searchSql);

    questNumInit;
end;












// questMethod Combo?? ?????? ????.
procedure TForm1.questMethodInit;
begin
      // ?????????? ??????????.
      ComboBox_questMethod.Clear;
      ComboBox_questMethod.Items.Add('Kor -> Eng');
      ComboBox_questMethod.Items.Add('Eng -> Kor');
      ComboBox_questMethod.ItemIndex := 0;
end;

procedure TForm1.questNumInit;
var
deg : Integer;
begin
    ComboBox_questNum.Clear;

    { ???????? ?????? ??
    ?? ?????? }
    //deg := typeTot/10;

    //  for I := 0 to deg - 1 do
    //  begin
    //          s := string(I * 10);
    //          ComboBox_cnt.Items.add(s);
    //end;
    ComboBox_questNum.Items.Add(IntToStr(typeTot));

    if ComboBox_questNum.Items.Count > 0 then
    begin
        ComboBox_questNum.ItemIndex := 0;
    end;
end;

// Sequence?????? ????????.
procedure TForm1.CheckBox_seqClick(Sender: TObject);
begin

end;


// ???? ???????? Except??????.
procedure TForm1.CheckBox_exceptClick(Sender: TObject);
begin
    if CheckBox_except.Checked then
    begin
        bank.UpdateExceptDB(1);
    end
    else
    begin
        bank.UpdateExceptDB(0);
    end;

end;

procedure TForm1.UpDown_solveClick(Sender: TObject; Button: TUDBtnType);
begin
    Edit_solveTime.Text := IntToStr(UpDown_solve.Position);
end;

procedure TForm1.UpDown_checkClick(Sender: TObject; Button: TUDBtnType);
begin
    Edit_checkTime.Text := IntToStr(UpDown_check.Position);
end;




procedure TForm1.oneQuestion;
var
    i : Integer;
begin
    Memo_Qst.Clear;
    Memo_Sub.Clear;
    Memo_Sol.Clear;
    Memo_Status.Clear;

    Edit_QType.Clear;
    Edit_QBook.Clear;
    Edit_QChapter.Clear;
    Edit_QQstCnt.Clear;
    Edit_QSucCnt.Clear;

    Edit_pattern.Clear;

    CheckBox_except.Enabled := False;

    timeSumSolve := 0;
    timeSumCheck := 0;

    ProgressBar_solveColor.Width := 0;
    ProgressBar_checkColor.Width := 0;

    // ?????????? ???? ???? -> ????, ???? -> ????
    if (bank.OneQuestion = 1) then
    begin
        if methodQst = 0 then
        begin
            Memo_Qst.Text := bank.questions[bank.idxCnt].korsnt;
        end
        else
        begin
            Memo_Qst.Text := bank.questions[bank.idxCnt].engsnt;
        end;

        // exclude?? ???? ??
        if bank.questions[bank.idxCnt].exclude = 1 then
        begin
            CheckBox_except.Checked := True;
        end
        else
        begin
            CheckBox_except.Checked := False;
        end;

        // pattern?? ???????? ????????.
        if CheckBox_patternHide.Checked = False then
        begin
            Edit_pattern.Text := bank.questions[bank.idxCnt].pattern;
        end;
    end
    else
    begin

    end;
end;



procedure TForm1.ComboBox_questMethodChange(Sender: TObject);
begin
    methodQst := ComboBox_questMethod.ItemIndex;
end;


// ???? ???? ???? ????
procedure TForm1.Button_SetClick(Sender: TObject);
var
    sql : string;
begin

    typeTotInit;

    // speed button check
    isSpeed := 0;
    if CheckBox_speed.Checked = true then
        isSpeed := 1;

    // bank?? ReSet????.
    bank.ReSet;

    // ???? ??????????
    Edit_totCnt.Text := IntToStr(bank.totCnt);
    if (bank.typeCnt >= 1) then
    begin
        // ?????? ???? ????????.
        oneQuestion;
        Edit_idxCnt.Text := IntToStr(bank.idxCnt + 1);
        Edit_sucCnt.Text := IntToStr(bank.sucCnt);


        // ???? ???? ???? ?????? ????????.
        Edit_QQstCnt.Text := IntToStr(bank.questions[bank.idxCnt].qstcnt);
        Edit_QSucCnt.Text := IntToStr(bank.questions[bank.idxCnt].succnt);
        status := gsGameChecked;
        if isSpeed = 1 then
        begin
            Button_true.Show;
            Button_false.Show;
            Button_Submit.Hide;
            Button_true.Caption := 'Shw Ans';
            Button_false.Caption := 'Shw Ans';
            status := gsGameShowAnsered;
        end
        else
        begin
            Button_true.Hide;
            Button_false.Hide;
            Button_Submit.Show;
            status := gsGameChecked;
        end;

        // timer?? ????????. progress bar???? ????????.
        timerCheck;

    end
    else
    begin
        Edit_idxCnt.Text := IntToStr(0);
        Edit_sucCnt.Text := IntToStr(0);
        status := gsGaveOver;
    end;

end;



procedure TForm1.Button_SubmitClick(Sender: TObject);
var
    issuc : Integer;
    subStr : String;
    solStr : String;
    isTrue : Boolean;
    ratio : Double;
begin
    if status = gsGaveOver then
    begin
        // ?????????? ???? Full up????
        // Timer?? ???? ??????.
        // ????????????
        if CheckBox_timer.Checked then
        begin
            if ProgressBar_checkColor.Width >= ProgressBar_check.Width then
            begin
                ProgressBar_checkColor.Width := ProgressBar_check.Width;
                checkExpired := True;
                Timer1.Enabled := False;
            end else begin
                Timer1.Enabled := True;
                exit;
            end;
        end;


        // bank?? clear????.
        // bank.Clear;

        // Sequcense??????????
        if CheckBox_seq.Checked then begin
            if ( ( ComboBox_pattern.GetCount > (ComboBox_pattern.ItemIndex + 1) ) and ( ComboBox_pattern.ItemIndex > 0 ) ) then begin
                ComboBox_pattern.ItemIndex := ComboBox_pattern.ItemIndex + 1;

                ComboBox_patternChange(sender);
                Button_SetClick(sender);
            end else begin
                if ComboBox_type.GetCount > (ComboBox_type.ItemIndex + 2) then begin
                    ComboBox_type.ItemIndex := ComboBox_type.ItemIndex + 1;
                    ComboBox_pattern.ItemIndex := 1;
                    ComboBox_typeChange(sender);

                    Button_SetClick(sender);
                end else begin
                end;
           end;
        end;

    end
    else if status = gsGameSubmited then
    begin
        // ???????? ??????????
        Edit_QType.Clear;
        Edit_QBook.Clear;
        Edit_QChapter.Clear;
        Edit_QQstCnt.Clear;
        Edit_QSucCnt.Clear;

        // ?????? ??????????.
        ProgressBar_solveColor.Width := 0;
        ProgressBar_checkColor.Width := 0;

        // ???????? ????????.
        oneQuestion;
        Edit_idxCnt.Text := IntToStr(bank.idxCnt + 1);

        // ???? ???? ???? ?????? ????????.
        Edit_QQstCnt.Text := IntToStr(bank.questions[bank.idxCnt].qstcnt);
        Edit_QSucCnt.Text := IntToStr(bank.questions[bank.idxCnt].succnt);

        if isSpeed = 1 then
        begin
            status := gsGameShowAnsered;
        end
        else
        begin
            status := gsGameChecked;
        end;
    end
    else if status = gsGameChecked then
    begin
        // except check ebable
        CheckBox_except.Enabled := True;

       // ???? ????????
        Edit_QType.Text := bank.questions[bank.idxCnt].rtype;
        Edit_QBook.Text := bank.questions[bank.idxCnt].book;
        Edit_QChapter.Text := bank.questions[bank.idxCnt].chapter;

        Memo_Sol.Clear;
        if methodQst = 0 then
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].engsnt);
        end
        else
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].korsnt);
        end;

        // ????????????
        if CheckBox_timer.Checked then
        begin
            ProgressBar_solveColor.Width := ProgressBar_solve.Width;
            ProgressBar_checkColor.Width := 0;
            solveExpired := True;
        end;

        // ???? ????????
        subStr := Memo_sub.Lines.Text;
        solStr := bank.questions[bank.idxCnt].engsnt;

        if isSpeed = 1 then
        begin
            isTrue := whichBtn;
        end
        else // ????????
        begin
            isTrue := false;
            if CompareText(subStr, solStr) = 0 then
                isTrue := true;
        end;

        if isTrue then
        begin
            // ?????? ????,????count?????? DB????
            bank.UpdateDB(1);
            Edit_sucCnt.Text := IntToStr(bank.sucCnt);
            Memo_Status.Lines.Add('True');
        end
        else
        begin
            // ?????? ????count???????? DB????
            Memo_Status.Lines.Add('False');
            bank.UpdateDB(0);
        end;

        // ?????? ????????
        // ???? ???????? ???? ???? Hide
        if bank.totCnt <= bank.idxCnt + 1 then
        begin
            Button_Submit.Hide;
            Button_true.Hide;
            Button_false.Hide;
            status := gsGaveOver;


            // ???????? ????
            Memo_Status.Lines.Add('' );
            Memo_Status.Lines.Add('--- ?? ?? ---' );
            Memo_Status.Lines.Add(IntToStr(bank.totCnt) + '???? ???? ' + IntToStr(bank.sucCnt) + '?????? ????????????.' );
            ratio := Round( (bank.sucCnt) / bank.totCnt * 100 );
            Memo_Status.Lines.Add('?????? ' + FloatToStr( ratio ) + ' ???? ???? ??????????.' );


            // ?????????? ???? Full up????
            // Timer?? ???? ??????.
            // ????????????
            if CheckBox_timer.Checked then
            begin
                if ProgressBar_checkColor.Width >= ProgressBar_check.Width then
                begin
                    ProgressBar_checkColor.Width := ProgressBar_check.Width;
                    checkExpired := True;
                    Timer1.Enabled := False;
                end else begin
                    Timer1.Enabled := True;
                    exit;
//                    ShowMessage('anpro' + #13#10'Press OK to continue script execution');
//                    Continue;
                end;
            end;


            // bank?? clear????.
            // bank.Clear;

            // Sequcense??????????
            if CheckBox_seq.Checked then begin
                if ( ( ComboBox_pattern.GetCount > (ComboBox_pattern.ItemIndex + 1) ) and ( ComboBox_pattern.ItemIndex > 0 ) ) then begin
                    ComboBox_pattern.ItemIndex := ComboBox_pattern.ItemIndex + 1;

                    ComboBox_patternChange(sender);
                    Button_SetClick(sender);
                end else begin
                    if ComboBox_type.GetCount > (ComboBox_type.ItemIndex + 2) then begin
                        ComboBox_type.ItemIndex := ComboBox_type.ItemIndex + 1;
                        ComboBox_pattern.ItemIndex := 1;
                        ComboBox_typeChange(sender);

                        Button_SetClick(sender);
                    end else begin
                    end;
               end;
            end;
        end
        else
        begin
            status := gsGameSubmited;
        end;

        // ?? ???????? ???? ????????.
        typeTotInit;
    end
    else  // gsGamePaused
    begin

    end;
end;

procedure TForm1.Button_trueClick(Sender: TObject);
begin
    if status = gsGaveOver then
    begin
       Button_SubmitClick(Sender);
    end
    else if status = gsGameSubmited then
    begin
        Button_SubmitClick(Sender);
        Button_true.Caption := 'Shw Ans';
        Button_false.Caption := 'Shw Ans';
    end
    else if status = gsGameShowAnsered then
    begin
        // ???? ????????
        Edit_QType.Text := bank.questions[bank.idxCnt].rtype;
        Edit_QBook.Text := bank.questions[bank.idxCnt].book;
        Edit_QChapter.Text := bank.questions[bank.idxCnt].chapter;

        Memo_Sol.Clear;
        if methodQst = 0 then
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].engsnt);
        end
        else
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].korsnt);
        end;
        status := gsGameChecked;
        Button_true.Caption := 'True';
        Button_false.Caption := 'False';
    end
    else if status = gsGameChecked then
    begin
        whichBtn := true;
        Button_SubmitClick(Sender);
        Button_true.Caption := 'Next';
        Button_false.Caption := 'Next';
    end;
end;


procedure TForm1.Button_pauseClick(Sender: TObject);
begin
    if CheckBox_timer.Checked and solveExpired = True then
    begin
        if Timer1.Enabled then
        begin
            Timer1.Enabled := False;
            Button_pause.Caption := 'Restart';
        end else begin
            Timer1.Enabled := True;
            Button_pause.Caption := 'Pause';
        end;
    end;
end;

// ?????? ???? ???? ???? ????
procedure TForm1.Button_saveClick(Sender: TObject);
var
    FHandle : HWND;
    msg1, msg2 : String;
    ret : Integer;
    tp, ptn, esnt, ksnt, bk, chp: String;
    tp1, ptn1, esnt1, ksnt1, bk1, chp1: String;
begin
    ret := -1;
    msg1 := '?????? ???????? ?????????????????';
    msg2 := '???? ???????? ??????????????!';
    if bank.idxCnt = -1 then begin
        //
        ret := MessageBox(0, PWideChar(msg1), 'sql', MB_OK);
    end else begin

        if Edit_pattern.Text = '' then begin
            ptn := bank.questions[bank.idxCnt].pattern;
        end else begin
            ptn := Edit_pattern.Text;
        end;

        if Edit_QType.Text = '' then
            Exit;
        if Memo_Qst.Lines.Text = '' then
            Exit;
        if Memo_Sol.Lines.Text = '' then
            Exit;
        if Edit_QBook.Text = '' then
            Exit;
        if Edit_QChapter.Text = '' then
            Exit;

        if ComboBox_questMethod.ItemIndex = 0 then  // kor -> eng
        begin
            esnt := Memo_Sol.Text;
            ksnt := Memo_Qst.Text;
        end else begin
            esnt := Memo_Qst.Text;
            ksnt := Memo_Sol.Text;
        end;

        tp := Edit_QType.Text;
        bk := Edit_QBook.Text;
        chp := Edit_QChapter.Text;

        tp1 := ReplaceStr(tp);
        ptn1 := ReplaceStr(ptn);
        esnt1 := ReplaceStr(esnt);
        ksnt1 := ReplaceStr(ksnt);
        bk1 := ReplaceStr(bk);
        chp1 := ReplaceStr(chp);
        bank.UpdateRecordDB(bank.idxCnt, tp1, ptn1, esnt1, ksnt1, bk1, chp1);
        ret := MessageBox(0, PWideChar(msg2), 'sql', MB_OK);
    end;

end;

procedure TForm1.Button_falseClick(Sender: TObject);
begin
    if status = gsGaveOver then
    begin
       Button_SubmitClick(Sender);
    end
    else if status = gsGameSubmited then
    begin
        Button_SubmitClick(Sender);
        Button_true.Caption := 'Shw Ans';
        Button_false.Caption := 'Shw Ans';
    end
    else if status = gsGameShowAnsered then
    begin
        // ???? ????????
        Edit_QType.Text := bank.questions[bank.idxCnt].rtype;
        Edit_QBook.Text := bank.questions[bank.idxCnt].book;
        Edit_QChapter.Text := bank.questions[bank.idxCnt].chapter;

        Memo_Sol.Clear;
        if methodQst = 0 then
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].engsnt);
        end
        else
        begin
            Memo_Sol.Lines.Add(bank.questions[bank.idxCnt].korsnt);
        end;
        status := gsGameChecked;
        Button_true.Caption := 'True';
        Button_false.Caption := 'False';
    end
    else if status = gsGameChecked then
    begin
        whichBtn := false;
        Button_SubmitClick(Sender);
        Button_true.Caption := 'Next';
        Button_false.Caption := 'Next';
    end;
end;



// Timer???? ??????

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    timerCheck;
    Exit;
end;


procedure TForm1.CheckBox_timerClick(Sender: TObject);
begin
    if CheckBox_timer.Checked then
    begin
//        Edit_solveTime.Enabled := True;
//        Edit_checkTime.Enabled := True;

        Edit_solveTime.Text := IntToStr(UpDown_solve.Position);
        Edit_checkTime.Text := IntToStr(UpDown_check.Position);
    end
    else
    begin
//        Edit_solveTime.Enabled := False;
//        Edit_checkTime.Enabled := False;

        Edit_solveTime.Text := '';
        Edit_checkTime.Text := '';
    end;

end;


// timercheck ????
procedure TForm1.timerCheck;
var
    issuc : Integer;
    subStr : String;
    solStr : String;
    isTrue : Boolean;
    ratio, r2 : Double;
    Sender: TObject;
begin
    if CheckBox_timer.Checked then
    begin
        Timer1.Enabled := true;

        if ProgressBar_solveColor.Width < ProgressBar_solve.Width then begin
            timeSumSolve := timeSumSolve + Timer1.Interval / (StrToInt(Edit_solveTime.Text) * 10);
            ProgressBar_solveColor.Width := Round( timeSumSolve * ProgressBar_solve.Width / 100 );
            solveExpired := False;
        end else if ( ProgressBar_solveColor.Width >= ProgressBar_solve.Width ) then
        begin
            if solveExpired = False then begin
                solveExpired := True;
                // ???? false?????? ????.
                if CheckBox_speed.Checked then begin
                    Button_falseClick(Sender);
                    Button_falseClick(Sender);
                end else begin
                    Button_SubmitClick(Sender);
                end;
            end else begin
                // ProgressBar_check?? ?????? ????
                if ProgressBar_checkColor.Width < ProgressBar_check.Width then begin
                    timeSumCheck := timeSumCheck + Timer1.Interval / (StrToInt(Edit_checkTime.Text) * 10);
                    ProgressBar_checkColor.Width := Round( timeSumCheck * ProgressBar_check.Width / 100 );
                    checkExpired := False;
                end else if ( ProgressBar_checkColor.Width >= ProgressBar_check.Width ) then begin
//                    if checkExpired = False then begin
                        checkExpired := True;
                        // ???????? ???? ???? ???? ???? ?????? ????.
                        if CheckBox_speed.Checked then begin
                            Button_falseClick(Sender);
                        end else begin
                            Button_SubmitClick(Sender);
                        end;
//                    end;
                end;
            end;
        end;
    end;
end;



procedure TForm1.Timer_watchTimer(Sender: TObject);
var
    mid : String;
begin
    GetLocalTime(myTime);
    mid := ' AM';
    if myTime.wHour > 11 then begin
        mid := ' PM';
    end;

    if myTime.wHour > 12 then begin
        myTime.wHour := myTime.wHour - 12;
    end;

    Edit_watch.Text :=  Format('%04d-%02d-%02d %2s %02d:%02d:%02d', [myTime.wYear, myTime.wMonth, myTime.wDay, mid, myTime.wHour, myTime.wMinute, myTime.wSecond]);
end;


// '?? ''?? ?????????? ????
function TForm1.ReplaceStr(old : String) : String;
var
ss1 : String;
I, C:Integer;
OldC : Char;
begin
    C := 0;
    I := 0;

    while C < old.Length do
    begin
        case old.Chars[C] of
            '''': begin
                OldC := old.Chars[C];
                ss1.Insert(I, OldC);
                Inc(I);
            end;
         end;

        OldC := old.Chars[C];
        ss1.Insert(I, OldC);
        Inc(I);
        Inc(C);
    end;
    Result := ss1;
end;


end.
