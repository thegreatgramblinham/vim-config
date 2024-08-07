" Vim syntax file
" Language: C#
" Author: Jeffrey Crochet <jlcrochet91@pm.me>
" URL: https://github.com/jlcrochet/vim-cs

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "cs"

" Syntax {{{1
syn sync fromstart

" Miscellaneous (low priority) {{{2
syn keyword csKeywordError contained
      \ abstract as
      \ base bool break byte
      \ case catch char checked class const continue
      \ decimal default delegate do double
      \ else enum event explicit extern
      \ false finally fixed float for foreach
      \ goto
      \ if implicit in int interface internal is
      \ lock long
      \ namespace new null
      \ object operator out override
      \ params private protected public
      \ readonly ref return
      \ sbyte sealed short sizeof stackalloc static string struct switch
      \ this throw true try typeof
      \ uint ulong unchecked unsafe ushort using
      \ virtual void volatile
      \ while

syn match csDelimiter /\%#=1,/ containedin=@csExtras
syn match csDelimiter /\%#=1;/ containedin=@csBlocks

syn region csBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contains=TOP fold

" LHS {{{2
syn keyword csStatement global alias

syn keyword csStatement class struct nextgroup=csTypeName skipwhite skipempty
syn match csTypeName /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGenericParameters nextgroup=csTypeBlock,csTypeInheritanceOperator,csTypeConstraint,csTypeConstructorParameters skipwhite skipempty
syn match csTypeName /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGenericParameters nextgroup=csTypeBlock,csTypeInheritanceOperator,csTypeConstructorParameters skipwhite skipempty
syn region csTypeConstructorParameters matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csType,csTypeIdentifier,csModifier,csCollectionExpressionOrAttributes nextgroup=csTypeBlock,csTypeInheritanceOperator,csTypeConstraint skipwhite skipempty
syn region csGenericParameters matchgroup=csDelimiter start=/\%#=1</ end=/\%#=1>/ contained contains=csGenericParameter,csModifier nextgroup=csTypeBlock skipwhite skipempty
syn match csGenericParameter /\%#=1\K\k*/ contained contains=csKeywordError
syn match csGenericParameter /\%#=1@\K\k*/ contained
syn match csTypeInheritanceOperator /\%#=1:/ contained nextgroup=csTypeInheritee,csTypeInheriteeKeyword skipwhite skipempty
syn match csTypeInheritee /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGeneric nextgroup=csTypeBlock,csTypeInheriteeMemberOperator,csTypeInheriteeComma,csTypeConstraint,csTypeInheriteeArguments,csTypeConstraintModifier skipwhite skipempty
syn match csTypeInheritee /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGeneric nextgroup=csTypeBlock,csTypeInheriteeMemberOperator,csTypeInheriteeComma,csTypeConstraint,csTypeInheriteeArguments,csTypeConstraintModifier skipwhite skipempty
syn keyword csTypeInheriteeKeyword contained nextgroup=csTypeBlock,csTypeInheriteeComma,csTypeConstraint,csTypeConstraintModifier skipwhite skipempty
      \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
      \ char bool object string void dynamic
      \ class struct enum default notnull
syn match csTypeConstraintModifier /\%#=1?/ contained nextgroup=csTypeInheriteeMemberOperator,csTypeInheriteeComma,csTypeConstraint skipwhite skipempty
syn keyword csTypeInheriteeKeyword new contained nextgroup=csTypeInheriteeArguments,csTypeInheritee skipwhite skipempty
syn keyword csTypeInheriteeKeyword managed unmanaged contained nextgroup=csTypeBlock,csTypeInheriteeComma skipwhite skipempty
syn region csTypeInheriteeArguments matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csTypeVariable nextgroup=csTypeBlock,csTypeInheriteeComma,csTypeConstraint,csTypeConstraintLambdaOperator skipwhite skipempty
syn match csTypeConstraintLambdaOperator /\%#=1=>/ contained nextgroup=csTypeInheriteeKeyword skipwhite skipempty
syn match csTypeInheriteeMemberOperator /\%#=1\./ contained nextgroup=csTypeInheritee,csTypeInheriteeKeyword skipwhite skipempty
syn match csTypeInheriteeComma /\%#=1,/ contained nextgroup=csTypeInheritee,csTypeInheriteeKeyword skipwhite skipempty
syn keyword csTypeConstraint where contained nextgroup=csTypeVariable skipwhite skipempty
syn match csTypeVariable /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csTypeInheritanceOperator skipwhite skipempty
syn match csTypeVariable /\%#=1@\K\k*/ contained nextgroup=csTypeInheritanceOperator skipwhite skipempty
syn region csTypeBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=csStatement,csModifier,csType,csTypeIdentifier,csBlock,csDeclaratorComma,csCollectionExpressionOrAttributes,csOperatorModifier,csTypeTuple,csConstructor fold

syn keyword csStatement interface nextgroup=csInterfaceName skipwhite skipempty
syn match csInterfaceName /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGenericParameters nextgroup=csTypeBlock,csTypeInheritanceOperator,csTypeConstraint skipwhite skipempty
syn match csInterfaceName /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGenericParameters nextgroup=csTypeBlock,csTypeInheritanceOperator skipwhite skipempty

