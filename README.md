# aes128-verilog

文件夹control：
    ./controlTst：为运行文件，显示打印明文、密钥、密文和解密后的内容
    controlTst.v：为测试文件
    control.v   ：为整个aes的控制文件，加密、解密模块都在此文件内编写
    rotate.v    ：进行矩阵的转置
    makefile    ：编译过程文件

文件夹Add：
    Add.v：轮密钥加

文件夹kExtend：
    kExtend.v ：密钥扩展
    g.v	      ：密钥扩展中的g函数

文件夹Mix：
    MixC.v	    ：列混淆变换
    Matrix_dat.txt  ：加密过程中需要的正向矩阵
    Matrix-1_dat.txt：解密过程中需要的逆向矩阵
    (PS:MixC.v需要改变Matrix_dat.txt和Matrix-1_dat.txt的地址）

文件夹SBox：
    byte2S.v	：字节代替
    S_dat.txt	：S盒正向变换
    S-1_dat.txt ：S盒逆向变换
    (PS:byte2S.v需要改变S_dat.txt和S-1_dat.txt的地址)

文件夹shift：
    shiftL.v	：行移位

注：
*Tst.v文件为测试文件
aes128模块为control.v文件
controlTst为aes128测试程序
