object HHContext: THHContext
  OldCreateOrder = False
  Height = 259
  Width = 353
  object DWS: TDelphiWebScript
    Left = 56
    Top = 32
  end
  object FileUtils: TdwsUnit
    Script = DWS
    Functions = <
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
        ResultType = 'Boolean'
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
        Name = 'FileInUse'
        Parameters = <
          item
            Name = 'Filename'
            DataType = 'String'
          end>
        ResultType = 'Boolean'
        OnEval = FileUtilsFunctionsFileInUseEval
      end>
    UnitName = 'FileUtils'
    StaticSymbols = False
    Left = 144
    Top = 80
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
      end>
    UnitName = 'StrUtils'
    StaticSymbols = False
    Left = 144
    Top = 128
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
      end>
    UnitName = 'HHUtils'
    StaticSymbols = False
    Left = 144
    Top = 32
  end
  object IMDBUtils: TdwsUnit
    Script = DWS
    Functions = <
      item
        Name = 'SearchIMDB'
        ResultType = 'TIMDBInfo'
      end
      item
        Name = 'ExtractID3v1'
        ResultType = 'TID3v1Info'
      end
      item
        Name = 'ExtractID3v2'
        ResultType = 'TID3v2Info'
      end>
    Records = <
      item
        Name = 'TID3v1Info'
        Members = <>
        Properties = <>
      end
      item
        Name = 'TID3v2Info'
        Members = <>
        Properties = <>
      end
      item
        Name = 'TIMDBInfo'
        Members = <>
        Properties = <>
      end>
    UnitName = 'IMDBUtils'
    StaticSymbols = False
    Left = 224
    Top = 80
  end
end
