package com.gzsb.root.gzsbroot.controller.rabc;

import com.gzsb.root.gzsbroot.controller.AbstractController;
import com.gzsb.root.gzsbroot.dao.entity.Permission;
import com.gzsb.root.gzsbroot.dao.entity.RolePermission;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.rabc.PermissionService;
import com.gzsb.root.gzsbroot.service.rabc.RolePermissionService;
import com.gzsb.root.gzsbroot.utils.PageUtils;
import com.gzsb.root.gzsbroot.utils.Verify;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

/**
 * @author KW-NLL、PigXue
 * @date 2019/10/14.
 */
@RestController
@RequestMapping("/rbac/permission")
@Api(tags = "权限模块")
public class PermissionController extends AbstractController {
    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RolePermissionService rolePermissionService;


    int result = 0;

    /**
     * 查询全部的权限分页
     * @return
     */
    //@RequiresPermissions("PERMISSION")
    @ApiOperation(value = "查询权限", notes = "查询全部的权限", httpMethod = "POST")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public Message list(
            @RequestParam Integer pageIndex,
            @RequestParam Integer limit
    ) {
        return Message.success(PageUtils.page(permissionService.findAll(pageIndex, limit)));
    }

    /**
     * 查询角色列表
     * @return
     */
    //@RequiresPermissions("PERMISSION")
    @RequestMapping(value = "/userlist", method = RequestMethod.POST)
    public Message userList() {
        return Message.success(PageUtils.page(permissionService.findUserAll(1, 5)));
    }

    /**
     * 添加权限
     * @param permission
     * @return
     */
    @PostMapping("/add")
    @ApiOperation(value = "添加权限",notes = "添加权限的功能",httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "permission",value = "参数1", required = true, paramType = "Permission"),
    })
    public Message add(@RequestBody Permission permission) {
        result = permissionService.insertPermission(permission);
        return Verify.comeVerify(result);

    }

    /**
     * 删除权限
     * @param permissionCode
     * @return
     */
    @DeleteMapping("/delete/{permissionCode}")
    @ApiOperation(value = "删除权限",notes = "根据权限编码删除",httpMethod = "DELETE")
    @ApiImplicitParam(name = "permissionCode",value = "权限id",required = true,paramType = "String")
    public Message delete(@PathVariable String permissionCode) {
        result = permissionService.deletePermission(permissionCode);
        return Verify.comeVerify(result);
    }

    /**
     * 给角色添加权限
     * @param rolePermission
     * @return
     */
    @PostMapping("/addPermission")
    public Message addPermission(@RequestBody RolePermission rolePermission) {
        result = rolePermissionService.addRoleAndPermission(rolePermission);
        return Verify.comeVerify(result);
    }

    /**
     * 更新权限
     * @param rolePermission
     * @return
     */
    @PostMapping("/update")
    public Message update(@RequestBody Permission rolePermission){
        result = rolePermissionService.updateRolePermission(rolePermission);
        return Verify.comeVerify(result);
    }

    /**
     * 查询所有权限不分页
     * @return
     */
    @GetMapping("/findAll")
    public Message findAll(){
        return Message.success(permissionService.findAllPermission());
    }

    /**
     * 根据角色编码查询该角色所有权限
     * @param roleCode
     * @return
     */
    @GetMapping("/findAllRolePermission/{roleCode}")
    public Message findAllRolePermission(@PathVariable String roleCode){
        return Message.success(rolePermissionService.findAllRolePermission(roleCode));
    }

}
