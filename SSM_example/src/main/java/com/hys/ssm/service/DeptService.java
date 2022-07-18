package com.hys.ssm.service;

import com.hys.ssm.bean.Dept;
import com.hys.ssm.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hys
 * @create 2022-07-14
 * @project_name SSM
 */
@Service
public class DeptService {
    @Autowired
    DeptMapper deptMapper;
    public List<Dept> getAllDept(){
        return deptMapper.selectByExample(null);
    }

}
