# MakeCallDemo
一个分类实现拨打电话，并且可以获取到是否点击了通话按钮
具体使用方式，倒入分类文件NSString+MakeCall
使用代码如下：
```
  [@"187XXXX6789" WZ_makeCall:^(BOOL success) {
        //点击了呼叫按钮了，回调会返回成功标示
   }];
 ```
 便可以弹出拨打电话的提示框，询问是否拨打电话。
 
 具体文章可见：[简书地址](http://www.jianshu.com/p/cdb364f50976)