syn keyword csStatement record nextgroup=csTypeName,csRecordModifier skipwhite skipempty
syn keyword csRecordModifier class struct contained nextgroup=csTypeName skipwhite skipempty

syn match csDestructorSign /\%#=1\~/ contained containedin=csTypeBlock nextgroup=csDestructor skipwhite skipempty
syn match csDestructor /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csParameters skipwhite skipempty
syn match csDestructor /\%#=1@\K\k*/ contained nextgroup=csParameters skipwhite skipempty

syn keyword csStatement enum nextgroup=csEnumName skipwhite skipempty
syn match csEnumName /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csEnumBlock,csEnumInheritanceOperator skipwhite skipempty
syn match csEnumName /\%#=1@\K\k*/ contained nextgroup=csEnumBlock,csEnumInheritanceOperator skipwhite skipempty
syn match csEnumInheritanceOperator /\%#=1:/ contained nextgroup=csEnumType skipwhite skipempty
syn keyword csEnumType byte sbyte short ushort int uint long ulong nint nuint contained nextgroup=csEnumBlock skipwhite skipempty
syn region csEnumBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=csDeclarator fold

syn keyword csStatement namespace nextgroup=csNamespaceName skipwhite skipempty
syn match csNamespaceName /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csNamespaceNameSeparator,csNamespaceBlock skipwhite skipempty
syn match csNamespaceName /\%#=1@\K\k*/ contained nextgroup=csNamespaceNameSeparator,csNamespaceBlock skipwhite skipempty
syn match csNamespaceNameSeparator /\%#=1\./ contained nextgroup=csNamespaceName skipwhite skipempty
syn region csNamespaceBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=TOP fold

syn keyword csStatement if switch while nextgroup=csCondition skipwhite skipempty
syn region csCondition matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csRHS nextgroup=csBlock skipwhite skipempty

syn keyword csStatement else do nextgroup=csBlock skipwhite skipempty

syn keyword csStatement case nextgroup=@csPatterns skipwhite skipempty

syn keyword csStatement default

syn keyword csStatement for foreach nextgroup=csIteratorExpression skipwhite skipempty
syn region csIteratorExpression matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=TOP nextgroup=csBlock skipwhite skipempty

syn keyword csStatement break continue yield

syn keyword csStatement goto

syn keyword csStatement return throw nextgroup=@csRHS skipwhite skipempty

syn keyword csStatement try finally nextgroup=csBlock skipwhite skipempty
syn keyword csStatement catch nextgroup=csCatchCondition skipwhite skipempty
syn region csCatchCondition matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csTypeIdentifier nextgroup=csOperatorKeyword,csBlock skipwhite skipempty

syn keyword csStatement checked unchecked nextgroup=csBlock skipwhite skipempty

syn keyword csStatement lock nextgroup=csCondition skipwhite skipempty

syn keyword csModifier
      \ abstract async
      \ const
      \ event explicit extern
      \ fixed
      \ implicit in internal
      \ new
      \ out override
      \ params partial private protected public
      \ ref readonly required
      \ sealed static
      \ unsafe
      \ virtual volatile

syn keyword csModifier delegate nextgroup=csFunctionPointerModifier skipwhite skipempty
syn match csFunctionPointerModifier /\%#=1\*/ contained nextgroup=csGeneric,csFunctionPointerManaged skipwhite skipempty
syn keyword csFunctionPointerManaged managed unmanaged contained nextgroup=csGeneric,csFunctionPointerTypes skipwhite skipempty
syn region csFunctionPointerTypes matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contained contains=csTypeIdentifier nextgroup=csGeneric skipwhite skipempty

syn keyword csStatement using nextgroup=csGuardedStatement,csStatement,csIdentifier,csUsingStatic skipwhite skipempty
syn keyword csUsingStatic static contained nextgroup=csIdentifier skipwhite skipempty
syn keyword csStatement fixed nextgroup=csGuardedStatement skipwhite skipempty
syn region csGuardedStatement matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=TOP

syn keyword csOperatorModifier operator nextgroup=csOperatorMethod,csBooleanOperatorMethod,csConversionMethod,csConversionMethodKeyword skipwhite skipempty
syn match csOperatorMethod /\%#=1\%(++\=\|--\=\|[~*/%&|^]\|[=!]=\|<[<=]\=\|>[>=]\=\|\.\.\)/ contained nextgroup=csParameters skipwhite skipempty
syn keyword csBooleanOperatorMethod true false contained nextgroup=csParameters skipwhite skipempty
syn match csConversionMethod /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csParameters skipwhite skipempty
syn match csConversionMethod /\%#=1@\K\k*/ contained nextgroup=csParameters skipwhite skipempty
syn keyword csConversionMethodKeyword contained nextgroup=csParameters skipwhite skipempty
      \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
      \ char bool object string void dynamic

syn keyword csType nextgroup=csDeclarator,csIndexerThis,csMemberOperator,csInvocation,csTypeModifier,csOperatorModifier skipwhite skipempty
      \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
      \ char bool object string void dynamic

syn keyword csStatement var nextgroup=csDeclarator,csTupleDeclarator skipwhite skipempty
syn region csTupleDeclarator matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csDeclarator,csTupleDeclarator nextgroup=csAssignmentOperator skipwhite skipempty

