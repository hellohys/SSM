package com.hys.ssm.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author hys
 * @create 2022-07-13
 * @project_name SSM
 */
public class Msg {
    //状态码  0-代表失败 1-代表成功
    private int code;
    private String info;
    private Map<String,Object> extend = new HashMap<>();

    public Msg() {
    }

    public Msg(int code, String info, Map<String, Object> extend) {
        this.code = code;
        this.info = info;
        this.extend = extend;
    }

    public static Msg success(){
        Msg result = new Msg();
        result.code = 1;
        result.info = "处理成功";
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.code = 0;
        result.info = "处理失败";
        return result;
    }

    public Msg add(String key,Object value){
        this.extend.put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
