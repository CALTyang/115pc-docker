# 115网盘Linux版本的Docker封装

## 构建镜像

```shell
docker build -t 115pc:$(date +%Y-%m-%d) .
docker tag 115pc:$(date +%Y-%m-%d) 115pc:latest
```


## 创建容器

```shell
docker create   --name=115pc                                    \
                -p 11580:5800                                   \
                -p 11591:5900                                   \
                -v <YourConfigDir>:/config                      \
                -v <YourDownloadDir>:/Downloads/115download     \
                --restart always                                \
                115pc
```


## 启停

```shell
docker start 115pc
docker stop 115pc
```

*启动之后，可通过 `http://<ip>:11580`进行访问*


## 参数

|名称               |说明                                                   |
|:-                 |:-                                                     |
|`APP_NAME`         |应用名称，默认：115pc                                  |
|`APP_VERSION`      |指定115客户端版本号，默认：1.0.6.7                     |
|`USER_ID`          |指定容器内的用户ID，默认：root                         |
|`GROUP_ID`         |指定容器内的组ID，默认：root                           |
|`ENABLE_CJK_FONT`  |默认：1，不建议修改                                    |
|`DISPLAY_WIDTH`    |应用界面宽度，默认：1920                               |
|`DISPLAY_HEIGHT`   |应用界面高度，默认：1080                               |
|`APT_SOURCE_HOST`  |Apt更新源地址，默认为科技大镜像：mirrors.ustc.edu.cn   |

*更多参数设置，请参考：[https://github.com/jlesage/docker-baseimage-gui]*


## 注意事项

1. 考虑到Docker运行的特殊性，在每次容器启动时，都会改回***下载路径***设置，以达到固化路径的作用。
2. 同时由于v1.0.6.7这个版本的115客户端，默认的设置中，下载路径有多余的字符，亦使用强制改回配置的方式实现。
3. 副作用是其他设置也会被一并改回，若有特殊需求，请自行修改代码。
4. 由于`jlesage/baseimage-gui`默认情况下，在容器内使用`app`用户运行程序，会造成115客户端无权限使用默认下载路径。
5. 采用修改参数`USER_ID`和`GROUP_ID`为`root`的手法，解决了事项4的问题，目前没找到更好的方法。
6. 由于默认使用了`root`用户，导致115客户端下载的文件的权限在其他用户面前为只读，所以尽量使用115客户端删除下载文件。


## 感谢

* [jlesage/baseimage-gui](https://registry.hub.docker.com/r/jlesage/baseimage-gui)提供的X图形应用容器基础镜像，使用它可以轻松将Linux图形应用程序以Web和VNC的方式使用。
* CALTyang制作的[115pc-docker](https://github.com/CALTyang/115pc-docker)，我这里fork了他的代码，并进一步折腾解决了一些小问题，收获很多。
