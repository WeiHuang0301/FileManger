//
//  ViewController.swift
//  appNew
//
//  Created by mac on 2023/5/23.
//  Copyright © 2023年 WeiiH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var src, dst: String
        
        // 設定工作目錄
        let fm = FileManager.default
        let path = NSHomeDirectory() + "/Documents"
        
        
        
        
        // ＠21-1 與目錄有關的操作 (資料夾？？)
        //---------------------------------
        // 建立目錄
        src = path + "/dir1"
        
        do {
            try fm.createDirectory(atPath: src, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Failed. Msg: 建立 dir1 目錄失敗")
        }
        
        //---------------------------------
        // 複製目錄
        src = path + "/dir1"
        dst = path + "/dir2"
        
        do {
            try fm.copyItem(atPath: src, toPath: dst)
        } catch {
            print("Failed. Msg: 複製目錄失敗")
        }
        
        //---------------------------------
        // 移動目錄 或 更改名稱
        src = path + "/dir2"
        dst = path + "/dir3"
        
        do {
            try fm.moveItem(atPath: src, toPath: dst)
            
        } catch {
            print("Failed. Msg: 移動目錄失敗")
        }
        
        //---------------------------------
        // 刪除目錄
        dst = path + "/dir3"
        do {
            try fm.removeItem(atPath: dst)
        } catch {
            print("Failed. Msg: 刪除目錄失敗")
        }
        
        //---------------------------------
        // 檢察檔案是否存在
        dst = path + "/dir3"
        if fm.fileExists(atPath: dst) {
            print("目錄存在")
        } else {
            print("目錄不存在")
        }
        print(path)
        
        
        
        // ＠21-２ 與檔案有關的操作
        //---------------------------------
        // 建立 a.txt 並寫入 Hello Oberon
        src = path + "/a.txt"
        let data = "Hello Oberon!".data(using: .utf8)
        if fm.createFile(atPath: src, contents: data, attributes: nil) {
            print("檔案建立成功")
        } else {
            print("檔案建立失敗")
        }
        
        //---------------------------------
        // 複製檔案
        src = path + "/a.txt"
        dst = path + "/b.txt"
        do {
            try fm.copyItem(atPath: src, toPath: dst)
        } catch {
            print("複製檔案失敗")
        }
        
        //---------------------------------
        // 移動檔案或更改名稱
        src = path + "/A.txt"
        dst = path + "/B.txt"
        do {
            try fm.moveItem(atPath: src, toPath: dst)
        } catch {
            print("移動檔案失敗")
        }
        
        //---------------------------------
        // 刪除 c.txt 檔案
        src = path + "/c.txt"
        do {
            try fm.removeItem(atPath: src)
        } catch {
            print("Failed. Msg: 刪除檔案失敗")
        }
        
        //---------------------------------
        // 檢察檔案是否存在
        src = path + "/c.txt"
        if fm.fileExists(atPath: src) {
            print("檔案存在")
        } else {
            print("檔案不存在")
        }
        
        print("***final path: \(path)")
         
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

