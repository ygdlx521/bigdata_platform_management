package online.daliang.backend.controller;

import online.daliang.backend.model.Menu;
import online.daliang.backend.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created on 2020/3/25.
 *
 * @author daliang
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController {
    @Autowired
    MenuService menuService;

//    这里千万不能用前端传过来的数据(比如用户id)，以免是伪造数据
    @GetMapping("/menu")
    public List<Menu> getMenuByUserId() {
        return  menuService.getMenusByUserId();
    }
}
