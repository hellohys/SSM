package com.hys.ssm.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hys.ssm.bean.Dept;
import com.hys.ssm.bean.Emp;
import com.hys.ssm.bean.Msg;
import com.hys.ssm.service.DeptService;
import com.hys.ssm.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author hys
 * @create 2022-07-12
 * @project_name SSM
 */
@Controller
public class EmpController {
    //这里如果在spring配置文件中exclude掉controller包的话就不会扫描此处，也就是会导致无法Autowired自动注入
    @Autowired
    EmpService empService;

    @Autowired
    DeptService deptService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum){
        PageHelper.startPage(pageNum,5);
        List<Emp> emps = empService.getAll();
        PageInfo<Emp> empPageInfo = new PageInfo<>(emps,5);
        return Msg.success().add("empPageInfo",empPageInfo);
    }

    @RequestMapping(value = "/addEmp",method = {RequestMethod.POST})
    @ResponseBody
    public Msg addEmp(@Valid Emp emp, BindingResult result){
//        System.out.println(emp);
//        System.out.println(result.hasErrors());
//        for (FieldError fieldError : result.getFieldErrors()) {
//            System.out.println(fieldError.getField());
//        }
        return empService.add(emp)?Msg.success():Msg.fail();
    }



    /**
     * 后端正则判断
     * @param email
     * @return
     */
    @RequestMapping(value = "/checkEmail")
    @ResponseBody
    public Msg checkEmail(@RequestParam("email") String email){
        String reg = "^[a-z\\d]+(\\.[a-z\\d]+)*@([\\da-z](-[\\da-z])?)+(\\.{1,2}[a-z]+)+$";
        return email.matches(reg)?Msg.success():Msg.fail();
//        if (email.matches(reg)){
//            return Msg.success();
//        }else {
//            Map<String,Object> map = new HashMap<>();
//            String errorInfo = "email格式错误！";
//            return Msg.fail().add("error",errorInfo);
//        }
    }

    @RequestMapping(value = "/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName){
        String reg = "(^[a-z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if (!empName.matches(reg)){
            return Msg.fail().add("format", false);
        }else {
            return empService.hasEmpName(empName)?Msg.fail().add("exists", true):Msg.success();
        }
    }

    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpByEmpNameAndGetDept(@PathVariable("empId") Integer empId){
        List<Emp> emps = empService.getEmpByEmpId(empId);
        Emp emp = emps.get(0);
        List<Dept> allDept = deptService.getAllDept();
        return Msg.success().add("emp", emp).add("allDept", allDept);
    }

    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateByEmpId(Emp emp){
        empService.updateEmp(emp);
        return Msg.success();
    }

    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteByEmpID(@PathVariable("empId") String empId){
        List<Integer> idsList = new ArrayList<>();
        String[] ids = empId.split("-");
        if(empId.contains("-")){
            for (String id : ids) {
                idsList.add(Integer.parseInt(id));
            }

        }else{
            idsList = Arrays.asList(Integer.parseInt(empId));
        }
        return empService.deleteById(idsList)>0?Msg.success():Msg.fail();
    }


}