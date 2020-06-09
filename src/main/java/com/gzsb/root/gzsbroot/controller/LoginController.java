package com.gzsb.root.gzsbroot.controller;

import com.google.gson.Gson;
import com.gzsb.root.gzsbroot.dao.entity.Operator;
import com.gzsb.root.gzsbroot.dao.entityX.SystemOperator;
import com.gzsb.root.gzsbroot.execution.RRException;
import com.gzsb.root.gzsbroot.message.BaseMessage;
import com.gzsb.root.gzsbroot.message.LoginMessage;
import com.gzsb.root.gzsbroot.message.Message;
import com.gzsb.root.gzsbroot.service.rabc.OperatorService;
import com.gzsb.root.gzsbroot.utils.GsonUtil;
import com.gzsb.root.gzsbroot.utils.JwtUtils;
import com.gzsb.root.gzsbroot.utils.RedisUtils;
import com.gzsb.root.gzsbroot.utils.Status;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author KW-NLL、Pig Xue
 * @date 2019/10/14.
 */
@RestController
@Api(value = "登录接口",tags = "接口信息",description = "商业相关接口")
public class LoginController extends AbstractController {


    @Resource
    private OperatorService operatorService;
    
    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private RedisUtils redisUtils;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Message login(@RequestParam("username") String username,
                         @RequestParam("password") String password)
            throws BaseMessage {
        if(username==null){
            new RRException("登录名不能为空");
        }
        if(password==null){
            new RRException("密码不能为空");
        }


        // 判断账号密码是否正确
        SystemOperator so =  operatorService.selectOperatorByUsername(username);
        if(so == null){ return Message.newMsg("ERROR","用户名或密码错误");}

        String salt = so.getPasswordSalt();
        // MD5加密码
        String encrypt = DigestUtils.md5Hex(password + salt);
        if(!so.getPassword().equals(encrypt)){return  Message.newMsg("ERROR","用户名或密码错误");}
        if(so.getPlanStatusCode().equals(Status.OPERATOR_1)){return Message.newMsg("ERROR","该账号已被冻结");}
        String token =  jwtUtils.generateToken(so.getOperator());

        // 传入redies必须实现序列化 转为json
        redisUtils.set(token, GsonUtil.GsonString(so),60*60);


        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("expire", jwtUtils.getExpire());
        map.put("systemOperator",so);
        System.err.println("token："+token);
        return Message.success(map);
//            return Message.failure();

    }

    @GetMapping("/logout/{token}")
    @ApiOperation(value = "用户退出", notes = "用户退出登录")
    public Message logout(@PathVariable String token){
        redisUtils.del(token);
        return Message.success();
    }

}
