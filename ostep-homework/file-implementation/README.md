
# Overview

Use this tool, `vsfs.py`, to study how file system state changes as various
operations take place. The file system begins in an empty state, with just a
root directory. As the simulation takes place, various operations are
performed, thus slowly changing the on-disk state of the file system.

使用此工具 vsfs.py，研究文件系统状态如何随着各种操作的发生而变化。文件系统以空
状态开始，只需根目录。在进行模拟时，执行各种操作，从而慢慢改变文件系统的盘上状态。

The possible operations are:

可能的操作是：

- mkdir() - creates a new directory
- creat() - creates a new (empty) file
- open(), write(), close() - appends a block to a file
- link()   - creates a hard link to a file
- unlink() - unlinks a file (removing it if linkcnt==0)

To understand how this homework functions, you must first understand how the
on-disk state of this file system is represented.  The state of the file
system is shown by printing the contents of four different data structures:

要了解此作业的功能，您必须首先了解此文件系统的磁盘状态是如何表示的。通过打印四
种不同数据结构的内容来显示文件系统的状态：

- inode bitmap: indicates which inodes are allocated
- inodes: table of inodes and their contents
- data bitmap: indicates which data blocks are allocated
- data: indicates contents of data blocks

The bitmaps should be fairly straightforward to understand, with a 1
indicating that the corresponding inode or data block is allocated, and a 0
indicating said inode or data block is free.

位图应该相当简单易懂，1 表示分配了相应的 inode 或数据块，0 表示表示 inode 或数
据块是空闲的。

The inodes each have three fields: the first field indicates the type of file
(e.g., f for a regular file, d for a directory); the second indicates which
data block belongs to a file (here, files can only be empty, which would have
the address of the data block set to -1, or one block in size, which would
have a non-negative address); the third shows the reference count for the file
or directory. For example, the following inode is a regular file, which is
empty (address field set to -1), and has just one link in the file system:

每个 inode 都有三个字段：第一个字段表示文件类型（例如，f 表示常规文件，d 表示目
录）； 第二个表示哪个数据块属于文件（这里，文件只能是空的，这会将数据块的地址设
置为-1，或者大小为一个块，这将具有非负地址）； 第三个显示文件或目录的引用计数。
例如，下面的 inode 是一个普通文件，它是空的（地址字段设置为 -1），并且在文件系
统中只有一个链接：


```sh
  [f a:-1 r:1]
```

If the same file had a block allocated to it (say block 10), it would be shown
as follows: 

如果同一个文件分配了一个块（比如块 10），它将显示如下：

```sh
  [f a:10 r:1]
```

If someone then created a hard link to this inode, it would then become:

如果然后有人创建了一个到这个 inode 的硬链接，它就会变成：


```sh
  [f a:10 r:2]
```

Finally, data blocks can either retain user data or directory data. If filled
with directory data, each entry within the block is of the form (name,
inumber), where "name" is the name of the file or directory, and "inumber" is
the inode number of the file. Thus, an empty root directory looks like this,
assuming the root inode is 0:

最后，数据块可以保留用户数据或目录数据。 如果填充了目录数据，则块中的每个条目的
格式为（名称，编号），其中“名称”是文件或目录的名称，“inumber”是文件的 inode 编号。
因此，一个空的根目录看起来像这样，假设根 inode 是 0：

```sh
  [(.,0) (..,0)]
```

If we add a single file "f" to the root directory, which has been allocated
inode number 1, the root directory contents would then become:

如果我们将单个文件“f”添加到已分配 inode 号 1 的根目录中，则根目录内容将变为：

```sh
  [(.,0) (..,0) (f,1)]
```

If a data block contains user data, it is shown as just a single character
within the block, e.g., "h". If it is empty and unallocated, just a pair of
empty brackets ([]) are shown.

如果数据块包含用户数据，则它在块内仅显示为单个字符，例如“h”。 如果它为空且未分
配，则只显示一对空括号 ([])。