syn match csIdentifier /\%#=1@\=\K\k*\%(<.\{-}>\)\=\%([*?]\.\@!\|\[.\{-}\]\)*/ contains=csGeneric,csTypeModifier nextgroup=csDeclarator,csIndexerThis,@csOperators,csInvocation,csIndex,csOperatorModifier,csPropertyBlock,csTypeMemberOperator skipwhite skipempty
syn region csGeneric matchgroup=csDelimiter start=/\%#=1</ end=/\%#=1>/ contained contains=csType,csTypeTuple,csTypeIdentifier,csModifier nextgroup=csDeclarator,csIndexerThis,csOperatorModifier,csPropertyBlock skipwhite skipempty
syn region csInvocation matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csRHS nextgroup=csInvocation,csIndex,@csOperators skipwhite skipempty
syn region csIndex matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contained contains=@csRHS nextgroup=csInvocation,csIndex,@csOperators skipwhite skipempty

syn keyword csConstant this base nextgroup=@csOperators,csInvocation,csIndex skipwhite skipempty

syn keyword csIndexerThis this contained nextgroup=csIndexerParameters skipwhite skipempty
syn region csIndexerParameters matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contained contains=csTypeIdentifier,csModifier nextgroup=csPropertyBlock,csLambdaOperator skipwhite skipempty

syn match csDeclarator /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGenericParameters nextgroup=csAssignmentOperator,csLambdaOperator,csParameters,csPropertyBlock,csDeclaratorMemberOperator,csOperatorKeyword skipwhite skipempty
syn match csDeclarator /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGenericParameters nextgroup=csAssignmentOperator,csLambdaOperator,csParameters,csPropertyBlock,csDeclaratorMemberOperator,csOperatorKeyword skipwhite skipempty
syn match csNotDeclarator /\%#=1\<\K\k*\%(<.\{-}>\)\=\ze\s*\./ contained containedin=csDeclarator contains=csGeneric
syn match csNotDeclarator /\%#=1@\K\k*\%(<.\{-}>\)\=\ze\s*\./ contained containedin=csDeclarator contains=csGeneric
syn match csDeclaratorMemberOperator /\%#=1\./ contained nextgroup=csDeclarator,csIdentifier,csIndexerThis skipwhite skipempty
syn region csParameters matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csTypeIdentifier,csModifier,csThisModifier,csTypeTuple,csCollectionExpressionOrAttributes nextgroup=csLambdaOperator,csBlock,csMethodTypeConstraint skipwhite skipempty
syn keyword csThisModifier this contained
syn region csPropertyBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=csAccessor,csModifier nextgroup=csAssignmentOperator skipwhite skipempty fold
syn keyword csAccessor get set init add remove contained nextgroup=csBlock,csLambdaOperator skipwhite skipempty
syn match csDeclaratorComma /\%#=1,/ nextgroup=csDeclarator skipwhite skipempty

syn match csMethodTypeInheritanceOperator /\%#=1:/ contained nextgroup=csMethodTypeInheritee,csMethodTypeInheriteeKeyword skipwhite skipempty
syn match csMethodTypeInheritee /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGeneric nextgroup=csMethodTypeInheriteeMemberOperator,csMethodTypeInheriteeComma,csMethodTypeConstraint,csMethodTypeConstraintModifier,csMethodTypeInheriteeArguments,csLambdaOperator skipwhite skipempty
syn match csMethodTypeInheritee /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGeneric nextgroup=csMethodTypeInheriteeMemberOperator,csMethodTypeInheriteeComma,csMethodTypeConstraint,csMethodTypeConstraintModifier,csMethodTypeInheriteeArguments,csLambdaOperator skipwhite skipempty
syn keyword csMethodTypeInheriteeKeyword contained nextgroup=csMethodTypeInheriteeComma,csMethodTypeConstraint,csMethodTypeConstraintModifier,csMethodTypeConstraintLambdaOperator skipwhite skipempty
      \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
      \ char bool object string void dynamic
      \ class struct enum default notnull
syn match csMethodTypeConstraintModifier /\%#=1?/ contained nextgroup=csMethodTypeInheriteeMemberOperator,csMethodTypeInheriteeComma,csMethodTypeConstraint,csLambdaOperator skipwhite skipempty
syn keyword csMethodTypeInheriteeKeyword new contained nextgroup=csMethodTypeInheriteeArguments,csMethodTypeInheritee skipwhite skipempty
syn keyword csMethodTypeInheriteeKeyword managed unmanaged contained nextgroup=csMethodTypeInheriteeComma,csLambdaOperator skipwhite skipempty
syn region csMethodTypeInheriteeArguments matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained nextgroup=csMethodTypeInheriteeComma,csMethodTypeConstraint,csMethodTypeConstraintLambdaOperator skipwhite skipempty
syn match csMethodTypeConstraintLambdaOperator /\%#=1=>/ contained nextgroup=csMethodTypeInheriteeKeyword skipwhite skipempty
syn match csMethodTypeInheriteeMemberOperator /\%#=1\./ contained nextgroup=csMethodTypeInheritee,csMethodTypeInheriteeKeyword skipwhite skipempty
syn match csMethodTypeInheriteeComma /\%#=1,/ contained nextgroup=csMethodTypeInheritee,csMethodTypeInheriteeKeyword skipwhite skipempty
syn keyword csMethodTypeConstraint where contained nextgroup=csMethodTypeVariable skipwhite skipempty
syn match csMethodTypeVariable /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csMethodTypeInheritanceOperator skipwhite skipempty
syn match csMethodTypeVariable /\%#=1@\K\k*/ contained nextgroup=csMethodTypeInheritanceOperator skipwhite skipempty

