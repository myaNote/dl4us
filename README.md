東京大学の松尾研究室がDeep Learning実践開発講座 (DL4US) を公開してくださった。→
[GitHub \- matsuolab\-edu/dl4us](https://github.com/matsuolab-edu/dl4us)

このDockerは、簡単にDocker上で実行&学習するためのDocker環境です。
[Docker Hub / myanote dl4us](https://hub.docker.com/r/myanote/dl4us)

## 前提
dl4usの演習ではGPUを使用しているため、このDockerでもnvidia-dockerを使用しGPUを使用できるようにしています。
nvidia-dockerのセットアップ方法は以下のサイトをご参照ください。
- [GitHub \- NVIDIA/nvidia\-docker: Build and run Docker containers leveraging NVIDIA GPUs](https://github.com/NVIDIA/nvidia-docker)  
- [nvidia/cuda \- Docker Hub](https://hub.docker.com/r/nvidia/cuda/)

## Usage
事前にdl4usをダウンロードしてください。
Dockerイメージをダウンロードして、jupyterを実行します。
```
$ docker run -it -v $(【ダウンロードしたdl4usのPATH】):/jupyter -p 8888:8888 --runtime=nvidia myanote/dl4us /bin/bash
$ jupyter notebook --port 8888 --ip=0.0.0.0 --allow-root
…
…
[C 02:20:57.283 NotebookApp]
To access the notebook, open this file in a browser:
file:///root/.local/share/jupyter/runtime/nbserver-2113-open.html
Or copy and paste one of these URLs:
http://(aa884dece7ca or 127.0.0.1):8888/?token=5e83dc5d3fd5cdbb10a0eee12559e25eb5b7a99d54753b28
```
あとは、ブラウザでdocker上に表示されたURLを開けばOKです。
上の例では、 `http://127.0.0.18888/?token=5e83dc5d3fd5cdbb10a0eee12559e25eb5b7a99d54753b28` になります。

## 検証した環境
検証した環境は以下のとおりです。
- DELL G3
- CPU: intel CORE i5 8th Gen
- GPU: GeForce GTX 1050
- OS: Ubuntu 16.04

## 既知の問題
### lesson 3 の section 4は未検証です。
なぜか、lesson3 のsection4のDatasetはwebページが開けません。
なので、Lesson3のSection4は未確認です。

### lesson 5 は未検証です。
lesson 5 の section 1 のMSCOCOが大きすぎて未検証です。

```
python3 preprocess_mscoco.py
```
で、処理が勝手にkilllされます。
おそらく、MSCOCOのファイルが大きすぎて、メモリ不足で勝手にkillされていると考えています。
そのため、lesson5は未検証です。

### lesson 7 について
lesson7では以下のようなコマンドは、 `pip` や `apt` などのインストールコマンド以外すべて実行してください。
```
#Colab上では以下を実行してください
```
