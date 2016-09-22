# cut命令主要是对字符串进行分割，以行为单位进行处理

# 分割的依据主要有三个：
# 字节：一般用选项-b
# 字符：一般用选项-c
# 自定义分隔符：一般用选项-f

# 选项：
# -b ：以字节为单位进行分割。这些字节位置将忽略多字节字符边界，除非也指定了 -n标志。
# -c ：以字符为单位进行分割。
# -d ：自定义分隔符，默认为制表符。
# -f ：与-d一起使用，指定显示哪个区域。
# -n ：取消分割多字节字符。仅和 -b 标志一起使用。如果字符的最后一个字节落在由 -b标志的 List 参数指示的<br />范围之内，该字符将被写出；否则，该字符将被排除。

# 以字节分割，以下命令可以取得每行第3个字节
echo "1........................................"
who | cut -b 3
# 多字节分割，使用-和，连接，-用来连接连续的位置，逗号连接不连续的位置，其中数字必须从小到大，否则cut在执行时，也会进行重新排序
# 如果-的后面没有数字，比如3-，就会取得第3个字符后面的所有字符（包括第3个字符）
# 如果-的前面没有数字，比如-3，就会取得第3个字符前面的所有字符（包括第3个字符）
echo "2........................................"
who | cut -b 1-4,6
# -n与-b的搭配：一般中文占2个字节，如果单纯的使用-b并不能取得完整的一个汉字，汉字会被拆开，所以就会显示乱码，而-n告诉cut，遇到多字节的编码，不要进行拆分
# 这个命令目前没有成功过
echo "3........................................"
echo "星期一" | cut -bn 3 

# 以字符分割
echo "4........................................"
echo "王青松" | cut -c 1

# 自定义分隔符
echo "5........................................"
echo "wang:qing:song" | cut -d : -f 2 
