package com.passionStudy.passion.manager.model.dao;

import static com.passionStudy.passion.common.JDBCtemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.passionStudy.passion.manager.model.vo.ManagerCouponVo;

public class ManagerCouponDao {
	private Properties prop = new Properties();
	
	public ManagerCouponDao() {
		String fileName = ManagerCouponDao.class.getResource("sql/manager/managerCoupon-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<ManagerCouponVo> listCoupon(Connection conn, String memNo){
		
		ArrayList<ManagerCouponVo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectCoupon");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ManagerCouponVo mcv = new ManagerCouponVo();
				mcv.setCouponNo(rs.getInt("COUPON_NO"));
				mcv.setMemNo(rs.getInt("MEMBER_NO"));
				mcv.setCouponName(rs.getString("COUPON_NAME"));
				mcv.setCouponValid(rs.getString("COUPON_VALID"));
				mcv.setCouponDate(rs.getDate("Member_Date"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
}
