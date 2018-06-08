package com.qs.controller;

import annotation.Controller;
import annotation.Inject;
import annotation.RequestMapping;
import com.qs.pojo.Part;
import com.qs.pojo.User;
import com.qs.util.MD5Util;
import com.qs.vo.PageVo;
import core.ServletCore;
import model.Json;
import model.ModelAndView;
import model.Param;
import util.CollectionUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liq on 2018/5/20.
 */
@Controller
public class UserController {

    @Inject
    UserService userService;

    @RequestMapping(path="/")
    public ModelAndView toLogin(){
        return new ModelAndView("login.jsp", null);
    }

    /**
     * 登录
     */
    @RequestMapping(path="/login")
    public ModelAndView login(Param param){

        if (param.getFieldMap().containsKey("password")){
            String password = (String) param.getFieldMap().get("password");
            User user = userService.login(MD5Util.getMd5(password));

            if (user != null){
                ServletCore.setSessionAttribute("user", user);
                return new ModelAndView("index.jsp", null);
            }
        }
        return new ModelAndView("login.jsp", null);
    }


    /**
     * 转向密码编辑页面
     */
    @RequestMapping(path = "/toUpdatePassword")
    public ModelAndView toUpdatePassword(){
        User user = ServletCore.getSessionAttribute("user");
        if (user != null){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("user", user);
            return new ModelAndView("password.jsp", map);
        }
        return new ModelAndView("password.jsp", null);
    }

    /**
     * 更改用户信息
     */
    @RequestMapping(path = "/updateUser")
    public Json updateUser(Param param){
        String username = "";
        String password = "";
        if (param.getFieldMap().containsKey("username")){
            username = (String) param.getFieldMap().get("username");
        }
        if (param.getFieldMap().containsKey("password")){
            password = (String) param.getFieldMap().get("password");
        }
        userService.updateUser(username, MD5Util.getMd5(password));
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        ServletCore.setSessionAttribute("user", user);
        return new Json(username);
    }

    /**
     * 转向新增页面
     */
    @RequestMapping(path = "/toCreatePart")
    public ModelAndView toCreatePart(){
        return new ModelAndView("create.jsp", null);
    }

    /**
     * 新增零件
     */
    @RequestMapping(path = "/createPart")
    public Json createPart(Param param){
        Part part = new Part();
        if (CollectionUtil.isNotEmpty(param.getFieldMap())) {
            part.setPartName((String) param.getFieldMap().get("partName"));
            part.setPartRemark((String) param.getFieldMap().get("partRemark"));
            part.setPartNum(Integer.parseInt((String) param.getFieldMap().get("partNum")));
            part.setRemark((String) param.getFieldMap().get("remark"));
            part.setPartNumLimit(Integer.parseInt((String)param.getFieldMap().get("partNumLimit")));
            userService.createPart(part);

        }
        return new Json(part.getPartName());
    }
    /**
     *按页获取零件信息
     */
    public PageVo getPartPage(Param param){
        PageVo pageVo = new PageVo();
        int currentPage = 1;
        if (param.getFieldMap().containsKey("currentPage")){
            currentPage = Integer.valueOf((String) param.getFieldMap().get("currentPage"));
        }
        pageVo.setCurrentPage(currentPage);
        int start = (currentPage-1) * pageVo.getSize();//最后一页的最后一个，sql刚好+1行
        pageVo.setStart(start);
        //查询分页零件和零件总数
        List<Part> partList = userService.listPart(pageVo);
        Integer total = userService.findPartCount();
        //设置总条目数，页数，零件列表
        pageVo.setTotal(total);
        pageVo.setPageCount((int) Math.ceil((float)total/pageVo.getSize()));
        pageVo.setPartList(partList);
        return pageVo;
    }
    /**
     * 列出所有零件信息
     */
    @RequestMapping(path = "/listPart")
    public ModelAndView listPart(Param param){
        PageVo pageVo = getPartPage(param);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", pageVo);
        return new ModelAndView("list.jsp", map);
    }

    /**
     * 删除零件列表页面
     */
    @RequestMapping(path = "/listDeletePart")
    public ModelAndView listDeletePart(Param param){

        PageVo pageVo = getPartPage(param);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", pageVo);
        return new ModelAndView("delete.jsp", map);
    }


