package com.qs.controller;

import annotation.Service;
import annotation.Transaction;
import com.qs.pojo.Part;
import com.qs.pojo.User;
import com.qs.vo.PageVo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by liq on 2018/5/20.
 * sqlite只支持库级锁，所以一定要释放sql连接，因为在Transaction中替我们释放了锁
 * 一定要加上@Transaction注解
 */
@Service
public class UserService {

    static Connection c = null;
    static {
        try {
            Class.forName("org.sqlite.JDBC");
            c = DriverManager.getConnection("jdbc:sqlite:" + "C:/sqlite3/qs.db");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 用户登录
     */

    @Transaction
    public User login(String password) {
        User user = new User();
        String sql ="select * from USER WHERE USER_PASSWORD='"+password+"';";
        try {
            Statement stat = c.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while(rs.next()){
                user.setUserName(rs.getString("USER_USERNAME"));
                user.setPassword(rs.getString("USER_PASSWORD"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



    /**
     *更新用户信息
     */
    public void updateUser(String username, String password){
        String sql = "UPDATE USER SET USER_USERNAME='"+username+"',USER_PASSWORD='"+password+"' WHERE USER_ID='"+1+"';";
        try {
            Statement stat = c.createStatement();
            stat.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 新增零件
     */
    public void createPart(Part part){
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO PART ");
        sb.append("(PART_NAME,PART_REMARK,PART_NUM,REMARK,PART_NUM_LIMIT) VALUES (");
        sb.append("'"+part.getPartName()+"', ");
        sb.append("'"+part.getPartRemark()+"', ");
        sb.append(part.getPartNum()+", ");
        sb.append("'"+part.getRemark()+"', ");
        sb.append(part.getPartNumLimit()+")");
        try {
            Statement stat = c.createStatement();
            stat.executeUpdate(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取所有零件列表
     */
    @Transaction
    public List<Part> listPart(PageVo pageVo) {
        int START = pageVo.getStart();
        int SIZE = pageVo.getSize();
        String sql ="select * from PART LIMIT "+START+","+SIZE+";";
        return getPartList(sql);
    }

    /**
     * 查询零件数目
     */
    @Transaction
    public Integer findPartCount(String... searchName){

        StringBuilder sql = new StringBuilder("select COUNT(*) from PART");
        if (searchName.length>0 && !searchName[0].trim().equals("")){
            sql.append(" WHERE PART_NAME LIKE '%"+searchName[0]+"%';");
        }else {
            sql.append(";");
        }
        try {
            Statement stat = c.createStatement();
            ResultSet rs = stat.executeQuery(sql.toString());
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 查找零件
     */
    @Transaction
    public List<Part> searchPart(PageVo pageVo,String searchName){

        int START = pageVo.getStart();
        int SIZE = pageVo.getSize();

        String sql ="select * from PART WHERE PART_NAME LIKE '%"+searchName+"%' LIMIT "+START+","+SIZE+";";
        return getPartList(sql);
    }


    @Transaction
    public List<Part> getPartList(String sql){

        LinkedList<Part> partList = new LinkedList<Part>();
        try {
            Statement stat = c.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while( rs.next()){
                Part part = new Part();
                part.setPartId(rs.getString("PART_ID"));

                part.setPartName(rs.getString("PART_NAME"));
                part.setPartRemark(rs.getString("PART_REMARK"));
                part.setPartNum(rs.getInt("PART_NUM"));
                part.setRemark(rs.getString("REMARK"));
                part.setPartNumLimit(rs.getInt("PART_NUM_LIMIT"));
                partList.add(part);
            }
            return partList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 通过ID查找零件
     */
    @Transaction
    public Part getPartById(String partId){

        if (partId!= null && !partId.trim().equals("")) {
            Part part = new Part();
            String sql = "select * from PART WHERE PART_ID = '" + partId + "';";
            try {
                Statement stat = c.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
                    part.setPartId(rs.getString("PART_ID"));
                    part.setPartName(rs.getString("PART_NAME"));
                    part.setPartRemark(rs.getString("PART_REMARK"));
                    part.setPartNum(rs.getInt("PART_NUM"));
                    part.setRemark(rs.getString("REMARK"));
                    part.setPartNumLimit(rs.getInt("PART_NUM_LIMIT"));
                }
                return part;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
        return null;
    }

    /**
     * 更新零件
     */
    @Transaction
    public void update(Part part){
        if (part.getPartId()!= null && !part.getPartId().trim().equals("")) {
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE PART SET ");
            sb.append("PART_NAME='"+part.getPartName()+"',");
            sb.append("PART_REMARK='"+part.getPartRemark()+"',");
            sb.append("PART_NUM='"+part.getPartNum()+"',");
            sb.append("REMARK='"+part.getRemark()+"',");
            sb.append("PART_NUM_LIMIT='"+part.getPartNumLimit()+"'");
            sb.append(" WHERE PART_ID='"+part.getPartId()+"';");
            try {
                Statement stat = c.createStatement();
                stat.executeUpdate(sb.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 更新零件数量
     */
    public void updateNum(String partId, int num){
        if (num != 0){
            String sql = "UPDATE PART SET PART_NUM="+num+" WHERE PART_ID='"+partId+"';";
            Part part = new Part();
            try {
                Statement stat = c.createStatement();
                stat.executeUpdate(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 删除
     */
    public void deletePartById(String partId){
        if (partId != null && !partId.trim().equals("")){
            String sql = "DELETE FROM PART WHERE PART_ID='+"+partId+"';";
            try {
                Statement stat = c.createStatement();
                stat.executeUpdate(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
