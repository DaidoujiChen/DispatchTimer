DispatchTimer
=============

It is base on Dispatch Timer Source. Make it like NSTimer to use.

DaidoujiChen

daidoujichen@gmail.com

總覽
=============

DispatchTimer 使用的切入點與 NSTimer 類似, 不過有些許的功能我覺得使用上會比 NSTimer 來得方便,
比如說直接可以代入 block 執行, 可以選擇多久以後開始執行, 或是即刻執行一次...等等的.

根據其功能性, 我把他們做了幾個分類

- 主線程執行 (OnMainThread) / 背景執行 (InBackground)
  - 即刻執行, 並且每 x 秒再執行一次 (Immediately)
  - x 秒後執行, 並且每 y 秒再執行一次 (AfterDelay)
  - x 秒後執行一次即停止 (Once)

可以依照使用的情況, 選擇最佳的用法.

支援
=============

- 只支援 ARC.

簡易使用
=============

- 將 DispatchTimer 加入至專案內, 並且 import 至需要使用的地方.

如同, NSTimer, DispatchTimer 的初始化方法如下

```
    myTimer = [DispatchTimer scheduledInBackgroundImmediatelyWithTimeInterval:2.0f block:^{
        NSLog(@"%@", self);
    }];
```

即可在背景立即執行 block 內的 code, 並且每 2 秒再執行一次, 另為

```
    myTimer = [DispatchTimer scheduledOnMainThreadAfterDelay:5.0f timeInterval:1.0f block:^{
        NSLog(@"%@", self);
    }];
```

則是 delay 5 秒之後, 在主線程執行一次, 之後每 1 秒再繼續的執行, 最後, 如同 NSTimer, DispatchTimer 在結束時也必須執行

```
    [myTimer invalidate];
```

代表任務已經結束.

須知
=============
需要注意的地方是, 如同 NSTimer, 如果你某個物件內的 timer 還在跑, 而沒有使用 invalidate 結束他的話,
會導致該一個物件無法結束, 無法走到 dealloc 的地方, crash 或是 memory leak 的事情都有可能會發生.





