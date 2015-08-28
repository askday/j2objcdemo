//
//  Test.h
//  J2ObjCDemo
//
//  Created by wangxiang on 15/7/6.
//  Copyright (c) 2015年 wangxiang. All rights reserved.
//

package NTJava;

//引用来自oc的头文件
/*-[
 #import "ApplicationTools.h"
 ]-*/

import java.lang.reflect.Field;
import java.lang.reflect.Method;

class Test  extends BaseTools implements MyInterface{
    private Other other;
    public Test(){
        System.out.println("test‘s consturct function");
    }
    
    public void doSomething(){
        System.out.println("test do something");
    }
    
    //java 调用oc代码
    public native void doSomethingUseOC()/*-[
                                     NSLog(@"test dosomething");
                                     
                                     [[ApplicationTools tools] showMessage:@"java doSomethingUseOC"];
                                     ]-*/;
    
    //线程测试
    public void doThreadTest(){
        Thread thread = new Thread(new Runnable() {
            
            @Override
            public void run() {
                // TODO Auto-generated method stub
                int i=0;
                long start = System.currentTimeMillis();
                while(i<100000){
                    System.out.println(i++);
                };
                System.out.println("use time:"+ (System.currentTimeMillis() - start));
            }
        });
        thread.start();
    }
    
    //反射测试
    public void doReflectionTest(){
        System.out.println("Reflection Test");
        if (other == null){
            other = new Other();
        }
        Class<?> otherClass = other.getClass();
        System.out.println(otherClass.getPackage()+"|"+otherClass.getName());
        System.out.println("get other class method");
        Method[] method = otherClass.getMethods();
        for(int i=0;i<method.length;i++){
            System.out.println(method[i].getName().toString());
        }
        
        System.out.println("get other class fields");
        Field[] fields = otherClass.getFields();
        for(int i=0;i<fields.length;i++){
            System.out.println(fields[i].getName());
        }
    }
    
    //性能测试代码
    public void doPerfanmenceTest(){
        int i=0;
        while(i<100000){
            System.out.println(i++);
        }
    }
    
    @Override
    public void onClick() {
        // TODO Auto-generated method stub
        System.out.println("MyInterface onclick");
    }
}
