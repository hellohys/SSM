package com.hys.ssm.controller;

import com.hys.ssm.bean.Dept;
import com.hys.ssm.bean.Msg;
import com.hys.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author hys
 * @create 2022-07-14
 * @project_name SSM
 */
@Controller
public class DeptController {
    @Autowired
    DeptService deptService;
    //提交测试
    //提交测试2
    @RequestMapping("/getDept")
    @ResponseBody
    public Msg getDepts(){
        List<Dept> depts = deptService.getAllDept();
        return Msg.success().add("depts", depts);
    }
}
