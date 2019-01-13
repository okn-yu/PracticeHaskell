# PracticeHaskell

## プログラムの実行方法
- Intellij上でファイルを修正し、Intellijのターミナルで以下のコマンドで実行する
- 直接Intellij上でファイルの実行によりコンテナをよび出す方法がうまく動かない...

```
docker run --rm -v /Users/mofuneko/SoftwareDevelopment/Docker:/tmp haskell:latest runghc /tmp/test.hs
```
