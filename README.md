# PracticeHaskell

## プログラムの実行方法 (runghc)
- Intellij上でファイルを修正し、Intellijのターミナルで以下のコマンドで実行する
- Haskellの実行環境の整ったDockerコンテナ上で実行し、結果はターミナルに出力される
- 直接Intellij上でファイルの実行によりコンテナをよび出す方法がうまく動かない...

```
docker run --rm -v /Users/mofuneko/SoftwareDevelopment/GitHub/PracticeHaskell/Source:/tmp haskell:7.8 runghc /tmp/NumericalFormula.hs

```

## プログラムの実行方法 (ghci)
- ghciで実行する場合は、ターミナルで以下のコマンドを実行する

```
$ docker run -it  haskell:latest /bin/bash
root@617a3789c4ed:/# ghci
GHCi, version 8.6.3: http://www.haskell.org/ghc/  :? for help
```
