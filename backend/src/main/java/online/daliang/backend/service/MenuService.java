package online.daliang.backend.service;

import online.daliang.backend.mapper.MenuMapper;
import online.daliang.backend.model.Menu;

import online.daliang.backend.model.User;
import org.omg.IOP.ServiceContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created on 2020/3/25.
 *
 * @author daliang
 */
@Service
public class MenuService {
    @Autowired
    MenuMapper menuMapper;
    public List<Menu> getMenusByUserId() {
        return menuMapper.getMenusByUserId(
                ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId()
        );
    }
}