syn region csTypeTuple matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csType,csTypeTuple,csIdentifier nextgroup=csDeclarator,csIndexerThis,csTypeModifier,csOperatorModifier skipwhite skipempty

syn region csGroup matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contains=@csRHS,csRHSTypeIdentifier nextgroup=@csOperators,csDeclarator,csInvocation,csIndex skipwhite skipempty

syn region csCollectionExpressionOrAttributes matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contains=@csRHS,csAttribute

syn match csAssignmentOperator /\%#=1=/ contained nextgroup=@csRHS,csRHSTypeIdentifier,csInitializer skipwhite skipempty

syn match csLambdaOperator /\%#=1=>/ contained nextgroup=@csRHS,csBlock skipwhite skipempty

syn match csMemberOperator /\%#=1?\=\./ contained nextgroup=csIdentifier,csConstant skipwhite skipempty
syn match csMemberOperator /\%#=1->/ contained nextgroup=csIdentifier skipwhite skipempty
syn match csMemberOperator /\%#=1::/ contained nextgroup=csIdentifier skipwhite skipempty

syn match csNullForgivingOperator /\%#=1!/ contained nextgroup=csMemberOperator,csInvocation,csIndex skipwhite skipempty

syn match csIncrementOperator /\%#=1++/
syn match csDecrementOperator /\%#=1--/
syn match csPointerOperator /\%#=1[*&]/

" RHS {{{2
syn cluster csLiterals contains=
      \ csNumber,csBoolean,csNull,csRHSConstant,csCharacter,csString

syn cluster csRHS contains=
      \ @csLiterals,
      \ csUnaryOperator,csUnaryOperatorKeyword,csRHSIdentifier,csRHSType,
      \ csRHSGroup,csCollectionExpressionOrAttributes,csLINQExpression

syn cluster csOperators contains=csOperator,csOperatorKeyword,csComment

syn match csUnaryOperator /\%#=1++\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csUnaryOperator /\%#=1--\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csUnaryOperator /\%#=1\.\./ contained nextgroup=@csRHS skipwhite skipempty
syn match csUnaryOperator /\%#=1[!~*&^]/ contained nextgroup=@csRHS skipwhite skipempty

syn keyword csUnaryOperatorKeyword new nextgroup=csRHSIdentifier,csRHSType,csInitializer,csRHSInvocation,csRHSIndex skipwhite skipempty
syn keyword csUnaryOperatorKeyword stackalloc nextgroup=csRHSIdentifier,csRHSType,csInitializer,csRHSIndex skipwhite skipempty
syn keyword csUnaryOperatorKeyword out in contained nextgroup=@csRHS skipwhite skipempty
syn keyword csUnaryOperatorKeyword ref contained nextgroup=@csRHS,csReadonly skipwhite skipempty
syn keyword csReadonly readonly contained nextgroup=@csRHS skipwhite skipempty
syn keyword csUnaryOperatorKeyword await nextgroup=csStatement,@csRHS skipwhite skipempty
syn keyword csUnaryOperatorKeyword async params contained nextgroup=csRHSTypeIdentifier,csRHSType,csRHSGroup skipwhite skipempty
syn keyword csUnaryOperatorKeyword throw nextgroup=@csRHS skipwhite skipempty
syn keyword csUnaryOperatorKeyword static contained nextgroup=csRHSType,csRHSIdentifier skipwhite skipempty
syn keyword csUnaryOperatorKeyword delegate contained nextgroup=csFunctionPointerModifier skipwhite skipempty
syn keyword csUnaryOperatorKeyword not contained nextgroup=@csPatterns skipwhite skipempty

syn keyword csUnaryOperatorKeyword typeof checked unchecked sizeof nameof contained nextgroup=csRHSInvocation skipwhite skipempty
syn keyword csUnaryOperatorKeyword default contained nextgroup=csRHSInvocation,@csOperators skipwhite skipempty

syn keyword csUnaryOperatorKeyword var contained nextgroup=csRHSDeclarator,csRHSTupleDeclarator skipwhite skipempty
syn match csRHSDeclarator /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=@csOperators skipwhite skipempty
syn match csRHSDeclarator /\%#=1@\K\k*/ contained nextgroup=@csOperators skipwhite skipempty
syn region csRHSTupleDeclarator matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csRHSDeclarator nextgroup=@csOperators skipwhite skipempty

syn keyword csRHSType contained nextgroup=csMemberOperator,csRHSGroup,csRHSIndex,csRHSDeclarator,csTypeModifier,csOperatorKeyword skipwhite skipempty
      \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
      \ char bool object string void dynamic

