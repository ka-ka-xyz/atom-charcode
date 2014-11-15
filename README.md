# atom-charcode package

Display the code of characters to the right of cursor in status bar.

![ status bar ](https://raw.githubusercontent.com/ka-ka-xyz/atom-charcode/master/images/image004.PNG)

"0x0020" means the character code of whitespace when file is encoded in UTF-8.

"(U+0020)" means the Unicode Codepoint.

Unicode surrogate pair character supported.

This package is tested in Windows 7 using Japanese popular encoding formats
  (UTF-8, UTF-16 BE/LE,SHIFT_JIS and EUCJP).


---------------------------------------
カーソル右側の文字コードを以下の形式で表示します。

"0x0020" はUTF-8形式でエンコードされた場合の文字コードです。

"(U+0020)" はユニコードコードポイントを示します。

Unicodeサロゲートペア文字にも対応済みです。

このパッケージはWindows7上で一般的な日本語エンコード形式(UTF-8,UTF-16 BE/LE,
  SHIFT_JIS and EUCJP)で動作確認を行っています。

 ---------------------------------------
## Attention!
This package can't display End Of Line (EOL) code correctly due to
  Atom editor has no information of EOL character code.
  So the character code of end of line is always displayed as "0x0000(U+0000)"

---------------------------------------
## 注意！
このパッケージは行末改行コードを正常に表示できません。これは、Atomエディタ内部で改行コードに
  ついての情報を持たないためです。
  そのため、行末については常に文字コード"0x0000(U+0000)"として表示されます。

---------------------------------------

## Example

![ whitespace ](https://raw.githubusercontent.com/ka-ka-xyz/atom-charcode/master/images/image001.PNG)

Line No. 1 is separated by whitespace "0x0020(U+0020)".

一行目は半角スペース"0x0020(U+0020)"で分割されています。

![ no-break space ](https://raw.githubusercontent.com/ka-ka-xyz/atom-charcode/master/images/image003.PNG)

Line No. 2 is separated by No-Break Space "0xC2A0(U+00A0)".

  二行目はノーブレークスペース"0xC2A0(U+00A0)"で分割されています。

![ IDEOGRAPHIC SPACE ](https://raw.githubusercontent.com/ka-ka-xyz/atom-charcode/master/images/image004.PNG)

Line No. 3 is separated by IDEOGRAPHIC SPACE "0xE38080(U+3000)".

三行目は全角スペース"0xE38080(U+3000)"で分割されています。