An entire file system is thus depicted as follows:

因此，整个文件系统描述如下：

```sh
inode bitmap 11110000
inodes       [d a:0 r:6] [f a:1 r:1] [f a:-1 r:1] [d a:2 r:2] [] ...
data bitmap  11100000
data         [(.,0) (..,0) (y,1) (z,2) (f,3)] [u] [(.,3) (..,0)] [] ...
```

This file system has eight inodes and eight data blocks. The root directory
contains three entries (other than "."  and ".."), to "y", "z", and "f". By
looking up inode 1, we can see that "y" is a regular file (type f), with a
single data block allocated to it (address 1). In that data block 1 are the
contents of the file "y": namely, "u".  We can also see that "z" is an empty
regular file (address field set to -1), and that "f" (inode number 3) is a
directory, also empty. You can also see from the bitmaps that the first four
inode bitmap entries are marked as allocated, as well as the first three data
bitmap entries.

这个文件系统有八个 inode 和八个数据块。 根目录包含三个条目（“.”和“..”除外），分
别为“y”、“z”和“f”。 通过查找inode 1，我们可以看到“y”是一个常规文件（类型f），分
配给它的单个数据块（地址1）。 在那个数据块 1 中是文件“y”的内容：即“u”。 我们还
可以看到“z”是一个空的常规文件（地址字段设置为-1），而“f”（inode编号3）是一个目
录，也是空的。 您还可以从位图中看到前四个 inode 位图条目被标记为已分配，以及前
三个数据位图条目。

The simulator can be run with the following flags:
模拟器可以使用以下标志运行：

```sh
prompt> vsfs.py -h
Usage: vsfs.py [options]

Options:
  -h, --help            show this help message and exit
  -s SEED, --seed=SEED  the random seed
  -i NUMINODES, --numInodes=NUMINODES 
                        number of inodes in file system
  -d NUMDATA, --numData=NUMDATA 
                        number of data blocks in file system
  -n NUMREQUESTS, --numRequests=NUMREQUESTS 
                        number of requests to simulate
  -r, --reverse         instead of printing state, print ops
  -p, --printFinal      print the final set of files/dirs
  -c, --compute         compute answers for me
```

A typical usage would simply specify a random seed (to generate a different
problem), and the number of requests to simulate. In this default mode, the
simulator prints out the state of the file system at each step, and asks you
which operation must have taken place to take the file system from one state
to another. For example:

典型的用法是简单地指定一个随机种子（以生成不同的问题）和要模拟的请求数量。 在此
默认模式下，模拟器会在每一步打印出文件系统的状态，并询问您必须进行哪些操作才能
将文件系统从一种状态转换为另一种状态。 例如：

```sh
prompt> ./vsfs.py -n 6 -s 16
...
Initial state

inode bitmap  10000000
inodes        [d a:0 r:2] [] [] [] [] [] [] []
data bitmap   10000000
data          [(.,0) (..,0)] [] [] [] [] [] [] []

Which operation took place?

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:-1 r:1] [] [] [] [] [] []
data bitmap   10000000
data          [(.,0) (..,0) (y,1)] [] [] [] [] [] [] []

Which operation took place?

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:1] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1)] [u] [] [] [] [] [] []

Which operation took place?

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:2] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1) (m,1)] [u] [] [] [] [] [] []

Which operation took place?

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:1] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1)] [u] [] [] [] [] [] []

Which operation took place?

inode bitmap  11100000
inodes        [d a:0 r:2] [f a:1 r:1] [f a:-1 r:1] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1) (z,2)] [u] [] [] [] [] [] []

Which operation took place?

inode bitmap  11110000
inodes        [d a:0 r:3] [f a:1 r:1] [f a:-1 r:1] [d a:2 r:2] [] [] [] []
data bitmap   11100000
data          [(.,0) (..,0) (y,1) (z,2) (f,3)] [u] [(.,3) (..,0)] [] [] [] [] []
```