    /**
     * 搜索零件
     */
    @RequestMapping(path = "/searchPart")
    public ModelAndView searchPart(Param param){

        //根据参数搜索分页信息
        PageVo pageVo = searchPartPage(param);
        if (pageVo != null){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", pageVo);
            return new ModelAndView("list.jsp", map);
        }else{
            //查全部列表
            return new ModelAndView("/listPart?currentPage=1", null);
        }
    }

    /**
     * 删除页面搜索
     */
    @RequestMapping(path = "/deletePartSearch")
    public ModelAndView deletePartSearch(Param param) {
        //根据参数搜索分页信息
        PageVo pageVo = searchPartPage(param);
        if (pageVo != null){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("page", pageVo);
            return new ModelAndView("delete.jsp", map);
        }else{
            //查全部列表
            return new ModelAndView("/deletePartList?currentPage=1", null);
        }
    }

    /**
     * 根据参数搜索分页信息
     */
    public PageVo searchPartPage(Param param) {
        String searchName = (String) param.getFieldMap().get("searchName");
        if (searchName != null && !searchName.trim().equals("")) {

            PageVo pageVo = new PageVo();
            int currentPage = 1;
            if (param.getFieldMap().containsKey("currentPage")) {
                currentPage = Integer.valueOf((String) param.getFieldMap().get("currentPage"));
            }
            pageVo.setCurrentPage(currentPage);

            int start = (currentPage - 1) * pageVo.getSize();//最后一页的最后一个，sql刚好+1行
            pageVo.setStart(start);
            //查询分页零件和零件总数
            List<Part> partList = userService.searchPart(pageVo, searchName);
            Integer total = userService.findPartCount(searchName);
            //设置总条目数，页数，零件列表
            pageVo.setTotal(total);
            int pageCount = (int) Math.ceil((float) total / pageVo.getSize());

            pageVo.setPageCount(pageCount);
            pageVo.setPartList(partList);
            return pageVo;
        }else {
            return null;
        }
    }
    /**
     * 通过id查找零件
     */
    @RequestMapping(path = "/editPart")
    public Json getPartById(Param param){

        String partId = (String) param.getFieldMap().get("partId");
        Part part = null;
        if (partId != null && !partId.trim().equals("")){
            part = userService.getPartById(partId);
        }
        return new Json(part);
    }

    /**
     * 更新零件信息
     */
    @RequestMapping(path = "/updatePart")
    public Json updatePart(Param param){
        if (CollectionUtil.isNotEmpty(param.getFieldMap())) {
            Part part = new Part();
            part.setPartId((String) param.getFieldMap().get("partId"));
            part.setPartName((String) param.getFieldMap().get("partName"));
            part.setPartRemark((String) param.getFieldMap().get("partRemark"));
            part.setPartNum(Integer.parseInt((String) param.getFieldMap().get("partNum")));
            part.setRemark((String) param.getFieldMap().get("remark"));
            part.setPartNumLimit(Integer.parseInt((String)param.getFieldMap().get("partNumLimit")));
            userService.update(part);
        }
        return null;
    }

    /**
     * 更新零件数目
     */
    @RequestMapping(path = "/updatePartNum")
    public Json updatePartNum(Param param){

        String partId = "";
        if (param.getFieldMap().containsKey("partId")) {
            partId = (String) param.getFieldMap().get("partId");
        }
        int outPutNum = 0;
        int inPutNum = 0;
        if (param.getFieldMap().containsKey("outPutNum")) {
            outPutNum = Integer.parseInt((String) param.getFieldMap().get("outPutNum"));
        }
        if (param.getFieldMap().containsKey("inPutNum")) {
            inPutNum = Integer.parseInt((String) param.getFieldMap().get("inPutNum"));
        }

        Part part = userService.getPartById(partId);
        if (outPutNum != 0){
            userService.updateNum(partId, part.getPartNum()-outPutNum);
            part.setPartNum(part.getPartNum()-outPutNum);
        }
        if (inPutNum != 0){
            userService.updateNum(partId, part.getPartNum()+inPutNum);
            part.setPartNum(part.getPartNum()+inPutNum);
        }
        return new Json(part);
    }

    /**
     * 删除零件
     */
    @RequestMapping(path = "/deletePart")
    public Json deletePart(Param param){
        String partId = "";
        if (param.getFieldMap().containsKey("partId")) {
            partId = (String) param.getFieldMap().get("partId");
        }
        userService.deletePartById(partId);
        return new Json(null);
    }
}
