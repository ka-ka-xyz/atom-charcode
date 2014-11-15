# atom-charcode package

Display the code of characters to the right of cursor in status bar.

'[${character code of current encoding type}(${Unicode Codepoint})]'

This package is tested in Windows 7 using Japanese popular encoding formats
  (UTF-8, UTF-16 BE/LE,SHIFT_JIS and EUCJP).

---------------------------------------
カーソル右側の文字コードを以下の形式で表示します。

'[${使用中の文字コード方式の文字コード}(${Unicodeコードポイント)}]'

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

![ whitespace ](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)
Line No. 1 is separated by whitespace "0x0020(U+0020)".
  一行目は半角スペース"0x0020(U+0020)"で分割されています。

![ no-break space ](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)
Line No. 2 is separated by No-Break Space "0xC2A0(U+00A0)".
  二行目はノーブレークスペース"0xC2A0(U+00A0)"で分割されています。

![ IDEOGRAPHIC SPACE ](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)
Line No. 3 is separated by IDEOGRAPHIC SPACE "0xE38080(U+3000)".
  三行目は全角スペース"0xE38080(U+3000)"で分割されています。