syn match csRHSIdentifier /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csKeywordError,csGeneric nextgroup=@csOperators,csRHSInvocation,csRHSIndex,csInitializer,csOperatorModifier skipwhite skipempty
syn match csRHSIdentifier /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGeneric nextgroup=@csOperators,csRHSInvocation,csRHSIndex,csInitializer,csOperatorModifier skipwhite skipempty
syn region csRHSInvocation matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csRHS nextgroup=@csOperators,csInitializer,csRHSInvocation,csRHSIndex skipwhite skipempty
syn region csRHSIndex matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contained contains=@csRHS nextgroup=@csOperators,csRHSInvocation,csRHSIndex,csInitializer skipwhite skipempty

syn region csInitializer matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=@csRHS,csInitializer,csIndexSetter nextgroup=@csOperators skipwhite skipempty

syn match csNumber /\%#=1\c\d\+\%(_\+\d\+\)*\%(\%(lu\=\|ul\=\)\|[dmf]\|\.\d\+\%(_\+\d\+\)*\%(e[+-]\=\d\+\%(_\+\d\+\)*\)\=[dmf]\=\|e[+-]\=\d\+\%(_\+\d\+\)*[dmf]\=\)\=/ contained nextgroup=@csOperators skipwhite skipempty
syn match csNumber /\%#=1\c0b_*[01]\+\%(_\+[01]\+\)*\%(lu\=\|ul\=\)\=/ contained nextgroup=@csOperators skipwhite skipempty
syn match csNumber /\%#=1\c0x_*\x\+\%(_\+\x\+\)*\%(\%(lu\=\|ul\=\)\|[dmf]\|e[+-]\=\d\+\%(_\+\d\+\)*[dmf]\=\)\=/ contained nextgroup=@csOperators skipwhite skipempty
syn match csNumber /\%#=1\c\.\d\+\%(_\+\d\+\)*\%(e[+-]\=\d\+\%(_\+\d\+\)*\)\=[dmf]\=/ contained nextgroup=@csOperators skipwhite skipempty

syn keyword csBoolean true false contained nextgroup=@csOperators skipwhite skipempty
syn keyword csNull null contained nextgroup=@csOperators skipwhite skipempty
syn keyword csRHSConstant this base contained nextgroup=@csOperators,csRHSInvocation,csRHSIndex skipwhite skipempty

syn region csCharacter matchgroup=csCharacterDelimiter start=/\%#=1'/ end=/\%#=1'/ contained contains=csEscapeSequence,csEscapeSequenceError nextgroup=@csOperators skipwhite skipempty

syn region csString matchgroup=csStringStart start=/\%#=1"/    matchgroup=csStringEnd end=/\%#=1"\%(u8\)\=/ contained contains=csEscapeSequence,csEscapeSequenceError nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1\$"/  matchgroup=csStringEnd end=/\%#=1"\%(u8\)\=/ contained contains=csBraceEscape,csEscapeSequence,csEscapeSequenceError,csStringInterpolation,csStringInterpolationError nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1@"/   matchgroup=csStringEnd end=/\%#=1"\%(u8\)\=/ contained skip=/\%#=1""/ contains=csQuoteEscape nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1\$@"/ matchgroup=csStringEnd end=/\%#=1"\%(u8\)\=/ contained skip=/\%#=1""/ contains=csQuoteEscape,csBraceEscape,csStringInterpolation,csStringInterpolationError nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1@\$"/ matchgroup=csStringEnd end=/\%#=1"\%(u8\)\=/ contained skip=/\%#=1""/ contains=csQuoteEscape,csBraceEscape,csStringInterpolation,csStringInterpolationError nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1\z("\{3,}\)/ matchgroup=csStringEnd end=/\%#=1\z1\%(u8\)\=/ contained nextgroup=@csOperators skipwhite skipempty
syn region csString matchgroup=csStringStart start=/\%#=1\$\+\z("\{3,}\)/ matchgroup=csStringEnd end=/\%#=1\z1\%(u8\)\=/ contained contains=csBraceEscape,csStringInterpolation,csStringInterpolationError nextgroup=@csOperators skipwhite skipempty

syn match csStringInterpolationError /\%#=1[{}]/ contained
syn region csStringInterpolation matchgroup=csStringInterpolationDelimiter start=/\%#=1{/ end=/\%#=1\%([,:].\{-}\)\=}/ contained contains=@csRHS

syn match csEscapeSequenceError /\%#=1\\./ contained
syn match csEscapeSequence /\%#=1\\\%(['"\\0abfnrtv]\|x\x\{1,4}\|u\x\{4}\|U\x\{8}\)/ contained

syn match csQuoteEscape /\%#=1""/ contained
syn match csBraceEscape /\%#=1{{/ contained
syn match csBraceEscape /\%#=1}}/ contained

syn match csOperator /\%#=1!/ contained nextgroup=@csOperators,csRHSInvocation,csRHSIndex skipwhite skipempty
syn match csOperator /\%#=1=/ contained nextgroup=@csRHS,csInitializer skipwhite skipempty
syn match csOperator /\%#=1[=!]=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1[+*/%]=\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1=>/ contained nextgroup=@csRHS,csBlock skipwhite skipempty
syn match csOperator /\%#=1-[>=]\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1++/ contained nextgroup=@csOperators skipwhite skipempty
syn match csOperator /\%#=1--/ contained nextgroup=@csOperators skipwhite skipempty
syn match csOperator /\%#=1<<\==\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1>>\=>\==\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1&&\==\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1||\==\=/ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1?\%(?=\=\)\=/ contained nextgroup=@csRHS skipwhite skipempty

