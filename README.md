# 分析Huffman coding及Arithmetic coding


## 霍夫曼編碼

霍夫曼編碼(Huffman Coding)是一種用於無失真資料壓縮的熵編碼（權編碼）演算法，
由美國計算機科學家大衛·霍夫曼（David Albert Huffman）在1952年發明。

藉由根據字頻的大小選定不同編碼長度，來減少編碼總長的期望值，達到資料壓縮的目的。


由於Huffman coding是二進制的編碼，所以可以用二元樹的形式表達。



### 流程


    1. 針對相異字元, 統計其出現的個數。
    2. 為每個字元建立一顆單一節點的樹, 每棵樹的根節點之值為其代表字元的出現個數。
    3. 找出根節點關鍵值最小的兩顆樹。
    4. 產生一個根節點, 並將找到的兩棵樹分別當作此根節點的左右子樹, 而根節點的關鍵值為左右子樹節點的合。
    5. 重複步驟 3 與 4 , 直至全部合併為一棵樹。
    6. 在 Huffman Tree 中, 針對每個節點, 
       將連至左子樹的邊標為0, 將連至右子樹的邊標示為1。
    7. 針對每個由根節點至葉節點的路徑, 將其所經過邊的標示連結起來, 
       並指派給對應葉節點所代表的字元, 此即 Huffman Code。
 


## 算術編碼

算術編碼（Arithmetic Coding）是Rissanen 於1979年所提出的一種壓縮方法，以一實數來表示壓縮字串。

將一段message利用一個0到1間的區間來表示，當這個message越長，用來表示這個message的區間就越小，那要表示這個message的bit數就變多。

相同的文字在message出現越多，區間變小的速度比較慢所以可以達到資料壓縮的效果。隨著符號序列長度之增加，其算數編碼長度之entropy趨近於無雜訊編碼理論之極限(效率愈高)






### 流程

    1.　建立字元出現頻率表
    2.　依序取入一個字元 ch 進行編碼
    3.　首先計算目前區間長度(range = high - low)，以 high 為 upper bound 與 low 為 lower bound 包圍。
    4.　依字元出現的頻率以及累計次數來計算一個在目前區間的範圍內的一個新區間。
    5.　以二進制計算一個實數，其值於此新區間內，來代表編至目前的字串。
    6.　若為 Adaptive 編碼，針對 ch 將其出現次數加一。
    7.　重覆 步驟2 直至所有的字元皆編碼完畢。
    8.　最後編入一個自定的 End_of_sequence 編碼完成。



## Usage

1. 將Source code及Header files進行編譯

```
$ make

```

2. 執行程式

算術編碼

```
./bin/arcd -e <'file1' |tee 'file2'	//file1為欲Encode的檔案 file2為Encode後的檔案
./bin/arcd -d <'file2' |tee 'file3'	//file2為欲Decode的檔案 file3為Decode後的檔案

```

霍夫曼編碼

```
./bin/huffman -i 'file1' -o 'file2' -c 	//file1為欲Encode的檔案 file2為Encode後的檔案
./bin/huffman -i 'file2' -o 'file3' -c 	//file2為欲Decode的檔案 file3為Decode後的檔案

```

在encode及decode之後，檔案結尾會附上這次encode/decode所花費的時間。


## 參考資訊

1. [程式札記:[知識小學堂]字串演算法:Huffman code](http://puremonkey2010.blogspot.com/2011/02/huffman-code.html)

2. [演算法 Term Project - 算術編碼](https://par.cse.nsysu.edu.tw/~homework/algo01/8934609/index.html)