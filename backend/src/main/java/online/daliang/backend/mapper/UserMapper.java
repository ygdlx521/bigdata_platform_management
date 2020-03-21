package online.daliang.backend.mapper;

import online.daliang.backend.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * Created on 2020/3/21.
 *
 * @author daliang
 */
@Mapper
@Component(value ="UserMapper")
public interface UserMapper {
    User loadUserByUsername(String username);
}