syn match csOperator /\%#=1\./ contained nextgroup=csRHSIdentifier,csRHSConstant skipwhite skipempty
syn match csOperator /\%#=1\.\./ contained nextgroup=@csRHS skipwhite skipempty
syn match csOperator /\%#=1?\./ contained nextgroup=csRHSIdentifier,csRHSConstant skipwhite skipempty
syn match csOperator /\%#=1:/ contained nextgroup=@csRHS,csStatement skipwhite skipempty
syn match csOperator /\%#=1::/ contained nextgroup=csRHSIdentifier skipwhite skipempty

syn region csRHSGroup matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csRHS,csRHSTypeIdentifier nextgroup=@csRHS,@csOperators skipwhite skipempty
syn match csRHSTypeIdentifier /\%#=1\K\k*\%(<.\{-}>\)\=\%([*?]\.\@!\|\[.\{-}\]\)*/ contained contains=csType,csKeywordError,csGeneric,csTypeModifier nextgroup=@csOperators,csRHSGroup,csRHSIndex,csDeclarator skipwhite skipempty
syn match csRHSTypeIdentifier /\%#=1@\K\k*\%(<.\{-}>\)\=\%([*?]\.\@!\|\[.\{-}\]\)*/ contained contains=csGeneric,csTypeModifier nextgroup=@csOperators,csRHSGroup,csRHSIndex,csDeclarator skipwhite skipempty

syn keyword csOperatorKeyword as contained nextgroup=csRHSTypeIdentifier skipwhite skipempty
syn keyword csOperatorKeyword in when contained nextgroup=@csRHS skipwhite skipempty
syn keyword csOperatorKeyword and or contained nextgroup=@csPatterns skipwhite skipempty

syn keyword csOperatorKeyword is contained nextgroup=@csPatterns skipwhite skipempty
syn keyword csOperatorKeyword switch contained nextgroup=csPatternBlock skipwhite skipempty
syn region csPatternBlock matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=@csPatterns nextgroup=@csOperators skipwhite skipempty fold

syn cluster csPatterns contains=csPatternType,csPatternTypeIdentifier,csUnaryOperatorKeyword,@csLiterals,csOperator,csPatternGroup,csPatternProperties,csPatternList

syn keyword csPatternType contained nextgroup=csPatternDeclarator,csPatternTypeMemberOperator,csPatternGroup,csPatternProperties,csOperatorKeyword skipwhite skipempty
    \ sbyte short int long byte ushort uint ulong float double decimal nint nuint
    \ char bool object string void dynamic

syn match csPatternTypeIdentifier /\%#=1\K\k*\%(<.\{-}>\)\=/ contained contains=csGeneric,csKeywordError nextgroup=csPatternDeclarator,csLambdaOperator,csPatternTypeMemberOperator,csPatternGroup,csPatternProperties,csOperatorKeyword skipwhite skipempty
syn match csPatternTypeIdentifier /\%#=1@\K\k*\%(<.\{-}>\)\=/ contained contains=csGeneric nextgroup=csPatternDeclarator,csLambdaOperator,csPatternTypeMemberOperator,csPatternGroup,csPatternProperties,csOperatorKeyword skipwhite skipempty

syn match csPatternTypeMemberOperator /\%#=1\./ contained nextgroup=csPatternTypeIdentifier skipwhite skipempty

syn match csPatternDeclarator /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=@csOperators skipwhite skipempty
syn match csPatternDeclarator /\%#=1@\K\k*/ contained nextgroup=@csOperators skipwhite skipempty

syn region csPatternGroup matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csPatterns nextgroup=@csOperators,csPatternDeclarator,csPatternProperties skipwhite skipempty

syn region csPatternProperties matchgroup=csDelimiter start=/\%#=1{/ end=/\%#=1}/ contained contains=csPatternProperty nextgroup=@csOperators,csPatternDeclarator skipwhite skipempty
syn match csPatternProperty /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csPatternPropertyColon,csPatternPropertyMemberOperator skipwhite skipempty
syn match csPatternProperty /\%#=1@\K\k*/ contained nextgroup=csPatternPropertyColon,csPatternPropertyMemberOperator skipwhite skipempty
syn match csPatternPropertyColon /\%#=1:/ contained nextgroup=@csPatterns skipwhite skipempty
syn match csPatternPropertyMemberOperator /\%#=1\./ contained nextgroup=csPatternProperty skipwhite skipempty

syn region csPatternList matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1]/ contained contains=@csPatterns,csPatternSlice,csPatternListVar nextgroup=@csOperators skipwhite skipempty
syn match csPatternSlice /\%#=1\.\./ contained
syn keyword csPatternListVar var contained nextgroup=csPatternListDeclarator skipwhite skipempty
syn match csPatternListDeclarator /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csPatternListDeclaratorComma skipwhite skipempty
syn match csPatternListDeclarator /\%#=1@\K\k*/ contained nextgroup=csPatternListDeclaratorComma skipwhite skipempty
syn match csPatternListDeclaratorComma /\%#=1,/ contained nextgroup=csPatternListDeclarator skipwhite skipempty

syn keyword csOperatorKeyword with contained nextgroup=csInitializer skipwhite skipempty

syn region csIndexSetter matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1]/ contained contains=@csRHS nextgroup=csAssignmentOperator skipwhite skipempty

