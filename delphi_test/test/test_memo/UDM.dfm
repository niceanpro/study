object DM: TDM
  OldCreateOrder = False
  Height = 313
  Width = 670
  object SQLConnection1: TSQLConnection
    ConnectionName = 'SampleConnection'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver200.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=20.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver200.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=20.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=localhost'
      'Database=jspdb'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=anpro'
      'Password=anali'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Connected = True
    Left = 32
    Top = 24
  end
  object Insa: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'INSA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AGE'
        DataType = ftInteger
      end
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CLASS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IPSA_DATE'
        DataType = ftDate
      end
      item
        Name = 'SALARY'
        DataType = ftInteger
      end
      item
        Name = 'PHOTO'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'GRADE'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'i_id'
        Fields = 'id'
      end
      item
        Name = 'i_name'
        Fields = 'name'
      end
      item
        Name = 'i_dept'
        Fields = 'dept_code'
      end>
    IndexFieldNames = 'id'
    Params = <>
    StoreDefs = True
    BeforeInsert = InsaBeforeInsert
    OnNewRecord = InsaNewRecord
    AfterApplyUpdates = InsaAfterApplyUpdates
    Left = 128
    Top = 24
  end
  object InsaSource: TDataSource
    DataSet = Insa
    Left = 200
    Top = 24
  end
  object Dept: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'DEPT'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 128
    Top = 88
  end
  object DeptSource: TDataSource
    DataSet = Dept
    Left = 200
    Top = 88
  end
  object InsaQuery: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'select * from insa'#13#10' where dept_code = :code'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptInput
      end>
    Params = <>
    Left = 128
    Top = 168
  end
  object InsaQuerySource: TDataSource
    Left = 200
    Top = 168
  end
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'anpro'
    Active = True
    CommandText = 'select * from test'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 584
    Top = 32
  end
  object SQLStoredProc1: TSQLStoredProc
    Active = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Size = 10
        Value = 0
      end
      item
        DataType = ftWideString
        Precision = 128
        Name = '@diagramname'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 10
        Name = '@owner_id'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    StoredProcName = 'sp_helpdiagrams'
    Left = 400
    Top = 160
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 408
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 480
    Top = 72
    object ClientDataSet1CODE: TStringField
      FieldName = 'CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object ClientDataSet1DEPT: TStringField
      FieldName = 'DEPT'
      ProviderFlags = [pfInWhere]
    end
    object ClientDataSet1SECTION: TStringField
      FieldName = 'SECTION'
      ProviderFlags = []
    end
  end
  object SQLQuery1: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from dept')
    SQLConnection = SQLConnection1
    Left = 320
    Top = 72
    object SQLQuery1CODE: TStringField
      FieldName = 'CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object SQLQuery1DEPT: TStringField
      FieldName = 'DEPT'
      ProviderFlags = [pfInWhere]
    end
    object SQLQuery1SECTION: TStringField
      FieldName = 'SECTION'
      ProviderFlags = []
    end
  end
end