When run in this mode, the simulator just shows a series of states, and asks
what operations caused these transitions to occur. Running with the "-c" flag
shows us the answers. Specifically, file "/y" was created, a single block
appended to it, a hard link from "/m" to "/y" created, "/m" removed via a call
to unlink, the file "/z" created, and the directory "/f" created:

在这种模式下运行时，模拟器只显示一系列状态，并询问是什么操作导致这些转换发生。
使用“-c”标志运行向我们展示了答案。 具体来说，创建了文件“/y”，附加了一个块，创建
了从“/m”到“/y”的硬链接，通过调用取消链接删除了“/m”，创建了文件“/z” ，并创建目录
“/f”：

```sh
prompt> vsfs.py -n 6 -s 16 -c
...
Initial state

inode bitmap  10000000
inodes        [d a:0 r:2] [] [] [] [] [] [] []
data bitmap   10000000
data          [(.,0) (..,0)] [] [] [] [] [] [] []

creat("/y");

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:-1 r:1] [] [] [] [] [] []
data bitmap   10000000
data          [(.,0) (..,0) (y,1)] [] [] [] [] [] [] []

fd=open("/y", O_WRONLY|O_APPEND); write(fd, buf, BLOCKSIZE); close(fd);

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:1] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1)] [u] [] [] [] [] [] []

link("/y", "/m");

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:2] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1) (m,1)] [u] [] [] [] [] [] []

unlink("/m");

inode bitmap  11000000
inodes        [d a:0 r:2] [f a:1 r:1] [] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1)] [u] [] [] [] [] [] []

creat("/z");

inode bitmap  11100000
inodes        [d a:0 r:2] [f a:1 r:1] [f a:-1 r:1] [] [] [] [] []
data bitmap   11000000
data          [(.,0) (..,0) (y,1) (z,2)] [u] [] [] [] [] [] []

mkdir("/f");

inode bitmap  11110000
inodes        [d a:0 r:3] [f a:1 r:1] [f a:-1 r:1] [d a:2 r:2] [] [] [] []
data bitmap   11100000
data          [(.,0) (..,0) (y,1) (z,2) (f,3)] [u] [(.,3) (..,0)] [] [] [] [] []
```

You can also run the simulator in "reverse" mode (with the "-r" flag),
printing the operations instead of the states to see if you can predict the
state changes from the given operations:

您还可以在“反向”模式下运行模拟器（使用“-r”标志），打印操作而不是状态以查看您是
否可以从给定的操作中预测状态变化：

```sh
prompt> ./vsfs.py -n 6 -s 16 -r
Initial state

inode bitmap  10000000
inodes        [d a:0 r:2] [] [] [] [] [] [] [] 
data bitmap   10000000
data          [(.,0) (..,0)] [] [] [] [] [] [] [] 

creat("/y");

  State of file system (inode bitmap, inodes, data bitmap, data)?

fd=open("/y", O_WRONLY|O_APPEND); write(fd, buf, BLOCKSIZE); close(fd);

  State of file system (inode bitmap, inodes, data bitmap, data)?

link("/y", "/m");

  State of file system (inode bitmap, inodes, data bitmap, data)?

unlink("/m")

  State of file system (inode bitmap, inodes, data bitmap, data)?

creat("/z");

  State of file system (inode bitmap, inodes, data bitmap, data)?

mkdir("/f");

  State of file system (inode bitmap, inodes, data bitmap, data)?
```

A few other flags control various aspects of the simulation, including the
number of inodes ("-i"), the number of data blocks ("-d"), and whether to
print the final list of all directories and files in the file system ("-p").

其他几个标志控制模拟的各个方面，包括 inode 的数量（“-i”）、数据块的数量（“-d”）
以及是否打印文件中所有目录和文件的最终列表 系统（“-p”）。