syn region csLINQExpression start=/\%#=1\<from\>/ end=/\%#=1[)\]};]\@=/ contained transparent contains=csLINQKeyword,@csRHS
syn keyword csLINQKeyword from into contained nextgroup=csLINQDeclarator,csLINQDeclaration skipwhite skipempty
syn match csLINQDeclaration /\%#=1@\=\K\k*\%(\.@\=\K\k*\)*\%(<.\{-}>\)\=\s\+\%(in\>\)\@!@\=\K\k*/ contained contains=csType,csIdentifier
syn keyword csLINQKeyword let join contained nextgroup=csLINQDeclarator skipwhite skipempty
syn keyword csLINQKeyword in where select orderby group by ascending descending on equals contained
syn match csLINQDeclarator /\%#=1\K\k*/ contained contains=csKeywordError nextgroup=csAssignmentOperator skipwhite skipempty
syn match csLINQDeclarator /\%#=1@\K\k*/ contained nextgroup=csAssignmentOperator skipwhite skipempty

" Miscellaneous (high priority) {{{2
syn region csComment matchgroup=csCommentStart start=/\%#=1\/\// end=/\%#=1$/ contains=csTodo containedin=@csExtras
syn region csComment matchgroup=csCommentStart start=/\%#=1\/\*/ matchgroup=csCommentEnd end=/\%#=1\*\// contains=csTodo containedin=@csExtras
syn region csComment matchgroup=csCommentStart start=/\%#=1\/\/\// end=/\%#=1$/ keepend contains=csTodo,csXMLTagStart containedin=@csExtras
syn keyword csTodo TODO NOTE XXX FIXME HACK TBD contained

syn match csXMLTagStart /\%#=1<\/\=/ contained nextgroup=csXMLTagName
syn match csXMLTagName /\%#=1\a[^[:space:]\>]*/ contained nextgroup=csXMLAttribute,csXMLTagEnd skipwhite
syn match csXMLAttribute /\%#=1[^>/=[:space:]]\+/ contained nextgroup=csXMLAttributeOperator,csXMLTagEnd skipwhite
syn match csXMLAttributeOperator /\%#=1=/ contained nextgroup=csXMLValue skipwhite
syn region csXMLValue matchgroup=csXMLValueDelimiter start=/\%#=1"/ end=/\%#=1"/ contained nextgroup=csXMLTagEnd skipwhite
syn region csXMLValue matchgroup=csXMLValueDelimiter start=/\%#=1'/ end=/\%#=1'/ contained nextgroup=csXMLTagEnd skipwhite
syn match csXMLTagEnd /\%#=1\/\=>/ contained

syn match csDirective /\%#=1#.*/ containedin=@csBlocks
syn region csRegion matchgroup=csDirective start=/\%#=1#region\>.*/ end=/\%#=1#endregion\>.*/ containedin=@csBlocks,csRegion transparent fold

syn match csTypeModifier /\%#=1[*?]/ contained nextgroup=csDeclarator,csTypeModifier skipwhite skipempty
syn region csTypeModifier matchgroup=csDelimiter start=/\%#=1\[/ end=/\%#=1\]/ contained contains=@csRHS nextgroup=csDeclarator,csInitializer,csTypeModifier skipwhite skipempty

syn match csTypeIdentifier /\%#=1\K\k*\%(<.\{-}>\)\=\%([*?]\.\@!\|\[.\{-}\]\)*/ contained contains=csType,csKeywordError,csGeneric,csTypeModifier nextgroup=csDeclarator,csIndexerThis,csTypeMemberOperator,csOperatorModifier,csOperator skipwhite skipempty
syn match csTypeIdentifier /\%#=1@\K\k*\%(<.\{-}>\)\=\%([*?]\.\@!\|\[.\{-}\]\)*/ contained contains=csGeneric,csTypeModifier nextgroup=csDeclarator,csIndexerThis,csTypeMemberOperator,csOperatorModifier,csOperator skipwhite skipempty
syn match csTypeMemberOperator /\%#=1\./ contained nextgroup=csTypeIdentifier skipwhite skipempty
syn match csTypeMemberOperator /\%#=1::/ contained nextgroup=csTypeIdentifier skipwhite skipempty

syn match csConstructor /\%#=1\K\k*(\@=/ contained contains=csKeywordError nextgroup=csConstructorParameters
syn match csConstructor /\%#=1@\K\k*(\@=/ contained nextgroup=csConstructorParameters
syn region csConstructorParameters matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=csType,csTypeIdentifier,csModifier,csCollectionExpressionOrAttributes nextgroup=csLambdaOperator,csConstructorInheritanceOperator skipwhite skipempty
syn match csConstructorInheritanceOperator /\%#=1:/ contained nextgroup=csMethodConstant skipwhite skipempty
syn keyword csMethodConstant this base contained nextgroup=csMethodConstantParameters skipwhite skipempty
syn region csMethodConstantParameters matchgroup=csDelimiter start=/\%#=1(/ end=/\%#=1)/ contained contains=@csRHS nextgroup=csLambdaOperator skipwhite skipempty

syn match csAttribute /\%#=1@\=\K\k*/ contained nextgroup=@csOperators skipwhite skipempty

syn cluster csBlocks contains=cs\a\{-}Block

