import com.hys.mybatis.mapper.EmpMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author hys
 * @create 2022-07-11
 * @project_name SSM
 * 此去经年，应是良辰好景相送，可予故人情。
 */
public class MybatisTest {
    @Test
    public void test1() throws IOException {
        InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory build = new SqlSessionFactoryBuilder().build(is);
        SqlSession sqlSession = build.openSession();
        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
    }
}
