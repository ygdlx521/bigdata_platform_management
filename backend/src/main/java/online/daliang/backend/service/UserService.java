package online.daliang.backend.service;

import online.daliang.backend.mapper.UserMapper;
import online.daliang.backend.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created on 2020/3/21.
 *
 * @author daliang
 */
@Service
public class UserService implements UserDetailsService {
    @Autowired
    UserMapper userMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username);
        System.out.println(username);
        if(user == null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        return user;
    }
}