syn cluster csExtras contains=
    \ ALLBUT,
    \ csString,csCharacter,csComment,csXMLTagName,csXMLAttribute,csXMLValue,csDirective,csEscapeSequenceError,
    \ cs\a\{-}Comma

" Highlighting {{{1
hi def link csComment Comment
hi def link csCommentStart csComment
hi def link csCommentEnd csCommentStart
hi def link csTodo Todo
hi def link csDirective PreProc
hi def link csStatement Statement
hi def link csTypeName Typedef
hi def link csInterfaceName csTypeName
hi def link csRecordModifier csStatement
hi def link csGenericParameter csDeclarator
hi def link csTypeInheritanceOperator csOperator
hi def link csTypeConstraintLambdaOperator csOperator
hi def link csTypeInheriteeMemberOperator csMemberOperator
hi def link csTypeConstraint csStatement
hi def link csTypeConstraintModifier csTypeModifier
hi def link csTypeInheriteeKeyword Keyword
hi def link csMethodTypeInheritanceOperator csTypeInheritanceOperator
hi def link csMethodTypeConstraintLambdaOperator csTypeConstraintLambdaOperator
hi def link csMethodTypeInheriteeMemberOperator csTypeInheriteeMemberOperator
hi def link csMethodTypeConstraint csTypeConstraint
hi def link csMethodTypeInheriteeKeyword csTypeInheriteeKeyword
hi def link csMethodTypeConstraintModifier csTypeConstraintModifier
hi def link csTypeVariable csIdentifier
hi def link csEnumName Typedef
hi def link csEnumInheritanceOperator csOperator
hi def link csEnumType csType
hi def link csNamespaceName Typedef
hi def link csNamespaceNameSeparator csOperator
hi def link csDelimiter Delimiter
hi def link csModifier Keyword
hi def link csFunctionPointerModifier csTypeModifier
hi def link csOperatorModifier csModifier
hi def link csOperatorMethod csOperator
hi def link csBooleanOperatorMethod csBoolean
hi def link csConversionMethodKeyword csType
hi def link csIncrementOperator csOperator
hi def link csDecrementOperator csOperator
hi def link csPointerOperator csOperator
hi def link csType Type
hi def link csTypeModifier csOperator
hi def link csTypeIdentifier csIdentifier
hi def link csRHSTypeIdentifier csTypeIdentifier
hi def link csTypeMemberOperator csMemberOperator
hi def link csDeclarator Identifier
hi def link csNotDeclarator csIdentifier
hi def link csDeclaratorMemberOperator csMemberOperator
hi def link csConstructor csDeclarator
hi def link csConstructorInheritanceOperator csOperator
hi def link csDestructorSign csOperator
hi def link csDestructor csConstructor
hi def link csMethodConstant csConstant
hi def link csConstant Constant
hi def link csRHSConstant csConstant
hi def link csIndexerThis csConstant
hi def link csThisModifier csConstant
hi def link csOperator Operator
hi def link csAssignmentOperator csOperator
hi def link csMemberOperator csOperator
hi def link csNullForgivingOperator csOperator
hi def link csLambdaOperator csOperator
hi def link csAccessor csStatement
hi def link csOperatorKeyword Keyword
hi def link csUnaryOperatorKeyword csOperatorKeyword
hi def link csRHSDeclarator csDeclarator
hi def link csRHSIdentifier csIdentifier
hi def link csRHSType csType
hi def link csLINQKeyword Keyword
hi def link csUnaryOperator csOperator
hi def link csNumber Number
hi def link csBoolean Boolean
hi def link csNull Constant
hi def link csCharacter Character
hi def link csCharacterDelimiter csDelimiter
hi def link csString String
hi def link csStringStart csDelimiter
hi def link csStringEnd csStringStart
hi def link csStringInterpolationDelimiter csDelimiter
hi def link csStringInterpolationError Error
hi def link csEscapeSequence SpecialChar
hi def link csEscapeSequenceError Error
hi def link csQuoteEscape csEscapeSequence
hi def link csBraceEscape csEscapeSequence
hi def link csKeywordError Error
hi def link csXMLTagStart Delimiter
hi def link csXMLTagName Special
hi def link csXMLTagEnd csXMLTagStart
hi def link csXMLAttribute Keyword
hi def link csXMLAttributeOperator Operator
hi def link csXMLValue String
hi def link csXMLValueDelimiter csDelimiter
hi def link csPatternType csType
hi def link csPatternTypeIdentifier csTypeIdentifier
hi def link csPatternTypeMemberOperator csMemberOperator
hi def link csPatternDeclarator csDeclarator
hi def link csPatternPropertyMemberOperator csMemberOperator
hi def link csPatternSlice csOperator
hi def link csDeclaratorComma csDelimiter
hi def link csTypeInheriteeComma csDeclaratorComma
hi def link csLINQDeclarator csDeclarator
hi def link csFunctionPointerManaged csModifier
hi def link csPatternListVar csStatement
hi def link csPatternListDeclarator csDeclarator
hi def link csPatternListDeclaratorComma csDeclaratorComma
hi def link csReadonly csUnaryOperatorKeyword
hi def link csPatternPropertyColon csOperator
hi def link csUsingStatic csModifier
" }}}1

" vim:fdm=marker
