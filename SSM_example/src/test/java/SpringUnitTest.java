import com.hys.ssm.bean.Dept;
import com.hys.ssm.bean.Emp;
import com.hys.ssm.mapper.DeptMapper;
import com.hys.ssm.mapper.EmpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author hys
 * @create 2022-07-11
 * @project_name SSM
 * 搭配spring的单元测试环境
 * 1.导入依赖
 * 2.添加注解：
 *   2.1 ContextConfiguration 指定spring配置文件，生成ioc容器
 *   2.2 RunWith 用什么类来运行@Test
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class SpringUnitTest {

    @Autowired
    SqlSession sqlSession;




    @Test
    public void test1(){
        //for循环，批量新增emp数据
        EmpMapper empMapper = sqlSession.getMapper(EmpMapper.class);
        for (int i = 0 ; i < 1 ; i++){
            String uuid = UUID.randomUUID().toString().substring(0,5);
            empMapper.insertSelective(new Emp(null,uuid,"男",uuid+"@qq.com",1));
        }
    }

    @Test
    public void test2(){
        DeptMapper mapper = sqlSession.getMapper(DeptMapper.class);
        List<Dept> depts = mapper.selectByExample(null);
        System.out.println(depts);
    }


    @Test
    public void test3(){
        char a = '黄';
        System.out.println((int) a);
    }
}

