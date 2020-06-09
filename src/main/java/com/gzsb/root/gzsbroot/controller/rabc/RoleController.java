package com.gzsb.root.gzsbroot.controller.rabc;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Role;
import com.gzsb.root.gzsbroot.dao.entity.RolePermission;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.rabc.RolePermissionService;
import com.gzsb.root.gzsbroot.service.rabc.RoleService;
import com.gzsb.root.gzsbroot.utils.PageUtils;
import com.gzsb.root.gzsbroot.utils.Verify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author KW-NLL、Pig Xue
 * @date 2019/10/14.
 */
@RestController
@RequestMapping("/rbac/role")
public class RoleController extends AbstractController {

    @Autowired
    private RoleService roleService;

    int result = 0;

    @Autowired
    private RolePermissionService rolePermissionService;

    /**
     * 查询所有角色
     * @param pageIndex
     * @param limit
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    //@RequiresPermissions("ROLE")
    public Message list(@RequestParam Integer pageIndex,
                        @RequestParam Integer limit) {
        return Message.success(PageUtils.page(roleService.findRoleAll(pageIndex, limit)));
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    @PostMapping("/add")
    public Message add(@RequestBody Role role) {
       result= roleService.addRole(role);
       return Verify.comeVerify(result);
    }


    /**
     * 删除角色
     * @param roleCode
     * @return
     */
    @DeleteMapping("/delete/{roleCode}")
    public Message deleteRole(@PathVariable String roleCode){
     return Verify.comeVerify(roleService.deleteRole(roleCode));
    }

    /**
     * 添加角色权限
     * @param rolePermission
     * @return
     */
    @PostMapping("/addRolePermission")
    public Message addRolePermission(@RequestBody RolePermission rolePermission){
        rolePermissionService.addRolePermission(rolePermission);
        return Message.success();
    }
}
