object dmHoardHelperCtrl: TdmHoardHelperCtrl
  OldCreateOrder = False
  Height = 259
  Width = 353
  object DWS: TDelphiWebScript
    Left = 88
    Top = 96
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
end
