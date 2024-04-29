object HHContext: THHContext
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 259
  Width = 353
  object DWS: TDelphiWebScript
    Config.MaxExceptionDepth = 20
    Config.CompileFileSystem = NoFS
    Config.RuntimeFileSystem = NoFS
    Left = 40
    Top = 32
  end
  object FileUtils: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'FileExists'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsFileExistsEval
      end
      item
        Name = 'DirExists'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsDirExistsEval
      end
      item
        Name = 'GetFiles'
        Parameters = <
          item
            Name = 'Dir'
            DataType = 'String'
          end
          item
            Name = 'SearchPattern'
            DataType = 'String'
            HasDefaultValue = True
            DefaultValue = '*.*'
          end
          item
            Name = 'Recursive'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = 'False'
          end>
        ResultType = 'array of String'
        OnEval = FileUtilsFunctionsListFilesEval
      end
      item
        Name = 'GetDirs'
        Parameters = <
          item
            Name = 'Dir'
            DataType = 'String'
          end
          item
            Name = 'SearchPattern'
            DataType = 'String'
            HasDefaultValue = True
            DefaultValue = '*'
          end
          item
            Name = 'Recursive'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = 'False'
          end>
        ResultType = 'array of String'
        OnEval = FileUtilsFunctionsGetDirsEval
      end
      item
        Name = 'ExtractFileName'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsExtractFileNameEval
      end
      item
        Name = 'ExtractFileNameWithoutExt'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsExtractFileNameWithoutExtEval
      end
      item
        Name = 'ExtractFilePath'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsExtractFilePathEval
      end
      item
        Name = 'ExtractFileExt'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsExtractFileExtEval
      end
      item
        Name = 'PathCombine'
        Parameters = <
          item
            Name = 'P1'
            DataType = 'String'
          end
          item
            Name = 'P2'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsPathCombineEval
      end
      item
        Name = 'GetParentDir'
        Parameters = <
          item
            Name = 'Path'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsGetParentDirEval
      end
      item
        Name = 'GetGenericFileType'
        Parameters = <
          item
            Name = 'Ext'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsGetGenericFileTypeEval
      end
      item
        Name = 'FileInUse'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsFileInUseEval
      end
      item
        Name = 'OpenFile'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        OnEval = FileUtilsFunctionsOpenFileEval
      end
      item
        Name = 'MoveFile'
        Parameters = <
          item
            Name = 'Source'
            DataType = 'String'
          end
          item
            Name = 'Dest'
            DataType = 'String'
          end
          item
            Name = 'Overwrite'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = 'False'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsMoveFileEval
      end
      item
        Name = 'CopyFile'
        Parameters = <
          item
            Name = 'Source'
            DataType = 'String'
          end
          item
            Name = 'Dest'
            DataType = 'String'
          end
          item
            Name = 'Overwrite'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = 'False'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsCopyFileEval
      end
      item
        Name = 'DeleteFile'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
      end
      item
        Name = 'CreateDir'
        Parameters = <
          item
            Name = 'Path'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsCreateDirEval
      end
      item
        Name = 'MoveDir'
        ResultType = 'Boolean'
      end
      item
        Name = 'CopyDir'
        ResultType = 'Boolean'
      end
      item
        Name = 'DeleteDir'
        Parameters = <
          item
            Name = 'Dir'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
      end
      item
        Name = 'GetFileSize'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Integer'
        OnEval = FileUtilsFunctionsGetFileSizeEval
      end
      item
        Name = 'GetFileSizeStr'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsGetFileSizeStrEval
      end
      item
        Name = 'GetFileDateModified'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsGetFileDateModifiedEval
      end
      item
        Name = 'SaveTextFile'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end
          item
            Name = 'Data'
            DataType = 'array of String'
          end
          item
            Name = 'Overwrite'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = 'False'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsSaveTextFileEval
      end
      item
        Name = 'BackupFile'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsBackupFileEval
      end
      item
        Name = 'RenameFile'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end
          item
            Name = 'NewName'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsRenameFileEval
      end
      item
        Name = 'RenameDir'
        Parameters = <
          item
            Name = 'DirName'
            DataType = 'String'
          end
          item
            Name = 'NewName'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsRenameDirEval
      end
      item
        Name = 'OpenFileLocation'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsOpenFileLocationEval
      end
      item
        Name = 'MakeFilter'
        Parameters = <
          item
            Name = 'S'
            DataType = 'String'
          end
          item
            Name = 'Filter'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsMakeFilterEval
      end
      item
        Name = 'MoveFileUpAFolder'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = FileUtilsFunctionsMoveFileUpAFolderEval
      end>
    UnitName = 'FileUtils'
    StaticSymbols = False
    Left = 88
    Top = 88
  end
  object StrUtils: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'Copy'
        Parameters = <
          item
            Name = 'S'
            DataType = 'String'
          end
          item
            Name = 'Index'
            DataType = 'Integer'
          end
          item
            Name = 'Count'
            DataType = 'Integer'
          end>
        ResultType = 'String'
        OnEval = StrUtilsFunctionsCopyEval
      end
      item
        Name = 'Pos'
        Parameters = <
          item
            Name = 'SubStr'
            DataType = 'String'
          end
          item
            Name = 'Str'
            DataType = 'String'
          end
          item
            Name = 'Offset'
            DataType = 'Integer'
            HasDefaultValue = True
            DefaultValue = '1'
          end>
        ResultType = 'Integer'
        OnEval = StrUtilsFunctionsPosEval
      end
      item
        Name = 'UpperCase'
        Parameters = <
          item
            Name = 'Str'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = StrUtilsFunctionsUpperCaseEval
      end
      item
        Name = 'LowerCase'
        Parameters = <
          item
            Name = 'Str'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = StrUtilsFunctionsLowerCaseEval
      end
      item
        Name = 'Delete'
        Parameters = <
          item
            Name = 'S'
            DataType = 'String'
            IsVarParam = True
          end
          item
            Name = 'Index'
            DataType = 'Integer'
          end
          item
            Name = 'Count'
            DataType = 'Integer'
          end>
        OnEval = StrUtilsFunctionsDeleteEval
      end
      item
        Name = 'sLineBreak'
        ResultType = 'String'
        OnEval = StrUtilsFunctionssLineBreakEval
      end
      item
        Name = 'sTab'
        ResultType = 'String'
        OnEval = StrUtilsFunctionssTabEval
      end
      item
        Name = 'SplitString'
        Parameters = <
          item
            Name = 'S'
            DataType = 'String'
          end
          item
            Name = 'Delimiter'
            DataType = 'String'
          end>
        ResultType = 'array of String'
        OnEval = StrUtilsFunctionsSplitStringEval
      end>
    UnitName = 'StrUtils'
    StaticSymbols = False
    Left = 136
    Top = 32
  end
  object HHUtils: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'GetTickCount'
        ResultType = 'Integer'
        OnEval = HHUtilsFunctionsGetTickCountEval
      end
      item
        Name = 'PrintLn'
        Parameters = <
          item
            Name = 'S'
            DataType = 'String'
          end>
        OnEval = HHUtilsFunctionsPrintLnEval
      end
      item
        Name = 'BeginPrintLn'
        OnEval = HHUtilsFunctionsBeginPrintLnEval
      end
      item
        Name = 'EndPrintLn'
        OnEval = HHUtilsFunctionsEndPrintLnEval
      end
      item
        Name = 'GetLibFilter'
        Parameters = <
          item
            Name = 'LibName'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = HHUtilsFunctionsGetLibFilterEval
      end>
    UnitName = 'HHUtils'
    StaticSymbols = False
    Left = 88
    Top = 32
  end
  object TagUtils: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'ExtractID3v1'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'array of String'
        OnEval = TagUtilsFunctionsExtractID3v1Eval
      end
      item
        Name = 'GetTags'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'array of String'
        OnEval = TagUtilsFunctionsGetTagsEval
      end
      item
        Name = 'ExtractTag'
        Parameters = <
          item
            Name = 'Tags'
            DataType = 'array of String'
          end
          item
            Name = 'Name'
            DataType = 'String'
          end>
        ResultType = 'String'
        OnEval = TagUtilsFunctionsExtractTagEval
      end>
    UnitName = 'TagUtils'
    StaticSymbols = False
    Left = 136
    Top = 88
  end
  object NoFS: TdwsNoFileSystem
    Left = 40
    Top = 88
  end
  object DataUtils: TdwsUnit
    Script = DWS
    Classes = <
      item
        Name = 'TDataSetCol'
        Constructors = <
          item
            Name = 'Create'
            OnEval = DataUtilsClassesTDataSetColConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FCaption'
            DataType = 'String'
            Visibility = cvPrivate
          end
          item
            Name = 'FWidth'
            DataType = 'Integer'
            Visibility = cvPrivate
          end
          item
            Name = 'FColType'
            DataType = 'TDataSetColType'
            Visibility = cvPrivate
          end
          item
            Name = 'FAutoSize'
            DataType = 'Boolean'
            Visibility = cvPrivate
          end
          item
            Name = 'FAlign'
            DataType = 'TDataSetColAlign'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetAsString'
            ResultType = 'String'
            Kind = mkFunction
            OnEval = DataUtilsClassesTDataSetColMethodsGetAsStringEval
          end
          item
            Name = 'SetAsString'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
            OnEval = DataUtilsClassesTDataSetColMethodsSetAsStringEval
          end
          item
            Name = 'GetAsInteger'
            ResultType = 'Integer'
            Kind = mkFunction
            OnEval = DataUtilsClassesTDataSetColMethodsGetAsIntegerEval
          end
          item
            Name = 'SetAsInteger'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
            OnEval = DataUtilsClassesTDataSetColMethodsSetAsIntegerEval
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'String'
            Visibility = cvPublished
            ReadAccess = 'FCaption'
            WriteAccess = 'FCaption'
          end
          item
            Name = 'Width'
            DataType = 'Integer'
            Visibility = cvPublished
            ReadAccess = 'FWidth'
            WriteAccess = 'FWIdth'
          end
          item
            Name = 'ColType'
            DataType = 'TDataSetColType'
            Visibility = cvPublished
            ReadAccess = 'FColType'
            WriteAccess = 'FColType'
          end
          item
            Name = 'AutoSize'
            DataType = 'Boolean'
            Visibility = cvPublished
            ReadAccess = 'FAutoSize'
            WriteAccess = 'FAutoSize'
          end
          item
            Name = 'Align'
            DataType = 'TDataSetColAlign'
            Visibility = cvPublished
            ReadAccess = 'FAlign'
            WriteAccess = 'FAlign'
          end
          item
            Name = 'AsString'
            DataType = 'String'
            ReadAccess = 'GetAsString'
            WriteAccess = 'SetAsString'
          end
          item
            Name = 'AsInteger'
            DataType = 'Integer'
            ReadAccess = 'GetAsInteger'
            WriteAccess = 'SetAsInteger'
          end>
      end
      item
        Name = 'TDataSet'
        Constructors = <
          item
            Name = 'Create'
            OnEval = DataUtilsClassesTDataSetConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FTitle'
            DataType = 'String'
            Visibility = cvPrivate
          end>
        Properties = <
          item
            Name = 'Title'
            DataType = 'String'
            Visibility = cvPublished
            ReadAccess = 'FTitle'
            WriteAccess = 'FTitle'
          end>
      end>
    Enumerations = <
      item
        Name = 'TDataSetColType'
        Elements = <
          item
            Name = 'ctString'
          end
          item
            Name = 'ctInteger'
          end
          item
            Name = 'ctBoolean'
          end
          item
            Name = 'ctFloat'
          end>
      end
      item
        Name = 'TDataSetColAlign'
        Elements = <
          item
            Name = 'caLeft'
          end
          item
            Name = 'caRight'
          end
          item
            Name = 'caCenter'
          end>
      end>
    UnitName = 'DataUtils'
    StaticSymbols = False
    Left = 184
    Top = 32
  end
end
