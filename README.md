
# TODO app / ver.riverpod

## 使用ツール
- fvm
  - fvm flutter versionは `.fvm/fvm_config.json` を確認してね

## ディレクトリ構成
- app dir
  - app.dart: アプリの根幹の部分を成す部分。今回は初期状態のまま
- feature dir: オブジェクト指向のうちの大きくカテゴライズされたオブジェクトをまとめるディレクトリ
  - todo dir: todoという概念を取りまとめたディレクトリ
    - todo_list dir: todoリストのまとまり
      - screen: uiの画面。説明終わり。
      - controller: 上記screenの内部情報を持つ。また、その情報を操作する。そのためcontrollerという名前
      - entity: データクラスのことをentityと言ったりします。今回はTodo Entityが入ると思われるよ。
      

## 注意事項
- Makefileがあるので活用してね
- linterが働いているのでちょっと制限があるよ