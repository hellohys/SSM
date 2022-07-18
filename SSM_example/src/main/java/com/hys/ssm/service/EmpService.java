package com.hys.ssm.service;

import com.hys.ssm.bean.Emp;
import com.hys.ssm.bean.EmpExample;
import com.hys.ssm.mapper.EmpMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hys
 * @create 2022-07-12
 * @project_name SSM
 */
@Service
public class EmpService {

    @Autowired
    EmpMapper empMapper;



    public List<Emp> getAll(){
        return empMapper.selectByExampleWithDept(null);
    }



    public boolean add(Emp emp){
        EmpExample empExample = new EmpExample();
        empExample.createCriteria().andEmpNameEqualTo(emp.getEmpName());
        List<Emp> emps = empMapper.selectByExample(empExample);
        if (emps.isEmpty()){
            empMapper.insertSelective(emp);
            return true;
        }else {
            return false;
        }
    }

    public boolean hasEmpName(String empName){
        EmpExample empExample = new EmpExample();
        empExample.createCriteria().andEmpNameEqualTo(empName);
        long existsCount = empMapper.countByExample(empExample);
        return existsCount>0;
    }

    public List<Emp> getEmpByEmpId(Integer empId){
        EmpExample empExample = new EmpExample();
        empExample.createCriteria().andEmpIdEqualTo(empId);
        List<Emp> emps = empMapper.selectByExample(empExample);
        return emps;
    }

    public int deleteById(List<Integer> ids) {
        EmpExample empExample = new EmpExample();
        empExample.createCriteria().andEmpIdIn(ids);
        return empMapper.deleteByExample(empExample);
    }

    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }
}
